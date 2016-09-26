load ('Database.mat','centers');
for i=1:10
    feature=centers(i*10-9:i*10,:);
        Mean=mean(feature);
        COV=cov(feature);
        invCOV=pinv(COV);
        Det=det(COV);
        MEAN{i}=Mean;
        INVCOV{i}=invCOV;
        DET{i}=Det;
end
 img=imread('C:\Users\Ahmed\Desktop\Test2.bmp');
 img = ~img ;
 img( ~any(img,2), : ) = []; 
 img(  : , ~any(img,1) ) = [];
 imgcen = GetCenVec (img , 3 , 3 );
 [s1 s2]=size(MEAN);
 Probs=[];
    for i=1:s2
        Prob = -1/2 * log(DET{i}) - (1/2 * (  (imgcen - MEAN{i}) * INVCOV{i} * (imgcen - MEAN{i})' )) ;
        Probs=[Probs ; Prob];
    end 
    [MAX i]=max(Probs)
    
        