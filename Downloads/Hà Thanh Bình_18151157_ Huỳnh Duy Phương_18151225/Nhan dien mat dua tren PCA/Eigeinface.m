function [m, A, E] = taoEF(T)
% Su dung phuong phap phan tich thanh phan chinh (PCA) de xac dinh nhung net
% khac biet giua nhung buc anh
% T la mot ma tran kich thuoc M*NxP chua tat ca anh trong csdl , moi anh la 
% mot vector cot trong ma tran T .
% tra ve 3 gia tri :
%        m  anh trung binh
%        A  tap hop nhung (anh-anh trung binh )
%        E  nhung vector rieng cua ma tran A*A' 
       
 
%%%%%%%%%%%%%% tinh toan anh trung binh
m = mean(T,2); 
soanh = size(T,2);

%xuat ra hinh anh cua m
show(m,'anh trung binh');

%%%%%%%%%%%%%% tinh do lech giua anh moi buc anh voi anh trung binh
A = [];  
for i = 1 : soanh
    temp = double(T(:,i)) - m; % T(:,i): vector cot thu i chinh la mot buc anh
    if i< 6 
    show(temp,'anh - anh trung binh');figure;
    end 
    A = [A temp]; 
end


% tim nhung tri rieng va nhung vector rieng cua ma tran A'*A , tu do tim
% nhung vector rieng cua ma tran A*A' la nhung Eigenface

L = A'*A; 
[V D] = eig(L); 
%V chua nhung vector rieng , con D chua nhung tri rieng trong do vector
%rieng V(:,i) ung voi tri rieng D(i,i)
D1=diag(D);
D1=sort(D1);
s=size(D1,1);
D1=D1(s-18);
LeigV = [];%tap hop vector rieng cua ma tran L=A'*A
for i = 1 : size(V,2) 
    if( D(i,i)>D1 )
        LeigV = [LeigV V(:,i)];
    end
end
%ta chi lay 18 vector rieng ung voi 18 tri rieng lon nhat

E = A * LeigV;

%xuat ra mot so hinh anh cua cac Eigenface
for i=1:18
    anh=E(:,i);
    show(anh,'Eigenface'); figure;
end

%E la mot co so gom nhung vector truc giao , ta se chuan hoa no de E bien
%thanh mot co so truc chuan
sovector=size(E,2);
for i=1:sovector
    dodai=norm(E(:,i));
    E(:,i)=E(:,i)/dodai;
end
