%process1_1.m%
%预灰度处理
clc,clear;

%读取原图
origin_img = imread ('车牌库/g1.jpg');
figure(1);
imshow(origin_img);
title('原图');

%将原图转换为灰度图
img_gray=rgb2gray(origin_img);

%显示结果
figure(2);
imshow(img_gray);
title('预灰度处理');