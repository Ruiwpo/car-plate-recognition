%process1_3.m%
%图像腐蚀

se = strel('line', 12, 90);  %结构元素

%使用结构元素对图像进行腐蚀处理
img_erode = imerode(img_edge, se);

%显示结果
figure(4);
imshow(img_erode);