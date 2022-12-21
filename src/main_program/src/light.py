#!/usr/bin/env python3

import rospy
from std_msgs.msg import Bool
from geometry_msgs.msg import PoseStamped
import subprocess

flag = 1
count = 0
open = 0


def lightOpen():
    p = Bool()
    p.data = True
    _light.publish(p)
    global flag
    flag = 0


def lightClose():
    p = Bool()
    p.data = False
    _light.publish(p)
    global flag
    global count
    flag = 1
    count += 1


def callback(data):
    if data.pose.position.x == -0.13 and data.pose.position.y == 10.4:
        global open
        open = 1


if __name__ == '__main__':

    rospy.init_node("shooting_star")
    _light = rospy.Publisher('light', Bool, queue_size=100)
    rospy.Subscriber("base_goal", PoseStamped, callback)
    rate = rospy.Rate(30)

    while not rospy.is_shutdown():
        if open:
            if flag:
                lightOpen()
            else:
                lightClose()
            if count == 8:
                rate = rospy.Rate(20)
            elif count == 20:
                rate = rospy.Rate(30)
                count = 0
        rate.sleep()
