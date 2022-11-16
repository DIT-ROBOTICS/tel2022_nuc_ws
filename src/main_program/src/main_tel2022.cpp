#include <ros/ros.h>
#include <tf/tf.h>
#include <tf2/utils.h>
#include <geometry_msgs/Pose2D.h>
#include <std_msgs/Bool.h>
#include <std_msgs/Char.h>
#include <std_msgs/Int32.h>
#include <std_msgs/Int64.h>
#include <std_msgs/Float32.h>
#include <std_msgs/Float32MultiArray.h>
#include <nav_msgs/Odometry.h>
#include <nav_msgs/GetPlan.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>
#include <ros/package.h>
#include <std_srvs/Empty.h>
#include <std_srvs/Trigger.h>
#include <main_program/mission.h>

#include <iostream>
#include <stdlib.h>
#include <vector>
#include <math.h>
#include <iostream>
#include <fstream>

using namespace std;

enum Status
{
    SETUP = 0,
    RUN,
    FINISH
};

// Global Variable Define Before Class Define

double mission_waitTime;
double waitTime_Normal;
vector<double> path_tracker_paramDefault;

// Class Define

class state
{
private:
    pair<double, double> position;
    int condition;
    int result;
    geometry_msgs::Pose target;

public:
    state(pair<double, double> position, int condition, int result, geometry_msgs::Pose target)
    {
        this->position = position;
        this->condition = condition;
        this->result = result;
        this->target = target;
    }

    double getPosition(char vector)
    {
        if (vector == 'x')
        {
            return position.first;
        }
        else if (vector == 'y')
        {
            return position.second;
        }
        else
        {
            return -1;
        }
    }

    int getCondition()
    {
        return condition;
    }

    int getResult()
    {
        return result;
    }

    geometry_msgs::Pose getTarget()
    {
        return target;
    }

    void printOut()
    {
        cout << "Position : [" << position.first << "," << position.second
             << "] Condition : " << condition
             << " Result : " << result
             << " Target : [" << target.position.x << "," << target.position.y << "]\n";
    }
};

// Variable Define

int run_state = 0;
int now_Status = SETUP;

bool moving = false;
bool doing = false;
bool finish_mission = false;
bool mission_camera = false;
bool mission_1 = false;
bool mission_2 = false;
bool mission_3 = false;

double position_x = 0.1;
double position_y = 0.1;
double orientation_z = 0;
double orientation_w = 0;
double startMissionTime;

geometry_msgs::Pose next_target;
geometry_msgs::PoseStamped output_target;
geometry_msgs::Point t_block;
geometry_msgs::Point e_block;
geometry_msgs::Point l_block;

main_program::mission get_block;

vector<state> state_list;

// Function Define

bool checkPosition(double x, double y)
{
    if (pow(pow((x - position_x), 2) + pow((y - position_y), 2), 0.5) <= 0.02)
    {
        return true;
    }
    else
    {
        return false;
    }
}

void doMission(ros::Publisher pub1, ros::Publisher pub2, ros::ServiceClient cli, int index)
{
    int missionType = state_list[index].getResult();
    if (missionType == 1)
    {
        // Publish target to base
        output_target.header.frame_id = "map";
        output_target.header.stamp = ros::Time::now();
        output_target.pose = state_list[index].getTarget();
        pub1.publish(output_target);
        moving = true;
    }
    else if (missionType == 2 && !mission_camera)
    {
        // Publish target to arm
        std_srvs::Trigger srv;
        if (cli.call(srv))
        {
            cout << srv.response.message << endl;
        }
        else
        {
            ROS_ERROR("Failed to call Block Detection !");
        }
        mission_camera = true;
    }
    else if (missionType == 3 && !mission_1)
    {
        // Publish target to arm
        get_block.T = t_block;
        get_block.E = e_block;
        get_block.L = l_block;
        get_block.type = 1;
        pub2.publish(get_block);
        doing = true;
    }
    else if (missionType == 4 && !mission_2)
    {
        // Publish target to arm
        get_block.type = 2;
        pub2.publish(get_block);
        doing = true;
    }
    else if (missionType == 5 && !mission_3)
    {
        // Publish target to arm
        get_block.type = 3;
        pub2.publish(get_block);
        doing = true;
    }
}

