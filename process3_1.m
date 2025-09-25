%process3_1.m%
%模板读取

char_models = {};   %存储车牌字符匹配模板图
char_labels = {};   %存储模板对应字符标签

%数字模板
for i = 0:9
    img = imread(['车牌匹配库/', num2str(i), '.jpg']);
    img = imbinarize(im2gray(img));  %转为黑白二值图
    char_models{end+1} = img;
    char_labels{end+1} = num2str(i);
end

%汉字模板
hanzi_list = {'川', '赣', '贵', '黑', '吉', '冀', '津', '晋', '京', '警', '辽', '鲁', '蒙', '宁', '陕', '苏', '皖', '湘', '豫', '粤', '浙'};
for i = 1:length(hanzi_list)
    img = imread(['车牌匹配库/', hanzi_list{i}, '.jpg']);
    img = imbinarize(im2gray(img));  %转为黑白二值图
    char_models{end+1} = img;
    char_labels{end+1} = hanzi_list{i};
end

%字母模板
letter_list = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
for i = 1:length(letter_list)
    img = imread(['车牌匹配库/', letter_list{i}, '.jpg']);
    img = imbinarize(im2gray(img));  %转为黑白二值图
    char_models{end+1} = img;
    char_labels{end+1} = letter_list{i};
end