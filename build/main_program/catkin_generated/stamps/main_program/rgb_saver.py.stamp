#!/usr/bin/env python3

import time
from pathlib import Path
import cv2
import depthai as dai

import rospy
from std_srvs.srv import *

# Create pipeline
pipeline = dai.Pipeline()

camRgb = pipeline.create(dai.node.ColorCamera)
camRgb.setBoardSocket(dai.CameraBoardSocket.RGB)
camRgb.setResolution(dai.ColorCameraProperties.SensorResolution.THE_4_K)

xoutRgb = pipeline.create(dai.node.XLinkOut)
xoutRgb.setStreamName("rgb")
camRgb.video.link(xoutRgb.input)

xin = pipeline.create(dai.node.XLinkIn)
xin.setStreamName("control")
xin.out.link(camRgb.inputControl)

# Properties
videoEnc = pipeline.create(dai.node.VideoEncoder)
videoEnc.setDefaultProfilePreset(1, dai.VideoEncoderProperties.Profile.MJPEG)
camRgb.still.link(videoEnc.input)

# Linking
xoutStill = pipeline.create(dai.node.XLinkOut)
xoutStill.setStreamName("still")
videoEnc.bitstream.link(xoutStill.input)

frame = None
# count = 35

# Define ROS Functions


def call_detection_service():
    rospy.wait_for_service('block_detection')
    try:
        detection = rospy.ServiceProxy('block_detection', Trigger)
        result = detection()
        return result
    except rospy.ServiceException as e:
        print("Service call failed: %s" % e)


def get_photo_callback(req):
    # global count
    # count += 1
    # cv2.imwrite(
    #     "/home/dit_nuc/tel2022_nuc_ws/src/main_program/src/picture/"+str(count)+".jpeg", frame)
    cv2.imwrite(
        "/home/dit_nuc/tel2022_nuc_ws/src/main_program/src/picture/detectPhoto.jpeg", frame)
    print(call_detection_service())
    return TriggerResponse(True, "Successfully Get Detect Photo and Finish Calling Block Detection Service !")


def take_photo_server():
    rospy.init_node("photo_server_node")
    _photoService = rospy.Service("get_photo", Trigger, get_photo_callback)

    # Connect to device and start pipeline
    with dai.Device(pipeline) as device:

        # Adjustment Focus
        controlQueue = device.getInputQueue('control')
        ctrl = dai.CameraControl()
        ctrl.setManualFocus(128)
        ctrl.setManualWhiteBalance(4200)
        controlQueue.send(ctrl)

        # Output queue will be used to get the rgb frames from the output defined above
        qRgb = device.getOutputQueue(name="rgb", maxSize=30, blocking=False)
        qStill = device.getOutputQueue(name="still", maxSize=30, blocking=True)
        qControl = device.getInputQueue(name="control")
        inRgb = qRgb.tryGet()
        while inRgb is not None:
            global frame
            frame = inRgb.getCvFrame()
            # 4k / 4
            # frame = cv2.pyrDown(frame)
            # frame = cv2.pyrDown(frame)

        # Make sure the destination path is present before starting to store the examples
        dirName = "/home/dit_nuc/tel2022_nuc_ws/src/main_program/include"
        Path(dirName).mkdir(parents=True, exist_ok=True)

        while not rospy.is_shutdown():

            # Non-blocking call, will return a new data that has arrived or None otherwise
            inRgb = qRgb.tryGet()
            if inRgb is not None:
                frame = inRgb.getCvFrame()
                # 4k / 4
                frame = cv2.pyrDown(frame)
                frame = cv2.pyrDown(frame)
                # cv2.imshow("rgb", frame)

            # Keep the node alive
            rospy.sleep(1)


if __name__ == "__main__":
    take_photo_server()
