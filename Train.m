function [ centers ,    Labels ] = Train()

list=dir('*.bmp');
indx = 1 ;
count=1;
for i = 1:100
       %read an image
    imgs=list(i).name;
    imgs=imread(imgs);
    % complement 
    imgs = ~imgs ; 
    % Croping
      Boxing=regionprops(imgs,'BoundingBox');
      imgs=imcrop(imgs,Boxing.BoundingBox);
      
      
      %Equatiob to make dim divided by 3 RESIZE
     [r c]=size(imgs);
    newR=((round(((r/3)-floor(r/3))*3))+floor(r/3))*3-r;
    newC=((round(((c/3)-floor(c/3))*3))+floor(c/3))*3-c;
    imgs=[imgs;zeros(newR,c)];
    newcol=zeros(newR+r,newC);
    imgs=[imgs newcol];
    [r c]=size(imgs);
    %rimg=imresize(imgs,[30 30]);
    %Divide a corped image into 3*3 matrix
    cells=mat2cell(imgs,[r/3,r/3,r/3],[c/3,c/3,c/3]);
    Area=(r/3)*(c/3);
    %Check if its an empty block or not but val if empty else but centroid
    for j=1:3
        for k=1:3
%             flag=find(cells{k,j});
%             if(isempty((flag)))
%                 centers(i,count)=0;
%                 count=count+1;
%                 centers(i,count)=0;
%                 count=count+1;
%             end
%             if(~isempty((flag)))
           s=regionprops(cells{k,j},'centroid');
           
           centroids=cat(1,s.Centroid);
           if(~isnan(centroids))
           centers(i,count)=centroids(1)/Area;
           count=count+1;
           centers(i,count)=centroids(2)/Area;
           count=count+1;
           end
           if(isnan(centroids))
                centers(i,count)=100;
                 count=count+1;
                 centers(i,count)=100;
                 count=count+1;
             end
          
        end
    end
    count=1;

     Labels (: ,indx ) = i;
     indx= indx +1 ;
     
     save ('Database.mat','centers' );
end
 
    
end    