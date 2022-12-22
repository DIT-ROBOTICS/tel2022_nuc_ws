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
    if img_y > 350:
        img_y = 350
    middle_point = (350-img_y)*20/240+440
    # print(middle_point)
    image_range = (img_y-110)*330/240+420
    # print(image_range)
    ratio = (img_x-middle_point)/image_range
    # print(ratio)
    real_x = ratio*340
    # print(real_x)
    return real_x


# Every Region Gap:85 / Num.1 : Move Backward 5 / Num.4 : Move Forward 10
def y_transformation(img_y):
    if img_y < 140:
        return (140-img_y)*85/30+420
    elif img_y < 190:
        return (190-img_y)*85/50+330
    elif img_y < 260:
        return (260-img_y)*85/70+240    # 245
    elif img_y < 350:
        return (350-img_y)*85/90+145    # 150
    else:
        img_y = 350
        return (350-img_y)*85/90+145


def detection_callback(req):

    global finishDetectService

    Conf_threshold = 0.7
    NMS_threshold = 0.4

    COLORS = [(0, 255, 0), (0, 0, 255), (255, 0, 0),
              (255, 255, 0), (255, 0, 255), (0, 255, 255), (255, 255, 255)]

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
    block_1 = Point(0., 0., 0.)
    block_2 = Point(0., 0., 0.)
    block_3 = Point(0., 0., 0.)
    block_1_list = []
    block_2_list = []
    block_3_list = []

    classes, scores, boxes = model.detect(img, Conf_threshold, NMS_threshold)
    for (classid, score, box) in zip(classes, scores, boxes):
        print("-")
        color = COLORS[int(classid) % len(COLORS)]
        label = "%s : %f" % (class_name[classid], score)
        print(label, box)  # (x, y, width, height)
        pred_img = cv2.rectangle(img, box, color, 1)
        pred_img = cv2.putText(
            pred_img, label, (box[0], box[1]-10), cv2.FONT_HERSHEY_COMPLEX, 0.4, color, 1)

        if class_name[classid] == 'P':
            block_1_list.append((score, x_transformation(
                box[0]+0.5*box[2], box[1]+0.5*box[3]), y_transformation(box[1]+0.5*box[3]), -15.5))

        elif class_name[classid] == 'M':
            block_2_list.append((score, x_transformation(
                box[0]+0.5*box[2], box[1]+0.5*box[3]), y_transformation(box[1]+0.5*box[3]), -15.5))

        elif class_name[classid] == 'E':
            block_3_list.append((score, x_transformation(
                box[0]+0.5*box[2], box[1]+0.5*box[3]), y_transformation(box[1]+0.5*box[3]), -15.5))

    block_1_list.sort(key=lambda tup: tup[0], reverse=True)
    block_2_list.sort(key=lambda tup: tup[0], reverse=True)
    block_3_list.sort(key=lambda tup: tup[0], reverse=True)

    if not len(block_1_list) == 0:
        block_1.x = block_1_list[0][1]
        block_1.y = block_1_list[0][2]
        block_1.z = block_1_list[0][3]
    elif len(block_3_list) >= 2:
        block_1.x = block_3_list[1][1]
        block_1.y = block_3_list[1][2]
        block_1.z = block_3_list[1][3]

    if not len(block_2_list) == 0:
        block_2.x = block_2_list[0][1]
        block_2.y = block_2_list[0][2]
        block_2.z = block_2_list[0][3]
    if not len(block_3_list) == 0:
        block_3.x = block_3_list[0][1]
        block_3.y = block_3_list[0][2]
        block_3.z = block_3_list[0][3]
    elif len(block_1_list) >= 2:
        block_3.x = block_1_list[1][1]
        block_3.y = block_1_list[1][2]
        block_3.z = block_1_list[1][3]

    cv2.imwrite(packagePath+'/src/picture/predictions.jpeg', pred_img)

    _tblockPublisher.publish(block_1)
    _eblockPublisher.publish(block_2)
    _lblockPublisher.publish(block_3)

    finishDetectService = True

    return TriggerResponse(True, 'Finish Detection !')


def block_detection_server():
    rospy.init_node("block_detection_node")

    rospy.Service("block_detection", Trigger, detection_callback)

    global _tblockPublisher
    global _eblockPublisher
    global _lblockPublisher

    _tblockPublisher = rospy.Publisher('block_1', Point, queue_size=10)
    _eblockPublisher = rospy.Publisher('block_2', Point, queue_size=10)
    _lblockPublisher = rospy.Publisher('block_3', Point, queue_size=10)

    global finishDetectService

    print("Start Block Detection Service Node !")

    while not rospy.is_shutdown():

        # Keep the node alive
        rospy.sleep(1)


if __name__ == "__main__":
    block_detection_server()
