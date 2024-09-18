# Car Detection Using YOLOv4-Tiny

This repository contains a neural network built using yolo-tiny, Darknet, Darkmark, and Darkhelp to detect cars in images and videos.
Official updated Darknet repo: https://github.com/hank-ai/darknet currently maintained by Stephane Charette.

## Table of Contents
1. [Project Overview](#project-overview)
2. [Model Architecture](#model-architecture)
3. [Installation](#installation)
4. [Usage](#usage)
    - Inference on images,videos,other streams
    - Training
5. [Dataset](#dataset)
6. [Results](#results)



## Project Overview
This project is a neural network designed to recognize cars in various images or video streams. I used the yolov4-tiny architecture for efficient, real-time object detection.
Here are some example predictions made by the model:


![img1](https://github.com/mateicojo/car-detection-yolov4-tiny/blob/main/results/image%20(1).png)
![img2](https://github.com/mateicojo/car-detection-yolov4-tiny/blob/main/results/image%20(2).png)
![img3](https://github.com/mateicojo/car-detection-yolov4-tiny/blob/main/results/image%20(3).png)
![img4](https://github.com/mateicojo/car-detection-yolov4-tiny/blob/main/results/image.png)

## Model Architecture
- **YOLOv4-tiny**: A lightweight version of YOLO designed for real-time object detection.
- **Customizations**: This model has been trained specifically to detect cars using a dataset of aprox. 400 images of cars labeled using the DarkMark tool. (https://www.ccoderun.ca/darkmark/index.html)

**Note**: To use DarkMark with your Darknet model, you will also need DarkHelp built and installed (https://www.ccoderun.ca/darkhelp/api/Summary.html)

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/mateicojo/car-detection-yolov4-tiny.git
   cd car-detection-yolov4-tiny
   ```
2. Install Darknet (if not already installed): Follow the instructions from the official Darknet repository [here](https://github.com/hank-ai/darknet).
   
**Note** I would rather NOT copy or create any directories in the root darknet folder, a sepparate directory can be created and the absolute paths can be specified to make sure everything goes well.

## Usage
**Inference on images or videos**
1. Using only darknet method:
  In case Darkhelp is not setup on your system, but you still want to detect cars in an image, or video, using only the darknet tool run the following command:
```bash
darknet detector test /cars.data /cars.cfg /cars_final.weights /path/to/image/or/video -ext_output **optional** -threshold <specify a threshold ex. 0.25>
```
2. Using DarkHelp method:
   Navigate to the car-detection-yolov4-tiny directory, and run the following command
```bash
DarkHelp cars.cfg cars_final.weights cars.names <path to video, image, or directory of images>
```
**Training**

  Improvement to the current state of the model can be made by further training. If you wish to do so, I recommend using the DarkMark tool, load your training dataset files and link the cars_final.weights and cars.cfg file to the project.
  Since the network is already trained, DarkMark will automatically be making predictions on your loaded dataset, you will only have to accept/decline the predictions and do some fine tuning here and there.
  After annotating your dataset, right-click>create darknet files
  To start training, run the generated script:
```bash
./cars_train.sh
```
## Dataset
  To train this model, I used a really fast and accesible method: loaded a couple dashcam videos, split them into random frames using DarkMark and went straight to annotating the images. The current model was trained using approximately 400 of those frames. 
  **Note** No matter what you're training for, use negative samples (images where the object to be detected does NOT appear). It is recommended that 50% of your dataset is made of negative samples.

## Results
The chart shows how well the model is learning during training. It is automatically generated by darknet. Loss measures the error between the predicted and actual values (the lower the loss, the better the model is performing, here the loss got to 0.3773 which is pretty good). The mean Average Precision (mAP) measures the model's accuracy in detecting objects across all classes. A 97% mAP level indicates very good detection performance.

![chart](https://github.com/mateicojo/car-detection-yolov4-tiny/blob/main/results/chart.png)
