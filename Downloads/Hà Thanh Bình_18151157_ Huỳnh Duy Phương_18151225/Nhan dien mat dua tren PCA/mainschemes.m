clear all
clc
close all
[file_name, file_path] = uigetfile ('*.jpg','Chon anh kiem tra ');
        if file_path ~= 0
            TestImage = imread ([file_path,file_name]);  
imshow(TestImage);
title('anh kiem tra');
TrainPath='CSDL';
T = taoCSDL(TrainPath);
[m, A, Eigenfaces] = taoEF(T);
OutputName = nhandienkhuonmat(TestImage, m, A, Eigenfaces);

anhtim = strcat(TrainPath,'\',OutputName);
anhtim = imread(anhtim);

imshow(TestImage);
title('anh kiem tra');
figure,imshow(anhtim);
title('anh tim duoc trong co so du lieu');

str = strcat('ten buc anh tim duoc  :  ',OutputName);
disp(str)
end
