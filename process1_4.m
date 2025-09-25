%process1_4.m%
%车牌定位平滑处理

se = strel('rectangle', [50, 100]);   %结构元素
img_close = imclose(img_erode, se);   %闭运算，先膨胀后腐蚀

%显示结果
figure(5);
imshow(img_close);
title('车牌定位平滑处理');