%% Gràfics de punt concret en el temps
carpeta = "Vídeos/Gamma";
nom = 'des(nf=20,gam=0.0001)(t=10000)';
N = 501;

rutap = '/'+carpeta+'/p_'+nom+'.txt';

p=readmatrix(rutap);



k = figure();
k=surf(1:N,1:N,p(2:N+1,2:N+1));
% k=pcolor(1:N,1:N,p(2:N+1,2:N+1));
colorbar;
set(k,'LineStyle','none');
axis([0 500 0 500])
pbaspect([1 1 1])
hold off


rutac = '/'+carpeta+'/c_'+nom+'.txt';
rutaf = '/'+carpeta+'/f_'+nom+'.txt';

c=readmatrix(rutac);
f=readmatrix(rutaf);

figure();
colormap hot;
d=surf(1:N,1:N,c(2:N+1,2:N+1));
set(d,'LineStyle','none');
axis([0 500 0 500])
pbaspect([1 1 1])
hold off

figure();
colormap autumn;
d=surf(1:N,1:N,f(2:N+1,2:N+1));
set(d,'LineStyle','none');
axis([0 500 0 500])
pbaspect([1 1 1])
hold off

%% Animació en el temps de p

carpeta = "Vídeos/Gamma";
nom = 'des(nf=20,gam=0.0001)';
N = 501;

v = VideoWriter(['(nf=20,gam=0.0001)_simB1_ocell.mp4']);
open(v);
% F = zeros(1,10000);
for i = 1000:1000:10000
    rutap = '/'+carpeta+'/p_'+nom+'(t='+i+')'+'.txt';
    p=readmatrix(rutap);
    s = figure;
    s.Visible = 'off';
    s=pcolor(1:N,1:N,p(2:N+1,2:N+1));
    colorbar;
    set(s,'LineStyle','none');
    frame = getframe(gcf);
    writeVideo(v,frame);
end
close(v)

%% Animació en el temps de c
clc
clear
carpeta = "k_7=100";
nom = '(a=0.1)';
N = 501;

v = VideoWriter('graf.mp4');
open(v);
% F = zeros(1,10000);
for i = 1000:1000:10000
    rutac = '/'+carpeta+'/c_'+nom+'(t='+i+')'+'.txt';
    c=readmatrix(rutac);
    s = figure;
    s.Visible = 'off';
    s=surf(1:N,1:N,p(2:N+1,2:N+1));
    set(s,'LineStyle','none');
    frame = getframe(gcf);
    writeVideo(v,frame);
end
close(v)

%% Figura de mesures
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
