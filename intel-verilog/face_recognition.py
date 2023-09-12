from deepface import DeepFace
import cv2
import matplotlib.pyplot as plt

img1 = cv2.imread("database/img1.jpg")
img2 = cv2.imread("database/img2.jpg")

result = DeepFace.verify(img1, img2)

print('are they same', result["verified"])