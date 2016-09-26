% [g,ctrs]=kmeans(f,10)
% 
% plot(f(g==1,1),f(g==1,2),'r.','MarkerSize',12)
% hold on
% plot(f(g==2,1),f(g==2,2),'b.','MarkerSize',12)
% plot(ctrs(:,1),ctrs(:,2),'kf', 'MarkerSize',12,'LineWidth',2)
% plot(ctrs(:,1),ctrs(:,2),'ko','MarkerSize',12,'LineWidth',2)
% legend('Clusterser 1','Clusterser 2','Centroids','Location','NW')

% 
% load fisheriris
% X = meas(:,3:4);
% figure;
% plot(X(:,1),X(:,2),'k*','MarkerSize',5);
% title 'Fisher''s Iris Data';
% xlabel 'Petal Lengths (cm)';
% ylabel 'Petal Widths (cm)';
% figure ;
% [g ctrs]=kmeans(X,2);
% 
% plot(X(g==1,1),X(g==1,2),'r.','MarkerSize',12)
% hold on
% plot(X(g==2,1),X(g==2,2),'b.','MarkerSize',12)
% plot(ctrs(:,1),ctrs(:,2),'--rs', 'MarkerSize',12,'LineWidth',2)
% plot(ctrs(:,1),ctrs(:,2),'--rs','MarkerSize',12,'LineWidth',2)
% legend('Clusterser 1','Clusterser 2','Centroids','Location','NW')
load ('Database.mat','centers');
 f=centers;
k=10;
src=dir('*.bmp');
NewValues = kmeans(f,k);
for i=1:k
    Clusters = find (NewValues == i);
    [a , b] = size(Clusters)   ;
    culster='cClusterser Number'
    Clusterser = i
    for j=1:a
        name = src(Clusters(j)).name 
    end
     disp('----------------------')
end



