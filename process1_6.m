%process1_6.m%
%图像裁剪

%找到所有白色像素的坐标
[row, col] = find(img_plate);

%计算车牌框的上下左右边界
min_row = min(row);
max_row = max(row);
min_col = min(col);
max_col = max(col);

%裁剪原始图像中的对应区域
car_plate_img = origin_img(min_row:max_row, min_col:max_col, :);  % 支持彩色图像也可裁剪

%显示结果
figure(7);
imshow(car_plate_img);
title('图像裁剪');