%process2_1.m%
%车牌识别灰度处理

%将彩色图转换为灰度图
car_plate_gray=rgb2gray(car_plate_img);

%显示结果
figure(8);
imshow(car_plate_gray);
title('车牌识别灰度处理');