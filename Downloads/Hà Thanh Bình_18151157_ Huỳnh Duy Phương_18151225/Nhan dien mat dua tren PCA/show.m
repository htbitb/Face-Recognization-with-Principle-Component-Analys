function show(m,t)
im=imread('anhmau.jpg');
try
    im=rgb2gray(im);
catch
end
[dong,cot]=size(im);
tam=reshape(m,cot,dong);
tam = tam';
imshow(tam);
dem=1;
for i=1:dong
    for j=1:cot  
       im(i,j)=tam(i,j);

    end 
end
imshow(im);title(t)
end