gpu = gpuDevice();
fprintf('Using a %s GPU.\n', gpu.Name)
sizeOfDouble = 8; % Each double-precision number needs 8 bytes of storage
sizes = power(2, 14:28);


%%
carpeta = "Vídeos";
nom = '(Db=20,k=100)(t=50000)';
N = 501;
i=7000;

rutap = '/'+carpeta+'/p_'+nom+'.txt';
%rutac = '/'+carpeta+'/c_'+nom+'.txt';
p=readmatrix(rutap);
[~,indy]=maxk(p(N/2+0.5,:),6);
indy = sort(indy);
indy = [indy(2) indy(4)];
[~,ind2y]=min(p(N/2+0.5,indy(1):indy(2)));
j=0;

ry= ind2y-1+j/2;
ry2 = (indy(2)-indy(1))/2;
[~,indx]=maxk(p(:,N/2+0.5),6);
indx = sort(indx);
indx = [indx(2) indx(4)];
[~,ind2x]=min(p(N/2+0.5,indx(1):indx(2)));
rx =ind2x-1;
rx2 = (indx(2)-indx(1))/2;

prof = (p(N/2+0.5,indy(1))-p(N/2+0.5,indy(1)+ind2y));
avg = p(N/2+0.5,indy(1)+ind2y) + prof * 9/10;
gruix = -1;
if abs(indy(1)-indy(2))>1 && isempty(find((p(N/2+0.5,(indy(1):indy(2))))<=avg,1))==0 && isempty(find((p(N/2+0.5,(1:indy(1))))>=avg,1))==0
    gruix = indy(1)+find((p(N/2+0.5,(indy(1):indy(1)+ind2y)))<=avg,1)-find((p(N/2+0.5,(1:indy(1))))>=avg,1);
end

k = figure();
k=surf(1:N,1:N,p(2:N+1,2:N+1));
set(k,'LineStyle','none');
hold on
plot3(indx,[N/2+0.5 N/2+0.5],p(indx,N/2+0.5),'.r','markersize',10);
plot3([N/2+0.5 N/2+0.5],indy,p(N/2+0.5,indy),'.r','markersize',10);
plot3([N/2+0.5 N/2+0.5],indy+floor(gruix/2),p(N/2+0.5,indy+floor(gruix/2)),'.r','markersize',10,'Color','blue');
plot3([N/2+0.5 N/2+0.5],indy-floor(gruix/2),p(N/2+0.5,indy-floor(gruix/2)),'.r','markersize',10,'Color','blue');

plot3([N/2+0.5 N/2+0.5],indy(1)+floor(ry2)-1,p(N/2+0.5,indy(1)+floor(ry2)-1),'.r','markersize',10,'Color','green');

axis([0 500 0 500])
pbaspect([1 1 1])
hold off