void checkStateMachine(ros::Publisher pub1, ros::Publisher pub2, ros::ServiceClient cli)
{
    for (int i = 0; i < state_list.size(); i++)
    {
        if (checkPosition(state_list[i].getPosition('x'), state_list[i].getPosition('y')))
        {
            // cout << position_x << " , " << position_y << " - Index : " << i << endl;
            if (state_list[i].getCondition() == 11)
            {
                if (moving && doing)
                {
                    doMission(pub1, pub2, cli, i);
                }
            }
            else if (state_list[i].getCondition() == 10)
            {
                if (moving && !doing)
                {
                    doMission(pub1, pub2, cli, i);
                }
            }
            else if (state_list[i].getCondition() == 1)
            {
                if (!moving && doing)
                {
                    doMission(pub1, pub2, cli, i);
                }
            }
            else if (state_list[i].getCondition() == 0)
            {
                if (!moving && !doing)
                {
                    doMission(pub1, pub2, cli, i);
                }
            }
            else if (state_list[i].getCondition() == 20)
            {
                if (!moving && !doing && mission_camera)
                {
                    doMission(pub1, pub2, cli, i);
                }
            }
            else if (state_list[i].getCondition() == 30)
            {
                if (!moving && !doing && mission_1)
                {
                    doMission(pub1, pub2, cli, i);
                }
            }
            else if (state_list[i].getCondition() == 40)
            {
                if (!moving && !doing && mission_2)
                {
                    doMission(pub1, pub2, cli, i);
                }
            }
            else if (state_list[i].getCondition() == 50)
            {
                if (!moving && !doing && mission_3)
                {
                    doMission(pub1, pub2, cli, i);
                }
            }
        }
        else
        {
            // cout << "Not Find Correspond State" << endl;
        }
    }
}

// Node Handling Class Define

class mainProgram
{
public:
    // Callback Function Define

    void position_callback(const geometry_msgs::PoseStamped::ConstPtr &msg)
    {
        position_x = msg->pose.position.x;
        position_y = msg->pose.position.y;
        orientation_z = msg->pose.orientation.z;
        orientation_w = msg->pose.orientation.w;
    }

    void reached_status_callback(const std_msgs::Bool::ConstPtr &msg)
    {
        if (msg->data)
        {
            moving = false;
        }
    }

    void mission_status_callback(const std_msgs::Bool::ConstPtr &msg)
    {
        if (msg->data)
        {
            doing = false;
        }
    }

    bool start_callback(std_srvs::Empty::Request &req, std_srvs::Empty::Response &res)
    {
        if (now_Status > SETUP)
        {
            now_Status = SETUP;
        }
        else
        {
            run_state = 1;
        }
        return true;
    }

    void tblock_callback(const geometry_msgs::Point::ConstPtr &msg)
    {
        t_block.x = msg->x;
        t_block.y = msg->y;
        t_block.z = msg->z;
    }

    void eblock_callback(const geometry_msgs::Point::ConstPtr &msg)
    {
        e_block.x = msg->x;
        e_block.y = msg->y;
        e_block.z = msg->z;
    }

    void lblock_callback(const geometry_msgs::Point::ConstPtr &msg)
    {
        l_block.x = msg->x;
        l_block.y = msg->y;
        l_block.z = msg->z;
    }

    ros::NodeHandle nh;

    // ROS Topics Publishers

    ros::Publisher _baseTarget = nh.advertise<geometry_msgs::PoseStamped>("base_goal", 100); // Publish goal to navigation
    ros::Publisher _armTarget = nh.advertise<main_program::mission>("mission_target", 100);  // Publish goal to arm

