function [ Distance ] = TestMyCode( img )


img = ~img ;

img( ~any(img,2), : ) = []; %2for raws
 img(  : , ~any(img,1) ) = [];%1for coloumns
 
 
 imgcen = GetCenVec (img , 3 , 3 );
      load ('Database.mat','centers'); 
      
  
    MYdata = centers ;
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

end

