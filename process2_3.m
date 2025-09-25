%process2_3.m%
%车牌识别图像二值化

T = 56;  %阈值
car_plate_bw = zeros(size(car_plate_eq));  %初始化二值图

car_plate_bw(car_plate_eq >= T) = 0;  %灰度值大于等于阈值的设为0
car_plate_bw(car_plate_eq < T) = 1;   %小于阈值的设为1

%显示结果
figure(10);
imshow(car_plate_bw);
title('车牌识别图像二值化');