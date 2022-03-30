%%%%%%%%%%%%%%%%%% TFG Física %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%   Quimiotaxi   %%%%%%%%%%%%%%%%
%%%%%%%%%%%% Joaquim Frigola Casals %%%%%%%%%%%%
%%%%%%%%%  5è de Física i Matemàtiques %%%%%%%%%

clc;
clear;

N = 501;
%n1 = 20;
h = 0.1;
Dt = 0.00001;
Db =  18;
%k = 200;
a = 0.3;
alp = 20;
iter = 10000;

for k = 100:25:200
    dir = "k_p="+k;
    mkdir(dir);
    for n1 = 0:5:20
        nom = "(n1="+n1+")";
        Simulacio(N,n1,h,Dt,Db,k,a,alp,iter,nom,dir);
    end
end

