%%%%%%%%%%%%%%%%%% TFG Física %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%   Quimiotaxi   %%%%%%%%%%%%%%%%
%%%%%%%%%%%% Joaquim Frigola Casals %%%%%%%%%%%%
%%%%%%%%%  5è de Física i Matemàtiques %%%%%%%%%

function [outputArg1,outputArg2,outputArg3] = Quimotaxi_succinate(p,c,f,N,Db,Dc,Df,h,k,a,alp,gam)
%This function computes the chemotactic discretization described in section
%2.2 (equations 3 and 4) for all the points in the mesh. Also includes the
%succinate calculations described in section 2.6.
sumac = c(1:N,2:N+1)+c(3:N+2,2:N+1)+c(2:N+1,1:N)+c(2:N+1,3:N+2)-4*c(2:N+1,2:N+1);
sumaf = f(1:N,2:N+1)+f(3:N+2,2:N+1)+f(2:N+1,1:N)+f(2:N+1,3:N+2)-4*f(2:N+1,2:N+1);
sumacp = p(1:N,2:N+1).*(c(1:N,2:N+1)-c(2:N+1,2:N+1))+p(3:N+2,2:N+1).*(c(3:N+2,2:N+1)-c(2:N+1,2:N+1))+...
    p(2:N+1,1:N).*(c(2:N+1,1:N)-c(2:N+1,2:N+1))+p(2:N+1,3:N+2).*(c(2:N+1,3:N+2)-c(2:N+1,2:N+1));

outputArg1 = (Db*( p(1:N,2:N+1)+p(3:N+2,2:N+1)+p(2:N+1,1:N)+p(2:N+1,3:N+2)-4*p(2:N+1,2:N+1))+...
    k/2*(p(2:N+1,2:N+1).*sumac+sumacp)+a*p(2:N+1,2:N+1))/h^2; %Output f_p
outputArg2 = (Dc*(sumac)+alp*f(2:N+1,2:N+1).*p(2:N+1,2:N+1))/h^2; %Output f_c
outputArg3 = (Df*sumaf - gam*p(2:N+1,2:N+1))/h^2; %Output f_f
end

