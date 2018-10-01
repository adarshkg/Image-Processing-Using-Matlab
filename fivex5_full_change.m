location1='G:\06Segm1';
imds=imageDatastore(fullfile(location1),'IncludeSubfolders',true,'FileExtensions','.tif','LabelSource','foldernames');
imds=imageDatastore({'upscale12_5.tif'});
img_lulc=readimage(imds,1);
imgtemp=zeros(5,5);
[row,col]=size(img_lulc);
imgnew=zeros(row-2,col-2);
for i=3:row-2
    for j=3:col-2
         imgtemp=img_lulc(i-2:i+2,j-2:j+2);
         occurance=sum(sum(((imgtemp==1))));
         if(occurance>0 && occurance<20)
             imgnew(i-1:i+1,j-1:j+1)=31;
         elseif(occurance>=20)
             imgnew(i-1:i+1,j-1:j+1)=32;
         else
            imgnew(i,j)=img_lulc(i,j);
            
         end
    end
end
  imwrite(uint8(imgnew),'nb_hood_12_20_5x5.tif');
  imshow(imgnew,[]);
  impixelinfo;