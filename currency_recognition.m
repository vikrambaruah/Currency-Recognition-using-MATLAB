clear;clc;
[imname,impath]=uigetfile({'*.jpg;*.png'});
im=imread([impath,'/',imname]);
im=imresize(im,[128 128]);
 r_channel=im(:,:,1);
 b_channel=im(:,:,2);
 g_channel=im(:,:,3);
 r_channel=medfilt2(r_channel);
 g_channel=medfilt2(g_channel);
 b_channel=medfilt2(b_channel);
 rgbim(:,:,1)=r_channel;
 rgbim(:,:,2)=g_channel;
 rgbim(:,:,3)=b_channel;
fet=totalfeature(rgbim);
load db;
k=length(currency);
for j=1:k
    D(j)=dist(fet',currency(j).feature);
end
[value,index]=min(D);
   currency_name=currency(index).name;
   fprintf('recognized currency is : ');
   disp(currency_name)
  

 
    
