#!/usr/bin/env python3

import cv2
import time

import rospy
import rospkg
from std_srvs.srv import Trigger, TriggerResponse
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

# Define ROS Functions


def detection_callback(req):
    img = cv2.imread(packagePath+'/include/detectPhoto.jpeg')

    classes, scores, boxes = model.detect(img, Conf_threshold, NMS_threshold)
    for (classid, score, box) in zip(classes, scores, boxes):
        color = COLORS[int(classid) % len(COLORS)]
        label = "%s : %f" % (class_name[classid], score)
        print(label, box)  # (x, y, width, height)
        pred_img = cv2.rectangle(img, box, color, 1)
        pred_img = cv2.putText(
            pred_img, label, (box[0], box[1]-10), cv2.FONT_HERSHEY_COMPLEX, 0.3, color, 1)

    cv2.imwrite(packagePath+'/include/predictions.jpeg', pred_img)


def block_detection_server():
    rospy.init_node("block_detection_node")
    _detectService = rospy.Service(
        "block_detection", Trigger, detection_callback)

    while not rospy.is_shutdown():
        # Keep the node alive
        rospy.sleep(1)


if __name__ == "__main__":
    block_detection_server()
