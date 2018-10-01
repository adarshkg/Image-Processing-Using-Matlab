%for checking the 2x2 pixel and finding the dominating pixel.after storing
%that pixel into a another matrix,upscaling of image is happening,100x100
%will convert to 50x50
location1='G:\06Segm1';
    imds=imageDatastore(fullfile(location1),'IncludeSubfolders',true,'FileExtensions','.tif','LabelSource','foldernames');
    imds=imageDatastore({'upscale25.tif'});
    img_lulc=readimage(imds,1);
    imgtemp=zeros(2,2);
    imgstore=zeros(ceil(2040/2),ceil(1670/2));
    imgcheck=zeros(6,6);
    imgnew=zeros(2040,1670);
    A=img_lulc;
    for i=3:2:2040
        for j=3:2:1670
                    imgtemp=A(i:i+1,j:j+1);
                    occ1=length(find(imgtemp==1));
                    occ2=length(find(imgtemp==2));
                    occ4=length(find(imgtemp==4));
                    occ7=length(find(imgtemp==7));
                    occ11=length(find(imgtemp==11));
                    occ92=length(find(imgtemp==92));
                    occ0=length(find(imgtemp==0));
                     if(occ1>occ2&&occ1>occ4&&occ1>occ7&&occ1>occ11&&occ1>occ92)
                        imgstore(floor(i/2),floor(j/2))=1;
                    elseif(occ2>occ1&&occ2>occ4&&occ2>occ7&&occ2>occ11&&occ2>occ92)
                        imgstore(floor(i/2),floor(j/2))=2;
                    elseif(occ4>occ1&&occ4>occ2&&occ4>occ7&&occ4>occ11&&occ4>occ92)
                        imgstore(floor(i/2),floor(j/2))=4;
                    elseif(occ7>occ1&&occ7>occ2&&occ7>occ4&&occ7>occ11&&occ7>occ92)
                        imgstore(floor(i/2),floor(j/2))=7;
                    elseif(occ11>occ1&&occ11>occ2&&occ11>occ4&&occ11>occ7&&occ11>occ92)
                        imgstore(floor(i/2),floor(j/2))=11;
                    elseif(occ0>occ1&&occ0>occ2&&occ0>occ0&&occ0>occ7&&occ0>occ92)
                        imgstore(floor(i/2),floor(j/2))=0;
                    elseif(occ92>occ1&&occ92>occ2&&occ92>occ4&&occ92>occ7&&occ92>occ11)
                        imgstore(floor(i/2),floor(j/2))=92;
                     else
                      imgcheck=img_lulc(i-2:i+3,j-2:j+3);     
                      occ1=length(find(imgtemp==1));
                      occ2=length(find(imgtemp==2));
                      occ4=length(find(imgtemp==4));
                      occ7=length(find(imgtemp==7));
                      occ11=length(find(imgtemp==11));
                    occ92=length(find(imgtemp==92));
                    occ0=length(find(imgtemp==0));
                     if(occ1>occ2&&occ1>occ4&&occ1>occ7&&occ1>occ11&&occ1>occ92)
                        imgstore(floor(i/2),floor(j/2))=1;
                    elseif(occ2>occ1&&occ2>occ4&&occ2>occ7&&occ2>occ11&&occ2>occ92)
                        imgstore(floor(i/2),floor(j/2))=2;
                    elseif(occ4>occ1&&occ4>occ2&&occ4>occ7&&occ4>occ11&&occ4>occ92)
                        imgstore(floor(i/2),floor(j/2))=4;
                    elseif(occ7>occ1&&occ7>occ2&&occ7>occ4&&occ7>occ11&&occ7>occ92)
                        imgstore(floor(i/2),floor(j/2))=7;
                    elseif(occ11>occ1&&occ11>occ2&&occ11>occ4&&occ11>occ7&&occ11>occ92)
                        imgstore(floor(i/2),floor(j/2))=11;
                    elseif(occ0>occ1&&occ0>occ2&&occ0>occ0&&occ0>occ7&&occ0>occ92)
                        imgstore(floor(i/2),floor(j/2))=0;
                    elseif(occ92>occ1&&occ92>occ2&&occ92>occ4&&occ92>occ7&&occ92>occ11)
                        imgstore(floor(i/2),floor(j/2))=92;
                     else
                        imgstore(floor(i/2),floor(j/2))=A(i,j);
                     end
                     end
        end
    end
            
                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
            