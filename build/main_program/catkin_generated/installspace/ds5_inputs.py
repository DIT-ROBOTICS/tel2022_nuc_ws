#!/usr/bin/env python3

import pygame

import rospy
from sensor_msgs.msg import Joy

axes = [0.0]*6
buttons = [0]*17
joy_msg = Joy()
joy_msg.axes = axes
joy_msg.buttons = buttons


def ds5_bluetooth_node():

    rospy.init_node("ds5_bluetooth_node")
    _ds5JoyPublisher = rospy.Publisher('ds5_joy', Joy, queue_size=100)
    rate = rospy.Rate(20)

    pygame.display.init()
    pygame.joystick.init()
    pygame.joystick.Joystick(0).init()
    global axes
    global buttons
    global joy_msg

    # Get the name of the joystick and print it

    JoyName = pygame.joystick.Joystick(0).get_name()
    print("Name of the joystick : ", end='')
    print(JoyName)
    print('----------')

    # Get the number of axes
    JoyAx = pygame.joystick.Joystick(0).get_numaxes()
    print("Number of Axis : ", end='')
    print(JoyAx)
    print('----------')

    # Get the number of buttons
    JoyBt = pygame.joystick.Joystick(0).get_numbuttons()
    print("Number of Buttons : ", end='')
    print(JoyAx)
    print('----------')

    # Get the number of balls
    JoyBl = pygame.joystick.Joystick(0).get_numballs()
    print("Number of Balls : ", end='')
    print(JoyBl)
    print('----------')

    # Get the number of hats
    JoyHt = pygame.joystick.Joystick(0).get_numhats()
    print("Number of Hats : ", end='')
    print(JoyHt)
    print('----------')

    # Publish the values of the joystick
    while not rospy.is_shutdown():
        pygame.event.pump()
        print(pygame.joystick.Joystick(0).get_button(0))
        rate.sleep()


if __name__ == "__main__":
    ds5_bluetooth_node()
