%process2_5.m%
%车牌识别中值滤波

[rows, cols] = size(car_plate_clean);
car_plate_filtered = false(rows, cols);  %初始化输出图像

for i = 2:rows-1
    for j = 2:cols-1
        %取3x3邻域
        window = car_plate_clean(i-1:i+1, j-1:j+1);
        pixels = sort(window(:));
        %取中位数
        median_val = pixels(5);
        car_plate_filtered(i, j) = median_val;
    end
end

% 显示结果
figure(12);
imshow(car_plate_filtered);
title('车牌识别中值滤波');