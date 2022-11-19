#!/usr/bin/env python3

# %%
import cv2
import time


def block_detection():
    Conf_threshold = 0.8
    NMS_threshold = 0.4
    COLORS = [(0, 255, 0), (0, 0, 255), (255, 0, 0),
              (255, 255, 0), (255, 0, 255)]

    class_name = []
    with open('./data/block.names', 'r') as f:
        class_name = [cname.strip() for cname in f.readlines()]
    print("\nClass Names : ", end='')
    print(class_name)

    cfg = './cfg/yolov4-tiny-custom.cfg'
    weights = './weight/yolov4-tiny-custom_best.weights'

    net = cv2.dnn.readNetFromDarknet(cfg, weights)
    model = cv2.dnn_DetectionModel(net)
    model.setInputParams(size=(416, 416), scale=1.0/255.0, swapRB=True)

    print(net.getLayerNames())

    img = cv2.imread('./picture/detectPhoto.jpeg')

    # new_image = cv2.dnn.blobFromImage(img, scalefactor=(
    #     1.0/255.0), size=(416, 416), swapRB=True, crop=False)
    # net.setInput(new_image)
    # pred = net.forward()
    # print(pred)

    pred_img = img

    classes, scores, boxes = model.detect(img, Conf_threshold, NMS_threshold)
    print(len(classes))
    for (classid, score, box) in zip(classes, scores, boxes):
        print("-")
        color = COLORS[int(classid) % len(COLORS)]
        label = "%s : %f" % (class_name[classid], score)
        print(label, box)  # (x, y, width, height)
        pred_img = cv2.rectangle(img, box, color, 2)
        pred_img = cv2.putText(
            pred_img, label, (box[0], box[1]-10), cv2.FONT_HERSHEY_COMPLEX, 0.3, color, 1)

        if label == 'T' and t_prob < score:
            t_prob = score

        elif label == 'E' and e_prob < score:
            e_prob = score

        elif label == 'L' and l_prob < score:
            l_prob = score

    cv2.imwrite('./picture/predictions.jpeg', pred_img)


if __name__ == "__main__":
    block_detection()

# %%
