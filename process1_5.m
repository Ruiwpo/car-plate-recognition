%process1_5.m%
%车牌定位移除对象

%计算连通区域
[labeled, num] = bwlabel(img_close);  % 连通区域标记
stats = regionprops(labeled, 'Area', 'BoundingBox');

%初始化空图
img_plate = zeros(size(img_close));

for i = 1:num
    area = stats(i).Area;
    bbox = stats(i).BoundingBox;
    aspect_ratio = bbox(3) / bbox(4);  % 宽 / 高

    %根据面积和长宽比过滤
    if area > 5000 && aspect_ratio > 2 && aspect_ratio < 6
        img_plate(labeled == i) = 1;  %保留符合条件的区域
    end
end

%显示结果
figure(6);
imshow(img_plate);
title('车牌定位移除对象');