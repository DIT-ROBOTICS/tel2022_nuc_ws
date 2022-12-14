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
#include <main_program/starting.h>

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
int whichScript = 1;
int requestScript = 1;
bool readScript = false;
bool finishMission = false;

bool moving = false;
bool doing = false;
bool mission_camera = false;
bool arm_mission_1 = false;
bool arm_mission_p = false;
bool arm_mission_m = false;
bool arm_mission_e = false;
bool arm_mission_stack = false;

double position_x = 0.1;
double position_y = 0.1;
double orientation_z = 0;
double orientation_w = 0;
double startMissionTime;

geometry_msgs::Pose next_target;
geometry_msgs::PoseStamped output_target;
geometry_msgs::Point p_block;
geometry_msgs::Point m_block;
geometry_msgs::Point e_block;

main_program::mission get_block;

vector<state> state_list;

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
            if (finishMission)
            {
                readScript = false;
                now_Status = SETUP;
                std_srvs::Empty emp;
                std_msgs::Bool bol;
                bol.data = true;
                _finish.publish(bol);
                _armMoveReset.call(emp);
                _odomReset.call(emp);
                _navReset.call(emp);
            }
        }
    }

    void mission_status_callback(const std_msgs::Bool::ConstPtr &msg)
    {
        if (msg->data)
        {
            doing = false;
        }
    }

    bool start_callback(main_program::starting::Request &req, main_program::starting::Response &res)
    {
        if (req.startTrigger == false)
        {
            requestScript = req.startStatus;

            if (requestScript == 0)
            {
                whichScript = 0;
                cout << "Script: " << whichScript << " Get !" << endl;
            }
            else if (requestScript == 1)
            {
                whichScript = 1;
                cout << "Script: " << whichScript << " Get !" << endl;
            }
            else if (requestScript == 2)
            {
                whichScript = 2;
                cout << "Script: " << whichScript << " Get !" << endl;
            }
            else if (requestScript == 3)
            {
                whichScript = 3;
                cout << "Script: " << whichScript << " Get !" << endl;
            }
            else if (requestScript == 4)
            {
                whichScript = 4;
                cout << "Script: " << whichScript << " Get !" << endl;
            }
            else if (requestScript == 5)
            {
                whichScript = 5;
                cout << "Script: " << whichScript << " Get !" << endl;
            }
            else if (requestScript == 6)
            {
                whichScript = 6;
                cout << "Script: " << whichScript << " Get !" << endl;
            }
            else if (requestScript == 7)
            {
                whichScript = 7;
                cout << "Script: " << whichScript << " Get !" << endl;
            }
            else if (requestScript == 8)
            {
                whichScript = 8;
                cout << "Script: " << whichScript << " Get !" << endl;
            }
            else
            {
                cout << "No Relative Script Can Be Read ! The Number is " << requestScript << "!\n"
                     << endl;
            }
            now_Status = SETUP;
            readScript = false;
        }
        else if (req.startTrigger == true)
        {
            now_Status = RUN;
            cout << "Main Program Start !" << endl;
        }
        return true;
    }

    void tblock_callback(const geometry_msgs::Point::ConstPtr &msg)
    {
        p_block.x = msg->x;
        p_block.y = msg->y;
        p_block.z = msg->z;
    }

    void eblock_callback(const geometry_msgs::Point::ConstPtr &msg)
    {
        m_block.x = msg->x;
        m_block.y = msg->y;
        m_block.z = msg->z;
    }

    void lblock_callback(const geometry_msgs::Point::ConstPtr &msg)
    {
        e_block.x = msg->x;
        e_block.y = msg->y;
        e_block.z = msg->z;
    }

    ros::NodeHandle nh;

    // ROS Topics Publishers

    ros::Publisher _baseTarget = nh.advertise<geometry_msgs::PoseStamped>("base_goal", 100); // Publish goal to navigation
    ros::Publisher _armTarget = nh.advertise<main_program::mission>("mission_target", 100);  // Publish goal to arm
    ros::Publisher _light = nh.advertise<std_msgs::Bool>("light", 100);                      // Publish light to Mission
    ros::Publisher _finish = nh.advertise<std_msgs::Bool>("script_finish", 100);             // Publish Reset Controller

    // ROS Topics Subscribers
    ros::Subscriber _globalFilter = nh.subscribe<geometry_msgs::PoseStamped>("map_pose", 100, &mainProgram::position_callback, this);  // Get position from localization
    ros::Subscriber _reachedStatus = nh.subscribe<std_msgs::Bool>("reached_status", 100, &mainProgram::reached_status_callback, this); // Get reached_status from base navigation
    ros::Subscriber _missionStatus = nh.subscribe<std_msgs::Bool>("mission_status", 100, &mainProgram::mission_status_callback, this); // Get mission_status from arm_move
    ros::Subscriber _tBlock = nh.subscribe<geometry_msgs::Point>("block_1", 100, &mainProgram::tblock_callback, this);                 // Get Block T Status
    ros::Subscriber _eBlock = nh.subscribe<geometry_msgs::Point>("block_2", 100, &mainProgram::eblock_callback, this);                 // Get Block E Status
    ros::Subscriber _lBlock = nh.subscribe<geometry_msgs::Point>("block_3", 100, &mainProgram::lblock_callback, this);                 // Get Block L Status

    // ROS Service Server
    ros::ServiceServer _runState = nh.advertiseService("startRunning", &mainProgram::start_callback, this); // Start Signal Service

    // ROS Service Client
    ros::ServiceClient _blockDetect = nh.serviceClient<std_srvs::Trigger>("get_photo");
    ros::ServiceClient _odomReset = nh.serviceClient<std_srvs::Empty>("odom_reset");
    ros::ServiceClient _armMoveReset = nh.serviceClient<std_srvs::Empty>("arm_move_reset");
    ros::ServiceClient _navReset = nh.serviceClient<std_srvs::Empty>("nav_reset");
};

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

