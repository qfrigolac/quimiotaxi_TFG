%%%%%%%%%%%%%%%%%% TFG Física %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%   Quimiotaxi   %%%%%%%%%%%%%%%%
%%%%%%%%%%%% Joaquim Frigola Casals %%%%%%%%%%%%
%%%%%%%%%  5è de Física i Matemàtiques %%%%%%%%%

function Simulacio_succinate(N,n1,n2,f0,h,Dt,Db,Df,k,a,alp,gam,iter,nom,dir)
%This funcion applies the Runge-Kuta method in order to solve the partial
%diferential equation of the Keller and Segel model, as described in
%section 2.3. Succinate included. Refer to the "Simulacio.m" program for
%detailed explanation of each part of the code.


Dc = 32;
p = zeros(N+2,N+2);
c = zeros(N+2,N+2);
f = zeros(N+2,N+2);

rx = zeros(1,iter/100);
ry = zeros(1,iter/100);
rx2 = zeros(1,iter/100);
ry2 = zeros(1,iter/100);
alert = zeros(1,iter/100);
gruix = zeros(1,iter/100);
prof = zeros(1,iter/100);

tempp = zeros(N+2,N+2);
kp1 = zeros(N+2,N+2);
kp2 = zeros(N+2,N+2);
kp3 = zeros(N+2,N+2);

tempc = zeros(N+2,N+2);
kc1 = zeros(N+2,N+2);
kc2 = zeros(N+2,N+2);
kc3 = zeros(N+2,N+2);

tempf = zeros(N+2,N+2);
kf1 = zeros(N+2,N+2);
kf2 = zeros(N+2,N+2);
kf3 = zeros(N+2,N+2);

