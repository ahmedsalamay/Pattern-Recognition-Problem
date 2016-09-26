centers=load('Database.mat') ;
centers=centers';
z=ones(10,100);
z=z*-1;
index=1;
for i=1:10:100
    
z(index,i:i+9)=z(index,i:i+9)*-1;
end
 c=newff(centers,z,[],{'tansig','tansig'});
% d=train(c,centers,z)





%%%%%%%%
%v=sim(c,testv)

 
 
 
  