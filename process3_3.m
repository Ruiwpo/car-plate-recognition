%process3_3.m%
%模板匹配识别字符

recognized_chars = '';  %保存识别出的字符串（车牌）

for i = 1:length(char_imgs)
    char_img = char_imgs{i};

    %车牌字符位置限制
    if i == 1
        %第1位：省份汉字
        valid_idx = find(ismember(char_labels, hanzi_list));
    elseif i == 2
        %第2位：英文
        valid_idx = find(ismember(char_labels, letter_list));
    else
        %第3位及以后：英文或数字
        valid_idx = find(ismember(char_labels, [letter_list, arrayfun(@num2str, 0:9, 'UniformOutput', false)]));
    end

    max_score = -Inf;
    best_char = '?';

    for j = valid_idx
        %将分割后的字符图与模板图尺寸统一
        tmpl = imresize(label_imgs{j}, size(char_img));

        %匹配度计算
        score = corr2(char_img, tmpl);  %计算相关系数
        if score > max_score
            max_score = score;
            best_char = char_labels{j};  %筛选出匹配度最高的字符
        end
    end
    
    %保存字符识别结果
    recognized_chars = [recognized_chars best_char];
end

%展示车牌识别结果
disp(['识别结果: ', recognized_chars]);