    // ROS Topics Subscribers
    ros::Subscriber _globalFilter = nh.subscribe<geometry_msgs::PoseStamped>("map_pose", 100, &mainProgram::position_callback, this);  // Get position from localization
    ros::Subscriber _reachedStatus = nh.subscribe<std_msgs::Bool>("reached_status", 100, &mainProgram::reached_status_callback, this); // Get reached_status from base navigation
    ros::Subscriber _missionStatus = nh.subscribe<std_msgs::Bool>("mission_status", 100, &mainProgram::mission_status_callback, this); // Get mission_status from arm_move
    ros::Subscriber _tBlock = nh.subscribe<geometry_msgs::Point>("t_block", 100, &mainProgram::tblock_callback, this);                 // Get Block T Status
    ros::Subscriber _eBlock = nh.subscribe<geometry_msgs::Point>("e_block", 100, &mainProgram::eblock_callback, this);                 // Get Block E Status
    ros::Subscriber _lBlock = nh.subscribe<geometry_msgs::Point>("l_block", 100, &mainProgram::lblock_callback, this);                 // Get Block L Status

    // ROS Service Server
    ros::ServiceServer _runState = nh.advertiseService("startRunning", &mainProgram::start_callback, this); // Start Signal Service

    // ROS Service Client
    ros::ServiceClient _blockDetect = nh.serviceClient<std_srvs::Trigger>("get_photo");
};

// Main Program

int main(int argc, char **argv)
{
    // ROS initial
    ros::init(argc, argv, "main_node");

    // Node Handling Class Initialize

    mainProgram mainClass;
    ros::Time initialTime = ros::Time::now();
    std_msgs::Float32 timePublish;
    std_msgs::Int32 pointPublish;

    // Main Node Update Frequency

    ros::Rate rate(20);

    // Script Reading

    ifstream inFile;
    string value;
    string line;
    string field;
    string packagePath = ros::package::getPath("main_program");
    string filename_mission = "tokyo2022_script.csv";

    pair<double, double> position_;
    int condition_;
    int result_;
    geometry_msgs::Pose target_;
    double angle;
    tf2::Quaternion myQuaternion;

    inFile.open(packagePath + "/include/" + filename_mission);
    cout << "\nMission Point CSV File << " << filename_mission << " >> ";
    if (inFile.fail())
    {
        cout << "Could Not Open !" << endl;
    }
    else
    {
        cout << "Open Successfully !" << endl;
    }
    cout << endl;
    getline(inFile, line);
    while (getline(inFile, line))
    {
        istringstream sin(line);

        getline(sin, field, ',');
        position_.first = atof(field.c_str());

        getline(sin, field, ',');
        position_.second = atof(field.c_str());

        getline(sin, field, ',');
        condition_ = atoi(field.c_str());

        getline(sin, field, ',');
        result_ = atoi(field.c_str());

        getline(sin, field, ',');
        target_.position.x = atof(field.c_str());

        getline(sin, field, ',');
        target_.position.y = atof(field.c_str());

        getline(sin, field, ',');
        angle = atof(field.c_str());
        myQuaternion.setRPY(0, 0, angle * M_PI / 180.0);
        target_.orientation = tf2::toMsg(myQuaternion);

        if (position_.first == 0 && position_.second == 0)
        {
            break;
        }

        state nextState(position_, condition_, result_, target_);
        state_list.push_back(nextState);
    }
    for (int i = 0; i < state_list.size(); i++)
    {
        state_list[i].printOut();
    }
    cout << endl;

    while (ros::ok())
    {
        switch (now_Status)
        {
        case SETUP:
            now_Status = RUN;
            break;
        case RUN:
            checkStateMachine(mainClass._baseTarget, mainClass._armTarget, mainClass._blockDetect);
            break;
        case FINISH:
            break;
        }
        ros::spinOnce();
        rate.sleep();
    }
    return 0;
}
