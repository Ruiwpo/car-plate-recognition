%process1_2.m%
%预处理边缘检测

%将图像归一化
img_gray = double(img_gray) / 255;

%Roberts算子
Gx = [1 0; 0 -1];
Gy = [0 1; -1 0];

%卷积
Ix = conv2(img_gray, Gx, 'same');
Iy = conv2(img_gray, Gy, 'same');

%计算梯度幅值（边缘强度）
grad_mag = sqrt(Ix.^2 + Iy.^2);
threshold = 0.2;  %阈值
img_edge = grad_mag > threshold;

%将逻辑图像转换为0-255范围
img_edge = uint8(img_edge) * 255;

%显示结果
figure(3);
imshow(img_edge);
title('预处理边缘检测');