void doMission(mainProgram mainClass, int index)
{
    ros::Publisher pub1 = mainClass._baseTarget;
    ros::Publisher pub2 = mainClass._armTarget;
    ros::ServiceClient cli = mainClass._blockDetect;
    ros::Publisher pub3 = mainClass._light;

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
        // std_msgs::Bool lightStatus;
        // lightStatus.data = true;
        // pub3.publish(lightStatus);
        double timingStart = ros::Time::now().toSec();
        while (ros::Time::now().toSec() - timingStart < 3)
        {
        }
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
        // lightStatus.data = false;
        // pub3.publish(lightStatus);
    }
    else if (missionType == 3 && !arm_mission_1)
    {
        // Publish target to arm
        get_block.T = e_block;
        get_block.E = m_block;
        get_block.L = p_block;

        get_block.type = 1;

        pub2.publish(get_block);
        doing = true;
        arm_mission_1 = true;
    }
    else if (missionType == 4 && !arm_mission_p)
    {
        // Publish target to arm
        get_block.type = 2;
        get_block.T.x = 0;
        get_block.E.x = 0;
        get_block.L.x = 1;
        pub2.publish(get_block);
        doing = true;
        arm_mission_p = true;
    }
    else if (missionType == 5 && !arm_mission_m)
    {
        // Publish target to arm
        get_block.type = 2;
        get_block.T.x = 0;
        get_block.E.x = 1;
        get_block.L.x = 0;
        pub2.publish(get_block);
        doing = true;
        arm_mission_m = true;
    }
    else if (missionType == 6 && !arm_mission_e)
    {
        // Publish target to arm
        get_block.type = 2;
        get_block.T.x = 1;
        get_block.E.x = 0;
        get_block.L.x = 0;
        pub2.publish(get_block);
        doing = true;
        arm_mission_e = true;
    }
    else if (missionType == 7 && !arm_mission_stack)
    {
        // Publish target to arm
        if (whichScript == 4)
        {
            get_block.T.x = 1;
            get_block.E.x = 1;
            get_block.L.x = 0;
        }
        else if (whichScript == 6)
        {
            get_block.T.x = 1;
            get_block.E.x = 0;
            get_block.L.x = 1;
        }
        else if (whichScript == 7)
        {
            get_block.T.x = 0;
            get_block.E.x = 1;
            get_block.L.x = 1;
        }
        else if (whichScript == 8)
        {
            get_block.T.x = 1;
            get_block.E.x = 1;
            get_block.L.x = 1;
        }
        get_block.type = 2;
        pub2.publish(get_block);
        doing = true;
        arm_mission_stack = true;
    }
    else if (missionType == 8)
    {
        finishMission = true;

        // Publish target to base
        output_target.header.frame_id = "map";
        output_target.header.stamp = ros::Time::now();
        output_target.pose = state_list[index].getTarget();
        pub1.publish(output_target);
        moving = true;
    }
}

