%process2_2.m%
%车牌识别直方图均衡化

%转换为double类型
car_plate_gray = double(car_plate_gray);  
[H, W] = size(car_plate_gray);  %图像尺寸

%计算直方图
hist_counts = zeros(1, 256);  %记录每个灰度出现的次数
for i = 0:255
    hist_counts(i+1) = sum(car_plate_gray(:)==i);
end

%计算累计直方图（每个灰度级对应的累计概率分布）
cdf = zeros(1, 256);
total = 0;
for i = 1:256
    total = total + hist_counts(i);
    cdf(i) = total;
end
cdf = cdf / (H * W);  %归一化

%映射
mapping = round(cdf * 255);  %映射表
img_eq = zeros(H, W);
for i = 1:H
    for j = 1:W
        img_eq(i,j) = mapping(car_plate_gray(i,j) + 1);  %将原灰度值映射到新的灰度值
    end
end

%转换为uint8类型
car_plate_eq = uint8(img_eq);

%显示结果
figure(9);
imshow(car_plate_eq);
title('车牌识别直方图均衡化');