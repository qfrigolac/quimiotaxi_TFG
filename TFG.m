%%%%%%%%%%%%%%%%%% TFG Física %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%   Quimiotaxi   %%%%%%%%%%%%%%%%
%%%%%%%%%%%% Joaquim Frigola Casals %%%%%%%%%%%%
%%%%%%%%%  5è de Física i Matemàtiques %%%%%%%%%

clc;
clear;

tic
ticBytes(gcp);

N = 501;
n1 = 0;
h = 0.1;
Dt = 0.00001;
Db =  18;
k = 100;
%a = 0;
alp = 100;
iter = 1000;

for i = 1:1
    k = 25*i;
    dir = "k_prov="+k;
    mkdir(dir);
    parfor n12 = 0:7
        a = n12*0.1;
        nom = "(a="+a+")";
        Simulacio(N,n1,h,Dt,Db,k,a,alp,iter,nom,dir);
    end
end
tocBytes(gcp)
toc


%% PART 2

clc;
clear;

tic
ticBytes(gcp);

N = 501;
n1 = 0;
h = 0.1;
Dt = 0.00001;
Db =  18;
Df = 32;
k = 100;
a = 0;
alp = 100;
iter = 1000;

%for i = 0:4
%     gam = 25*i
    gam = 0.0001;
    dir = "sim2_provs";
    mkdir(dir);
    parfor j = 0:4
        n2 = j*10;
        nom = "des(nf="+n2+",gam="+gam+")";
        Simulacio_succinate(N,n1,n2,h,Dt,Db,Df,k,a,alp,gam,iter,nom,dir);
    end
% end
tocBytes(gcp)
toc