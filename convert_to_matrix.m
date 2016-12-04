
clear;

size = '100';
c_1 = one_class_matrix('resized100/Art100','pic',100,90,1);
c_2 = one_class_matrix('resized100/concrete100','pic',100,131,2);
c_3 = one_class_matrix('resized100/content100','pic',100,254,3);
c_4 = one_class_matrix('resized100/contextual100','pic',100,56,4);
c_5 = one_class_matrix('resized100/Kinestetic100','pic',100,41,5);
c_6 = one_class_matrix('resized100/Physi100','pic',100,82,6);
c_7 = one_class_matrix('resized100/standard_alg100','pic',100,293,7);
c_8 = one_class_matrix('resized100/Visual_repre100','pic',100,235,8);
c_9 = one_class_matrix('resized100/peda100','pic',100,48,9);
feature_matrix = [c_1;c_2;c_3;c_4;c_5;c_6;c_7;c_8;c_9];
output = strcat('feature_', size, '.csv');
dlmwrite(output,feature_matrix,',');
function c_matrix = one_class_matrix(dir_name,common_filename,image_size, num,class_num)
vector_size = image_size ^ 2;
dir = strcat(dir_name,'/',common_filename);
c_matrix = [];
for i = 1:num
    filename = strcat(dir, int2str(i),'.jpg');
    img = imread(filename);
    g_img = rgb2gray(img);
    v_img = reshape(g_img, [1,vector_size]);
    c_matrix = [c_matrix; [v_img, class_num]];
end
end

% dir = strcat(size,'/without_resized/without');
% pics = [];
% for i = 1:599
%     filename = strcat(dir, int2str(i),'.jpg');
%     img = imread(filename);
%     g_img = rgb2gray(img);
%     v_img = reshape(g_img, [1,vector_size]);
%     pics = [pics; [v_img, 0]];
% end

