N = 51;
h = 0.1;
Dt = 0.00001;
Db = 18;
Dc = 32;
k = 200;
a = 0.3;
alp = 20;


p = zeros(N+2,N+2);
c = zeros(N+2,N+2);



tempp = zeros(N+2,N+2);
kp1 = zeros(N+2,N+2);
kp2 = zeros(N+2,N+2);
kp3 = zeros(N+2,N+2);

tempc = zeros(N+2,N+2);
kc1 = zeros(N+2,N+2);
kc2 = zeros(N+2,N+2);
kc3 = zeros(N+2,N+2);

% A = sparse(A);
% k1 = sparse(k1);
% k2 = sparse(k2);
% k3 = sparse(k3);

n= 0;
p(N/2+1-n:N/2+1+n,N/2+1-n:N/2+1+n) = 10;
n1 = 20;
c(N/2+1-n1:N/2+1+n1,N/2+1-n1:N/2+1+n1) = 1;



for i = 1:10000
    [kp1(2:N+1,2:N+1),kc1(2:N+1,2:N+1)] = Quimotaxi(p,c,N,Db,Dc,h,k,a,alp);
    
    kp1(1,:) = -kp1(2,:);
    kp1(N+2,:) = -kp1(N+1,:);
    kp1(:,1) = -kp1(:,2);
    kp1(:,N+2) = -kp1(:,N+1);
    
    kc1(1,:) = -kc1(2,:);
    kc1(N+2,:) = -kc1(N+1,:);
    kc1(:,1) = -kc1(:,2);
    kc1(:,N+2) = -kc1(:,N+1);

    
    tempp = p + 1/3*Dt*kp1;
    tempc = c + 1/3*Dt*kc1;

    tempp(1,:) = -tempp(2,:);
    tempp(N+2,:) = -tempp(N+1,:);
    tempp(:,1) = -tempp(:,2);
    tempp(:,N+2) = -tempp(:,N+1);
    
    tempc(1,:) = -tempc(2,:);
    tempc(N+2,:) = -tempc(N+1,:);
    tempc(:,1) = -tempc(:,2);
    tempc(:,N+2) = -tempc(:,N+1);
    
    
    
    [kp2(2:N+1,2:N+1),kc2(2:N+1,2:N+1)] = Quimotaxi(tempp,tempc,N,Db,Dc,h,k,a,alp);
    
    kp2(1,:) = -kp2(2,:);
    kp2(N+2,:) = -kp2(N+1,:);
    kp2(:,1) = -kp2(:,2);
    kp2(:,N+2) = -kp2(:,N+1);
    
    kc2(1,:) = -kc2(2,:);
    kc2(N+2,:) = -kc2(N+1,:);
    kc2(:,1) = -kc2(:,2);
    kc2(:,N+2) = -kc2(:,N+1);


    tempp = p + 2/3*Dt*kp2;
    tempc = c + 2/3*Dt*kc2;
    
    tempp(1,:) = -tempp(2,:);
    tempp(N+2,:) = -tempp(N+1,:);
    tempp(:,1) = -tempp(:,2);
    tempp(:,N+2) = -tempp(:,N+1);
    
    tempc(1,:) = -tempc(2,:);
    tempc(N+2,:) = -tempc(N+1,:);
    tempc(:,1) = -tempc(:,2);
    tempc(:,N+2) = -tempc(:,N+1);
    
    
    
    [kp3(2:N+1,2:N+1),kc3(2:N+1,2:N+1)] = Quimotaxi(tempp,tempc,N,Db,Dc,h,k,a,alp);
    
    kp3(1,:) = -kp3(2,:);
    kp3(N+2,:) = -kp3(N+1,:);
    kp3(:,1) = -kp3(:,2);
    kp3(:,N+2) = -kp3(:,N+1);
    
    kc3(1,:) = -kc3(2,:);
    kc3(N+2,:) = -kc3(N+1,:);
    kc3(:,1) = -kc3(:,2);
    kc3(:,N+2) = -kc3(:,N+1);

    p = p + 1/4 * Dt * (kp1 + 3*kp3);
    c = c + 1/4 * Dt * (kc1 + 3*kc3);
    
    p(1,:) = -p(2,:);
    p(N+2,:) = -p(N+1,:);
    p(:,1) = -p(:,2);
    p(:,N+2) = -p(:,N+1);
    
    c(1,:) = -c(2,:);
    c(N+2,:) = -c(N+1,:);
    c(:,1) = -c(:,2);
    c(:,N+2) = -c(:,N+1);

%     if mod(i,1000)==0
%         s = figure;
%         s.Visible = 'off';
%         s=surf(1:N,1:N,p(2:N+1,2:N+1));
%         set(s,'LineStyle','none');
%         F(i) = getframe(gcf);
%     end
    if mod(i,100)==0
        [~,indy]=maxk(p(N/2+0.5,:),6);
        indy = sort(indy);
        indy = [indy(2) indy(4)];
        [~,ind2y]=min(p(N/2+0.5,indy(1):indy(2)));
        ry(i) = ind2y-1;
        [~,indx]=maxk(p(:,N/2+0.5),6);
        indx = sort(indx);
        indx = [indx(2) indx(4)];
        [~,ind2x]=min(p(N/2+0.5,indx(1):indx(2)));
        rx(i) = ind2x-1;
        if sum(indx==indy)~=2
            alert(i) = 1;
        end
     end
end
%% 



%%
% colormap hot;

k = figure();
k=surf(1:N,1:N,p(2:N+1,2:N+1));
set(k,'LineStyle','none');
hold on
plot3(indx,[N/2+0.5 N/2+0.5],p(indx,N/2+0.5),'.r','markersize',10);
plot3([N/2+0.5 N/2+0.5],indy,p(N/2+0.5,indy),'.r','markersize',10);
plot3([N/2+0.5 N/2+0.5],indy+12,p(N/2+0.5,indy+12),'.r','markersize',10);
plot3([N/2+0.5 N/2+0.5],indy-12,p(N/2+0.5,indy-12),'.r','markersize',10);

plot3([N/2+0.5 N/2+0.5],indy(1)+ind2y,p(N/2+0.5,indy(1)+ind2y),'.r','markersize',10);
hold off


figure();
colormap hot;
d=surf(1:N,1:N,c(2:N+1,2:N+1));
set(d,'LineStyle','none');
hold off

% F = F(~cellfun(@isempty,{F.cdata}));
% movie(F)
