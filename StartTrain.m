function [ centers , Labels ] = StartTrain()
% loading All Img 
% finding complement 
% croping desired part 
% get Centroid vector 
% save data 
folderName = 'C:\Users\Ahmed\Desktop\Pattern Recognition Data Set (0-9)';
Direc = dir(folderName); 
Imgs = Direc(~[Direc.isdir]);
indx = 1 ;
for i = 1:100
    %reading Image
    imgs=imread( strcat('C:\Users\Ahmed\Desktop\Pattern Recognition Data Set (0-9)\',Imgs(i).name));
    % complement 
    imgs = ~imgs ; 
    % Croping
      imgs( ~any(imgs,2), : ) = []; %2for raws
      imgs(  : , ~any(imgs,1) ) = [];%1for coloumns
  
     
     Temp = GetCenVec ( imgs , 3 ,3 ) ;
     
     centers (  indx , : ) = Temp ;
     disp (centers (  indx , : ));
     Labels (: ,indx ) = i;
     indx= indx +1 ;
     
     save ('Database.mat','centers' );
end
 
    
    
end 
 
