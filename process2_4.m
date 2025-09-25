%process2_4.m%
%车牌识别移除对象

%连通域分析
cc = bwconncomp(car_plate_bw);  
stats = regionprops(cc, 'BoundingBox', 'Area');

%创建空图像用于保留目标字符
car_plate_clean= false(size(car_plate_bw));

%面积、长宽比阈值
min_area = 50;
max_aspect_ratio = 5;   % 过细的形状将被视为噪声

for i = 1:length(stats)
    box = stats(i).BoundingBox;
    area = stats(i).Area;
    
    w = box(3); h = box(4);
    aspect_ratio = max(w, h) / min(w, h);  % 比例不分横竖
    
    %保留合格的目标字符（面积大且形状不极端）
    if area > min_area && aspect_ratio < max_aspect_ratio
        car_plate_clean(cc.PixelIdxList{i}) = 1;
    end
end

%显示结果
figure(11);
imshow(car_plate_clean);
title('车牌识别移除对象');