function colfet=color_luv(rgb_im)
xyzTransformation = makecform('srgb2xyz');
xyzI = applycform(rgb_im,xyzTransformation);
warning('off');
luvTransformation = makecform('xyz2uvl');
luvI = applycform(xyzI,luvTransformation);
L=luvI(:,:,1);
U=luvI(:,:,2);
V=luvI(:,:,3);
 colfet(1)= mean(L(:));
 colfet(2) = std(L(:))^2;
 colfet(3)= skewness(L(:));
    colfet(4) = mean(U(:));
    colfet(5) = std(U(:))^2;
    colfet(6) = skewness(U(:));
    colfet(7) = mean(V(:));
    colfet(8) = std(V(:))^2;
   colfet(9) = skewness(V(:));
colfet=colfet';
end
