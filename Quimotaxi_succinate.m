function [outputArg1,outputArg2,outputArg3] = Quimotaxi_succinate(p,c,f,N,Db,Dc,Df,h,k,a,alp,gam)
%QUIMOTAXI Summary of this function goes here
sumac = c(1:N,2:N+1)+c(3:N+2,2:N+1)+c(2:N+1,1:N)+c(2:N+1,3:N+2)-4*c(2:N+1,2:N+1);
sumaf = f(1:N,2:N+1)+f(3:N+2,2:N+1)+f(2:N+1,1:N)+f(2:N+1,3:N+2)-4*f(2:N+1,2:N+1);
sumacp = p(1:N,2:N+1).*(c(1:N,2:N+1)-c(2:N+1,2:N+1))+p(3:N+2,2:N+1).*(c(3:N+2,2:N+1)-c(2:N+1,2:N+1))+...
    p(2:N+1,1:N).*(c(2:N+1,1:N)-c(2:N+1,2:N+1))+p(2:N+1,3:N+2).*(c(2:N+1,3:N+2)-c(2:N+1,2:N+1));

outputArg1 = (Db*( p(1:N,2:N+1)+p(3:N+2,2:N+1)+p(2:N+1,1:N)+p(2:N+1,3:N+2)-4*p(2:N+1,2:N+1))+...
    k/2*(p(2:N+1,2:N+1).*sumac+sumacp)+a*p(2:N+1,2:N+1))/h^2;
outputArg2 = (Dc*(sumac)+alp*f(2:N+1,2:N+1).*p(2:N+1,2:N+1))/h^2;
outputArg3 = (Df*sumaf - gam*p(2:N+1,2:N+1))/h^2;
end

