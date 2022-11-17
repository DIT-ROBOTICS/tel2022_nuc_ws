#!/usr/bin/env python3

import cv2
import time

import rospy
import rospkg
from std_srvs.srv import *
from geometry_msgs.msg import Point

Conf_threshold = 0.8
NMS_threshold = 0.4
COLORS = [(0, 255, 0), (0, 0, 255), (255, 0, 0), (255, 255, 0), (255, 0, 255)]

pkg = rospkg.RosPack()
packagePath = pkg.get_path("main_program")

class_name = []
with open(packagePath+'/include/data/block.names', 'r') as f:
    class_name = [cname.strip() for cname in f.readlines()]
print("\nClass Names : ", end='')
print(class_name)

net = cv2.dnn.readNet(packagePath+'/include/weight/yolov4-tiny-custom_best.weights',
                      packagePath+'/include/cfg/yolov4-tiny-custom.cfg')
model = cv2.dnn_DetectionModel(net)
model.setInputParams(size=(416, 416), scale=1/255, swapRB=True)

t_block = Point(0, 0, 0)
e_block = Point(0, 0, 0)
l_block = Point(0, 0, 0)
finishDetectService = False

# Define ROS Functions


def x_transformation(img_x, img_y):
    return (((540-img_y)/540)*780+500)*((img_x/960)-500)-60-80


def y_transformation(img_y):
    return ((540-img_y)/540)*1025+225-240+30


def detection_callback(req):
    img = cv2.imread(packagePath+'/include/detectPhoto.jpeg')

    global t_block
    global e_block
    global l_block
    global finishDetectService
    t_prob = 0.0
    e_prob = 0.0
    l_prob = 0.0

    pred_img = img

    classes, scores, boxes = model.detect(img, Conf_threshold, NMS_threshold)
    for (classid, score, box) in zip(classes, scores, boxes):
        color = COLORS[int(classid) % len(COLORS)]
        label = "%s : %f" % (class_name[classid], score)
        print(label, box)  # (x, y, width, height)
        pred_img = cv2.rectangle(img, box, color, 1)
        pred_img = cv2.putText(
            pred_img, label, (box[0], box[1]-10), cv2.FONT_HERSHEY_COMPLEX, 0.3, color, 1)

        if label == 'T' and t_prob < score:
            t_block.x = x_transformation(box[0]+0.5*box[2], box[1]+0.2*box[3])
            t_block.y = y_transformation(box[1]+0.2*box[3])
            t_block.z = -15.5
            t_prob = score

        elif label == 'E' and e_prob < score:
            e_block.x = x_transformation(box[0]+0.5*box[2], box[1]+0.2*box[3])
            e_block.y = y_transformation(box[1]+0.2*box[3])
            t_block.z = -15.5
            e_prob = score

        elif label == 'L' and l_prob < score:
            l_block.x = x_transformation(box[0]+0.5*box[2], box[1]+0.2*box[3])
            l_block.y = y_transformation(box[1]+0.2*box[3])
            t_block.z = -15.5
            l_prob = score

    cv2.imwrite(packagePath+'/include/predictions.jpeg', pred_img)

    finishDetectService = True

    return TriggerResponse(True, 'Finish Detection !')


def block_detection_server():
    rospy.init_node("block_detection_node")
    _detectService = rospy.Service(
        "block_detection", Trigger, detection_callback)
    _tblockPublisher = rospy.Publisher('t_block', Point, queue_size=10)
    _eblockPublisher = rospy.Publisher('e_block', Point, queue_size=10)
    _lblockPublisher = rospy.Publisher('l_block', Point, queue_size=10)

    global t_block
    global e_block
    global l_block
    global finishDetectService

    while not rospy.is_shutdown():

        if finishDetectService is True:
            _tblockPublisher.publish(t_block)
            _eblockPublisher.publish(e_block)
            _lblockPublisher.publish(l_block)
            finishDetectService = False

        # Keep the node alive
        rospy.sleep(1)


if __name__ == "__main__":
    block_detection_server()