void checkStateMachine(mainProgram mainClass)
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
                    doMission(mainClass, i);
                }
            }
            else if (state_list[i].getCondition() == 10)
            {
                if (moving && !doing)
                {
                    doMission(mainClass, i);
                }
            }
            else if (state_list[i].getCondition() == 1)
            {
                if (!moving && doing)
                {
                    doMission(mainClass, i);
                }
            }
            else if (state_list[i].getCondition() == 0)
            {
                if (!moving && !doing)
                {
                    doMission(mainClass, i);
                }
            }
            else if (state_list[i].getCondition() == 20)
            {
                if (!moving && !doing && mission_camera)
                {
                    doMission(mainClass, i);
                }
            }
            else if (state_list[i].getCondition() == 30)
            {
                if (!moving && !doing && arm_mission_1)
                {
                    doMission(mainClass, i);
                }
            }
            else if (state_list[i].getCondition() == 40)
            {
                if (!moving && !doing && arm_mission_p)
                {
                    doMission(mainClass, i);
                }
            }
            else if (state_list[i].getCondition() == 50)
            {
                if (!moving && !doing && arm_mission_m)
                {
                    doMission(mainClass, i);
                }
            }
            else if (state_list[i].getCondition() == 60)
            {
                if (!moving && !doing && arm_mission_e)
                {
                    doMission(mainClass, i);
                }
            }
            else if (state_list[i].getCondition() == 70)
            {
                if (!moving && !doing && arm_mission_stack)
                {
                    doMission(mainClass, i);
                }
            }
        }
        else
        {
            // cout << "Not Find Correspond State" << endl;
        }
    }
}

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
    string filename_mission = "test_output.csv";

    pair<double, double> position_;
    int condition_;
    int result_;
    geometry_msgs::Pose target_;
    double angle;
    tf2::Quaternion myQuaternion;

    while (ros::ok())
    {
        switch (now_Status)
        {
        case SETUP:

            if (!readScript && requestScript >= 0 && requestScript <= 8)
            {
                moving = false;
                doing = false;
                mission_camera = false;
                finishMission = false;
                arm_mission_1 = false;
                arm_mission_p = false;
                arm_mission_m = false;
                arm_mission_e = false;
                arm_mission_stack = false;
                state_list.clear();

                if (whichScript == 0)
                {
                    filename_mission = "test_output.csv";
                }
                else if (whichScript == 1)
                {
                    filename_mission = "projectScript1.csv";
                }
                else if (whichScript == 2)
                {
                    filename_mission = "projectScript2.csv";
                }
                else if (whichScript == 3)
                {
                    filename_mission = "projectScript3.csv";
                }
                else if (whichScript == 4)
                {
                    filename_mission = "projectScript4.csv";
                }
                else if (whichScript == 5)
                {
                    filename_mission = "projectScript5.csv";
                }
                else if (whichScript == 6)
                {
                    filename_mission = "projectScript6.csv";
                }
                else if (whichScript == 7)
                {
                    filename_mission = "projectScript7.csv";
                }
                else if (whichScript == 8)
                {
                    filename_mission = "projectScript8.csv";
                }
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
                readScript = true;
                inFile.close();
            }
            break;
        case RUN:
            checkStateMachine(mainClass);
            break;
        case FINISH:
            break;
        }
        ros::spinOnce();
        rate.sleep();
    }
    return 0;
}