n= 0;
p(floor(N/2)+2-n:floor(N/2)+2+n,floor(N/2)+2-n:floor(N/2)+2+n) = 10;
c(floor(N/2)+2-n1:floor(N/2)+2+n1,floor(N/2)+2-n1:floor(N/2)+2+n1) = 1;
f(floor(N/2)+2-n2:floor(N/2)+2+n2,floor(N/2)+2-n2:floor(N/2)+2+n2) = f0;
%writematrix(p,"p_"+nom+"(t=0).txt",'Delimiter','tab');
    for i = 1:iter
        [kp1(2:N+1,2:N+1),kc1(2:N+1,2:N+1),kf1(2:N+1,2:N+1)] = Quimotaxi_succinate(p,c,f,N,Db,Dc,Df,h,k,a,alp,gam);
        
        kp1(1,:) = -kp1(2,:);
        kp1(N+2,:) = -kp1(N+1,:);
        kp1(:,1) = -kp1(:,2);
        kp1(:,N+2) = -kp1(:,N+1);
        
        kc1(1,:) = -kc1(2,:);
        kc1(N+2,:) = -kc1(N+1,:);
        kc1(:,1) = -kc1(:,2);
        kc1(:,N+2) = -kc1(:,N+1);

        kf1(1,:) = -kf1(2,:);
        kf1(N+2,:) = -kf1(N+1,:);
        kf1(:,1) = -kf1(:,2);
        kf1(:,N+2) = -kf1(:,N+1);
    
        
        tempp = p + 1/3*Dt*kp1;
        tempc = c + 1/3*Dt*kc1;
        tempf = f + 1/3*Dt*kf1;

        tempp(1,:) = -tempp(2,:);
        tempp(N+2,:) = -tempp(N+1,:);
        tempp(:,1) = -tempp(:,2);
        tempp(:,N+2) = -tempp(:,N+1);
        
        tempc(1,:) = -tempc(2,:);
        tempc(N+2,:) = -tempc(N+1,:);
        tempc(:,1) = -tempc(:,2);
        tempc(:,N+2) = -tempc(:,N+1);
        
        tempf(1,:) = -tempf(2,:);
        tempf(N+2,:) = -tempf(N+1,:);
        tempf(:,1) = -tempf(:,2);
        tempf(:,N+2) = -tempf(:,N+1);
        

        [kp2(2:N+1,2:N+1),kc2(2:N+1,2:N+1),kf2(2:N+1,2:N+1)] = Quimotaxi_succinate(tempp,tempc,tempf,N,Db,Dc,Df,h,k,a,alp,gam);
        
        kp2(1,:) = -kp2(2,:);
        kp2(N+2,:) = -kp2(N+1,:);
        kp2(:,1) = -kp2(:,2);
        kp2(:,N+2) = -kp2(:,N+1);
        
        kc2(1,:) = -kc2(2,:);
        kc2(N+2,:) = -kc2(N+1,:);
        kc2(:,1) = -kc2(:,2);
        kc2(:,N+2) = -kc2(:,N+1);

        kf2(1,:) = -kf2(2,:);
        kf2(N+2,:) = -kf2(N+1,:);
        kf2(:,1) = -kf2(:,2);
        kf2(:,N+2) = -kf2(:,N+1);    

         
        tempp = p + 2/3*Dt*kp2;
        tempc = c + 2/3*Dt*kc2;
        tempf = f + 2/3*Dt*kf2;
        
        tempp(1,:) = -tempp(2,:);
        tempp(N+2,:) = -tempp(N+1,:);
        tempp(:,1) = -tempp(:,2);
        tempp(:,N+2) = -tempp(:,N+1);
        
        tempc(1,:) = -tempc(2,:);
        tempc(N+2,:) = -tempc(N+1,:);
        tempc(:,1) = -tempc(:,2);
        tempc(:,N+2) = -tempc(:,N+1);
        
        tempf(1,:) = -tempf(2,:);
        tempf(N+2,:) = -tempf(N+1,:);
        tempf(:,1) = -tempf(:,2);
        tempf(:,N+2) = -tempf(:,N+1);
        

        [kp3(2:N+1,2:N+1),kc3(2:N+1,2:N+1),kf3(2:N+1,2:N+1)] = Quimotaxi_succinate(tempp,tempc,tempf,N,Db,Dc,Df,h,k,a,alp,gam);

        kp3(1,:) = -kp3(2,:);
        kp3(N+2,:) = -kp3(N+1,:);
        kp3(:,1) = -kp3(:,2);
        kp3(:,N+2) = -kp3(:,N+1);
        
        kc3(1,:) = -kc3(2,:);
        kc3(N+2,:) = -kc3(N+1,:);
        kc3(:,1) = -kc3(:,2);
        kc3(:,N+2) = -kc3(:,N+1);

        kf3(1,:) = -kf3(2,:);
        kf3(N+2,:) = -kf3(N+1,:);
        kf3(:,1) = -kf3(:,2);
        kf3(:,N+2) = -kf3(:,N+1);
    
        p = p + 1/4 * Dt * (kp1 + 3*kp3);
        c = c + 1/4 * Dt * (kc1 + 3*kc3);
        f = f + 1/4 * Dt * (kf1 + 3*kf3);

        p(1,:) = -p(2,:);
        p(N+2,:) = -p(N+1,:);
        p(:,1) = -p(:,2);
        p(:,N+2) = -p(:,N+1);
        
        c(1,:) = -c(2,:);
        c(N+2,:) = -c(N+1,:);
        c(:,1) = -c(:,2);
        c(:,N+2) = -c(:,N+1);

        f(1,:) = -f(2,:);
        f(N+2,:) = -f(N+1,:);
        f(:,1) = -f(:,2);
        f(:,N+2) = -f(:,N+1);

        if mod(i,100)==0
        [~,indy]=maxk(p(N/2+0.5,:),6);
        indy = sort(indy);
        indy = [indy(2) indy(4)];
        [~,ind2y]=min(p(N/2+0.5,indy(1):indy(2)));
        ry(1,i/100) = ind2y-1;
        ry2(1,i/100) = (indy(2)-indy(1))/2;
        [~,indx]=maxk(p(:,N/2+0.5),6);
        indx = sort(indx);
        indx = [indx(2) indx(4)];
        [~,ind2x]=min(p(N/2+0.5,indx(1):indx(2)));
        rx(1,i/100) = ind2x-1;
        rx2(1,i/100) = (indx(2)-indx(1))/2;
            if sum(indx==indy)~=2
                alert(1,i/100) = 1;
            end


        prof(1,i/100) = (p(N/2+0.5,indy(1))-p(N/2+0.5,indy(1)+ind2y));
        avg = p(N/2+0.5,indy(1)+ind2y) + prof(1,i/100) * 9/10;
        gruix(1,i/100) = -1;
        if abs(indy(1)-indy(2))>1 && isempty(find((p(N/2+0.5,(indy(1):indy(2))))<=avg,1))==0 && isempty(find((p(N/2+0.5,(1:indy(1))))>=avg,1))==0
            gruix(1,i/100) = indy(1)+find((p(N/2+0.5,(indy(1):indy(1)+ind2y)))<=avg,1)-find((p(N/2+0.5,(1:indy(1))))>=avg,1);
        end
        end
        if mod(i,1000)==0
            writematrix(p,dir+"/p_"+nom+"(t="+i+").txt",'Delimiter','tab')
        end
        if mod(i,10000)==0
            writematrix(c,dir+"/c_"+nom+"(t="+i+").txt",'Delimiter','tab')
            writematrix(f,dir+"/f_"+nom+"(t="+i+").txt",'Delimiter','tab')
        end
        if mod(i,10000)==0
            writematrix(rx,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab')
            writematrix(ry,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab','WriteMode','append')
            writematrix(rx2,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab','WriteMode','append')
            writematrix(ry2,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab','WriteMode','append')
            writematrix(alert,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab','WriteMode','append')
            writematrix(gruix,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab','WriteMode','append')
            writematrix(prof,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab','WriteMode','append')
        end
    end
writematrix(rx,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab')
writematrix(ry,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab','WriteMode','append')
writematrix(rx2,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab','WriteMode','append')
writematrix(ry2,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab','WriteMode','append')
writematrix(alert,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab','WriteMode','append')
writematrix(gruix,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab','WriteMode','append')
writematrix(prof,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab','WriteMode','append')
end