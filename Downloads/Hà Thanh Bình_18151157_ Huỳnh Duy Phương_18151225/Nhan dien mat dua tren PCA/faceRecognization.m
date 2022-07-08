function anhtim = nhandienkhuonmat(InputImage, m, A, E)
%Ham nay se so sanh buc anh kiem tra voi tung buc anh trong csdl .
%anhtim la ten cua buc anh tim duoc trong csld
%tim toa do chieu cua moi vector cot trong A (tuong ung voi mot buc anh ) 
%bang cach nhan E' voi cac vector cot nay .

toado = [];%tap toa do hinh chieu cua moi buc anh trong csdl
sovector = size(E,2);%so vector rieng trong E ( la so cot )
for i = 1 : sovector
    tam = E'*A(:,i); %toa do hinh chieu cua buc anh Ai
    toado = [toado tam]; 
end

tam = rgb2gray(InputImage);

[dong cot] = size(tam);
InImage = reshape(tam',dong*cot,1);
%tinh do lech giua anh kiem tra va anh trung binh trong csdl , do lech la
%mot vector cot giong nhu cac vector cot trong ma tran A
dolech = double(InImage)-m; 
%tuong tu nhu khi tim toa do hinh chieu cua cac vector cot cua A , bay gio ta
%tim toa do hinh chieu cua buc anh kiem tra 
toadoKT = E'*dolech; 
%
hinhchieuKT=double(InImage)*0;
for i=1:sovector
    hinhchieuKT=hinhchieuKT + toadoKT(i,1)*E(:,i);
end
show(hinhchieuKT,'Hinh chieu cua buc anh len khong gian mat');figure;
kc=norm(double(InImage)-hinhchieuKT);
str=num2str(kc);
str=strcat('Khoang cach tu anh kiem tra toi khong gian khuon mat : ',str);
disp(str);
%ta luu y la moi toa do hinh chieu la mot vector , ta se dung chuan Euclid de tinh
%khoang cach giua 2 vector (2 toa do hinh chieu)
khoangcach = [];
for i = 1 : sovector
    q = toado(:,i);
    tam = ( norm( toadoKT - q ) )^2;
    khoangcach = [khoangcach tam];
end
%lay ra khoang cach ngan nhat va vi tri cua buc anh tim duoc trong csdl ,
%ta luu y la nhung file anh trong csdl co ten la : 1.jpg , 2.jpg ....
[minKC , vitri] = min(khoangcach);
str=num2str(minKC);
str=strcat('Min khoang cach hai toa do hinh chieu : ',str);
disp(str);
anhtim = strcat(int2str(vitri),'.jpg');
