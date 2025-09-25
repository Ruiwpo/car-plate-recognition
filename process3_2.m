%process3_2.m%
%分割字符图像

char_imgs = {};  %保存分割后的字符图像

%使用闭运算和填充增强连通性，避免一个字符因某些笔画不连通而误被切分
se = strel('rectangle', [10 5]);
car_plate_closed = imclose(car_plate_filtered, se);
car_plate_filled = imfill(car_plate_closed, 'holes');

%提取连通域，定位整个字符
cc = bwconncomp(car_plate_filled);
stats = regionprops(cc, 'BoundingBox', 'Area');
bboxes_all = cat(1, stats.BoundingBox);

%筛选合理尺寸的字符区域
aspect_ratios = bboxes_all(:,3) ./ bboxes_all(:,4);
keep_idx = find((aspect_ratios > 0.2 & aspect_ratios < 1.0) & (bboxes_all(:,3) > 5 & bboxes_all(:,4) > 10));
bboxes = bboxes_all(keep_idx, :);

%将字符区域按横坐标排序
[~, sort_idx] = sort(bboxes(:,1));
bboxes = bboxes(sort_idx, :);

%在原始黑白二值车牌图上裁剪字符
for i = 1:size(bboxes,1)
    box = round(bboxes(i,:));
    x = max(box(1)); y = max(box(2));
    w = box(3); h = box(4);
    char_crop = imcrop(car_plate_clean, [x, y, w, h]);

    if i == 1
        % 假设你想上填5，下填10，左填3，右填8
        char_crop = padarray(char_crop, [0, 0], 0, 'pre');   % 上
        char_crop = padarray(char_crop, [6, 0], 0, 'post'); % 下
        char_crop = padarray(char_crop, [0, 12], 0, 'pre');   % 左
        char_crop = padarray(char_crop, [0, 0], 0, 'post');  % 右
    end

    %将分割后的字符图像尺寸调整为与模板图尺寸一致
    char_crop = imresize(char_crop, [40 20]);

    %存储分割后的字符图像
    char_imgs{end+1} = char_crop;
end