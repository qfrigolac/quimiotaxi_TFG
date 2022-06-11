%%%%%%%%%%%%%%%%%% TFG Física %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%   Quimiotaxi   %%%%%%%%%%%%%%%%
%%%%%%%%%%%% Joaquim Frigola Casals %%%%%%%%%%%%
%%%%%%%%%  5è de Física i Matemàtiques %%%%%%%%%

%This code is made to run the solutions on different parameters
%automatically using parallel computing.

clc;
clear;

tic
ticBytes(gcp);

%Conditions on the numerical solutions
N = 501;    %Mesh squares (NxN)
n1 = 0;     %Half of the lateral of the square of initial attractant
h = 0.1;    %Lenght of the lateral of a mesh cell
Dt = 0.00001;   %Step of time
Db =  18;   %Bacterial diffusion ctant
k = 100;    %Chemotactic ctant
a = 0;      %Bacterial replication ctant
alp = 100;  %Attractant production ctant
iter = 100000;  %Number of iterations of the solution
    
dir = "sim1A"; %Directory to save the results
mkdir(dir);

alpha = [0,10,50,100];

for i = 1:3
    k = 25*i+50;
    parfor var = 1:4 %Parallel for
        alp = alpha(var);
        nom = "(alp="+alp+",k="+k+")";
        Simulacio(N,n1,h,Dt,Db,k,a,alp,iter,nom,dir); %Solution
    end
end
% 
tocBytes(gcp)
toc


%% INTRODUCTION OF SUCCINATE

%Same as before but including the succinate.

clc;
clear;

tic
ticBytes(gcp);


N = 501;
n1 = 0;
h = 0.1;
Dt = 0.00001;
Db =  18;
Df = 32; %Succinate diffusion ctant
k = 100;
a = 0;
alp = 100;
iter = 100000;
gam = 0.0001; %Succinate consumption ctant
n2 = 70; %Half of the lateral of the square of initial succinate
f0 = 1;

dir = "sim3Bb";
mkdir(dir);

for i = 1
    f0 = i;
    parfor j = 0:4
        a = j*0.1;
        nom = "des(nf="+n2+",f0="+f0+"a="+a+")";
        Simulacio_succinate(N,n1,n2,f0,h,Dt,Db,Df,k,a,alp,gam,iter,nom,dir);
    end
end

tocBytes(gcp)
toc