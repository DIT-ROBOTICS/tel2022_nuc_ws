#!/usr/bin/env python3

import cv2
import time

import rospy
import rospkg
from std_srvs.srv import *
from geometry_msgs.msg import Point

pkg = rospkg.RosPack()
packagePath = pkg.get_path("main_program")

finishDetectService = False

# Define ROS Functions


def x_transformation(img_x, img_y):
    middle_point = (350-img_y)*20/240+440
    # print(middle_point)
    image_range = (img_y-110)*330/240+420
    # print(image_range)
    ratio = (img_x-middle_point)/image_range
    # print(ratio)
    real_x = ratio*340
    # print(real_x)
    return real_x


def y_transformation(img_y):
    if img_y < 140:
        return (140-img_y)*85/30+365
    elif img_y < 190:
        return (190-img_y)*85/50+270
    elif img_y < 260:
        return (260-img_y)*85/70+195
    else:
        return (350-img_y)*85/90+110


def detection_callback(req):

    global finishDetectService

    t_prob = 0.0
    t2_prob = 0.0
    e_prob = 0.0
    l_prob = 0.0
    l2_prob = 0.0

    Conf_threshold = 0.5
    NMS_threshold = 0.4

    COLORS = [(0, 255, 0), (0, 0, 255), (255, 0, 0),
              (255, 255, 0), (255, 0, 255)]

    class_name = []
    with open(packagePath+'/src/data/block.names', 'r') as f:
        class_name = [cname.strip() for cname in f.readlines()]
    print("\nClass Names : ", end='')
    # print(class_name)

    net = cv2.dnn.readNet(packagePath+'/src/weight/yolov4-tiny-custom_best.weights',
                          packagePath+'/src/cfg/yolov4-tiny-custom.cfg')
    model = cv2.dnn_DetectionModel(net)
    model.setInputParams(size=(416, 416), scale=1/255, swapRB=True)
    img = cv2.imread(packagePath+'/src/picture/detectPhoto.jpeg')

    # print(net.getLayerNames())

    pred_img = img
    t_block = Point(0., 0., 0.)
    e_block = Point(0., 0., 0.)
    l_block = Point(0., 0., 0.)
    t_block_list = []
    e_block_list = []
    l_block_list = []

    classes, scores, boxes = model.detect(img, Conf_threshold, NMS_threshold)
    for (classid, score, box) in zip(classes, scores, boxes):
        print("-")
        color = COLORS[int(classid) % len(COLORS)]
        label = "%s : %f" % (class_name[classid], score)
        print(label, box)  # (x, y, width, height)
        pred_img = cv2.rectangle(img, box, color, 1)
        pred_img = cv2.putText(
            pred_img, label, (box[0], box[1]-10), cv2.FONT_HERSHEY_COMPLEX, 0.3, color, 1)

        if class_name[classid] == 'T':
            t_block_list.append((score, x_transformation(
                box[0]+0.5*box[2], box[1]+0.2*box[3]), y_transformation(box[1]+0.2*box[3]), -15.5))

        elif class_name[classid] == 'E':
            e_block_list.append((score, x_transformation(
                box[0]+0.5*box[2], box[1]+0.2*box[3]), y_transformation(box[1]+0.2*box[3]), -15.5))

        elif class_name[classid] == 'L':
            l_block_list.append((score, x_transformation(
                box[0]+0.5*box[2], box[1]+0.2*box[3]), y_transformation(box[1]+0.2*box[3]), -15.5))

    t_block_list.sort(key=lambda tup: tup[0], reverse=True)
    e_block_list.sort(key=lambda tup: tup[0], reverse=True)
    l_block_list.sort(key=lambda tup: tup[0], reverse=True)

    if not len(t_block_list) == 0:
        t_block.x = t_block_list[0][1]
        t_block.y = t_block_list[0][2]
        t_block.z = t_block_list[0][3]
    elif len(l_block_list) >= 2:
        t_block.x = l_block_list[1][1]
        t_block.y = l_block_list[1][2]
        t_block.z = l_block_list[1][3]

    if not len(e_block_list) == 0:
        e_block.x = e_block_list[0][1]
        e_block.y = e_block_list[0][2]
        e_block.z = e_block_list[0][3]
    if not len(l_block_list) == 0:
        l_block.x = l_block_list[0][1]
        l_block.y = l_block_list[0][2]
        l_block.z = l_block_list[0][3]
    elif len(t_block_list) >= 2:
        l_block.x = t_block_list[1][1]
        l_block.y = t_block_list[1][2]
        l_block.z = t_block_list[1][3]

    cv2.imwrite(packagePath+'/src/picture/predictions.jpeg', pred_img)
    _tblockPublisher.publish(t_block)
    _eblockPublisher.publish(e_block)
    _lblockPublisher.publish(l_block)

    finishDetectService = True

    return TriggerResponse(True, 'Finish Detection !')


def block_detection_server():
    rospy.init_node("block_detection_node")

    rospy.Service("block_detection", Trigger, detection_callback)

    global _tblockPublisher
    global _eblockPublisher
    global _lblockPublisher

    _tblockPublisher = rospy.Publisher('t_block', Point, queue_size=10)
    _eblockPublisher = rospy.Publisher('e_block', Point, queue_size=10)
    _lblockPublisher = rospy.Publisher('l_block', Point, queue_size=10)

    global finishDetectService

    print("Start Block Detection Service Node !")

    while not rospy.is_shutdown():

        # Keep the node alive
        rospy.sleep(1)


if __name__ == "__main__":
    block_detection_server()
