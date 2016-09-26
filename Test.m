function [ Distance ] = Test( img )

count=1;
img = ~img ;

Boxing=regionprops(img,'BoundingBox');
 img=imcrop(img,Boxing.BoundingBox);
 
     [r c]=size(img);
    newR=((round(((r/3)-floor(r/3))*3))+floor(r/3))*3-r;
    newC=((round(((c/3)-floor(c/3))*3))+floor(c/3))*3-c;
    img=[img;zeros(newR,c)];
    newcol=zeros(newR+r,newC);
    img=[img newcol];
    [r c]=size(img);
    %rimg=imresize(img,[30 30]);
    %Divide a corped image into 3*3 matrix
    cells=mat2cell(img,[r/3,r/3,r/3],[c/3,c/3,c/3]);
    Area=(r/3)*(c/3);
    %Check if its an empty block or not but val if empty else but centroid
    for j=1:3
        for k=1:3
%             flag=find(cells{k,j});
%             if(isempty((flag)))
%                 imgcen(count)=0;
%                 count=count+1;
%                 imgcen(count)=0;
%                 count=count+1;
%             end
%             if(~isempty((flag)))

           s=regionprops(cells{k,j},'centroid');
           centroids=cat(1,s.Centroid);
            if(~isnan(centroids))
           imgcen(count)=centroids(1)/Area;
           count=count+1;
           imgcen(count)=centroids(2)/Area;
           count=count+1;
            end
            if(isnan(centroids))
                imgcen(count)=100;
                 count=count+1;
                 imgcen(count)=100;
                 count=count+1;
            end
        end
    end
    load ('Database.mat','centers'); 
       
  
    MYdata = centers ;
    imgcen
       centers
  indx = 1 ; 
  
    for i = 1 : 100 
        sum = 0 ; 
        for j = 1 : 18
            tmp = ( (  imgcen(j) - MYdata(i , j) ) .^ 2 );
            flag = isnan(tmp);
            if(flag == 0)
           sum = sum +  tmp;
            end
        end
        sum = sum / 18 ; 
        Distance  (indx) = sum ;
        
        indx = indx + 1 ; 
    end
whos
end

