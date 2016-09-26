 load ('Database.mat','centers');
 centers(:,19)=1;       
 z=zeros(100,19,10);
 for i=1: 10
     z(:,:,i)=centers*(-1);
 end
 for i=1:10
         z(i*10-9:i*10,:,i)=z(i*10-9:i*10,:,i)*(-1);
 end
 one=ones(100,1);
 w=zeros(19,1,10);
 for i=1:10
     m=z(:,:,i);
     minv=transpose(m);
     s=(pinv((minv*m))*minv)*one;
      w(:,:,i)=s;
 end 
 
 img=imread('C:\Users\Ahmed\Desktop\Test2.bmp');
 img = ~img ;
img( ~any(img,2), : ) = []; %2for raws
 img(  : , ~any(img,1) ) = [];%1for coloumns
 imgcen = GetCenVec (img , 3 , 3 );
 imgcen(1,19)=1;
 w=reshape(w,19,10);
 c=imgcen*w;
  count=0;
  for i=1:10
      if(c(i)>0)
          Number=i-1;
          count=count+1;
      end
  end
  if (count==1)
      Number
  end
  if(count>1)
      undetermind=1 
  end
  if(count==0)
      newClass=1
  end