%% Gràfics de punt concret en el temps
carpeta = "k_p=100";
nom = '(n1=0)(t=5000)';
N = 51;

rutap = '/'+carpeta+'/p_'+nom+'.txt';
rutac = '/'+carpeta+'/c_'+nom+'.txt';
p=readmatrix(rutap);
c=readmatrix(rutac);


k = figure();
k=surf(1:N,1:N,p(2:N+1,2:N+1));
set(k,'LineStyle','none');
hold off


figure();
colormap hot;
d=surf(1:N,1:N,c(2:N+1,2:N+1));
set(d,'LineStyle','none');
hold off

%% Animació en el temps de p
clc
clear
carpeta = "k_p=200";
nom = '(n1=0)';
N = 51;

v = VideoWriter('graf.mp4');
open(v);
% F = zeros(1,10000);
for i = 1000:1000:10000
    rutap = '/'+carpeta+'/p_'+nom+'(t='+i+')'+'.txt';
    p=readmatrix(rutap);
    s = figure;
    s.Visible = 'off';
    s=surf(1:N,1:N,p(2:N+1,2:N+1));
    set(s,'LineStyle','none');
    frame = getframe(gcf);
    writeVideo(v,frame);
end
close(v)

%% Animació en el temps de c
clc
clear
carpeta = "k_p=200";
nom = '(n1=0)';
N = 51;

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