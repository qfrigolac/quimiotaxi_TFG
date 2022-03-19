%%%%%%%%%%%%%%%%%% TFG Física %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%   Quimiotaxi   %%%%%%%%%%%%%%%%
%%%%%%%%%%%% Joaquim Frigola Casals %%%%%%%%%%%%
%%%%%%%%%  5è de Física i Matemàtiques %%%%%%%%%

clc;
clear;

N = 51;
n1 = 20;
h = 0.1;
Dt = 0.00001;
Db =  18;
k = 200;
a = 0.3;
alp = 20;
iter = 10000;
nom = "proba";
dir = "proba";

mkdir(dir);

% for 
Simulacio(N,n1,h,Dt,Db,k,a,alp,iter,nom,dir);