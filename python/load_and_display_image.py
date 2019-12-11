#!/usr/bin/env python3

import cv2

img = cv2.imread('../bean.jpg')

dimensions = img.shape
print("Width: {}, Height: {}, Channels: {}".format(dimensions[0], dimensions[1], dimensions[2]))
print("Datatype: {}".format(img.dtype))

cv2.imshow('bean', img)
cv2.waitKey(0)
