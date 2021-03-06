%%%%%%%%%%%%%%%%%% TFG Física %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%   Quimiotaxi   %%%%%%%%%%%%%%%%
%%%%%%%%%%%% Joaquim Frigola Casals %%%%%%%%%%%%
%%%%%%%%%  5è de Física i Matemàtiques %%%%%%%%%

function Simulacio(N,n1,h,Dt,Db,k,a,alp,iter,nom,dir)
%This funcion applies the Runge-Kuta method in order to solve the partial
%diferential equation of the Keller and Segel model, as described in
%section 2.3


Dc = 32; %Fixed for all the study.
p = zeros(N+2,N+2); 
c = zeros(N+2,N+2);

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

%Initial conditions:
n= 0;
p(floor(N/2)+2-n:floor(N/2)+2+n,floor(N/2)+2-n:floor(N/2)+2+n) = 10;
c(floor(N/2)+2-n1:floor(N/2)+2+n1,floor(N/2)+2-n1:floor(N/2)+2+n1) = 1;

%Iterative programe as many time steps as needed.
    for i = 1:iter
        %k1:
        [kp1(2:N+1,2:N+1),kc1(2:N+1,2:N+1)] = Quimotaxi(p,c,N,Db,Dc,h,k,a,alp);
        
        %Boundery conditions for k1
        kp1(1,:) = -kp1(2,:);
        kp1(N+2,:) = -kp1(N+1,:);
        kp1(:,1) = -kp1(:,2);
        kp1(:,N+2) = -kp1(:,N+1);
        
        kc1(1,:) = -kc1(2,:);
        kc1(N+2,:) = -kc1(N+1,:);
        kc1(:,1) = -kc1(:,2);
        kc1(:,N+2) = -kc1(:,N+1);
    
        
        tempp = p + 1/3*Dt*kp1;
        tempc = c + 1/3*Dt*kc1;
    
        tempp(1,:) = -tempp(2,:);
        tempp(N+2,:) = -tempp(N+1,:);
        tempp(:,1) = -tempp(:,2);
        tempp(:,N+2) = -tempp(:,N+1);
        
        tempc(1,:) = -tempc(2,:);
        tempc(N+2,:) = -tempc(N+1,:);
        tempc(:,1) = -tempc(:,2);
        tempc(:,N+2) = -tempc(:,N+1);
        
        
        %k2
        [kp2(2:N+1,2:N+1),kc2(2:N+1,2:N+1)] = Quimotaxi(tempp,tempc,N,Db,Dc,h,k,a,alp);
        
        %Boundery conditions for k2
        kp2(1,:) = -kp2(2,:);
        kp2(N+2,:) = -kp2(N+1,:);
        kp2(:,1) = -kp2(:,2);
        kp2(:,N+2) = -kp2(:,N+1);
        
        kc2(1,:) = -kc2(2,:);
        kc2(N+2,:) = -kc2(N+1,:);
        kc2(:,1) = -kc2(:,2);
        kc2(:,N+2) = -kc2(:,N+1);
    
    
        tempp = p + 2/3*Dt*kp2;
        tempc = c + 2/3*Dt*kc2;
        
        tempp(1,:) = -tempp(2,:);
        tempp(N+2,:) = -tempp(N+1,:);
        tempp(:,1) = -tempp(:,2);
        tempp(:,N+2) = -tempp(:,N+1);
        
        tempc(1,:) = -tempc(2,:);
        tempc(N+2,:) = -tempc(N+1,:);
        tempc(:,1) = -tempc(:,2);
        tempc(:,N+2) = -tempc(:,N+1);
        
        
        %k3
        [kp3(2:N+1,2:N+1),kc3(2:N+1,2:N+1)] = Quimotaxi(tempp,tempc,N,Db,Dc,h,k,a,alp);
        
        %Boundery conditions for k3
        kp3(1,:) = -kp3(2,:);
        kp3(N+2,:) = -kp3(N+1,:);
        kp3(:,1) = -kp3(:,2);
        kp3(:,N+2) = -kp3(:,N+1);
        
        kc3(1,:) = -kc3(2,:);
        kc3(N+2,:) = -kc3(N+1,:);
        kc3(:,1) = -kc3(:,2);
        kc3(:,N+2) = -kc3(:,N+1);
        
        %Actual Heun's method:
        p = p + 1/4 * Dt * (kp1 + 3*kp3);
        c = c + 1/4 * Dt * (kc1 + 3*kc3);
        
        %Boundary conditions
        p(1,:) = -p(2,:);
        p(N+2,:) = -p(N+1,:);
        p(:,1) = -p(:,2);
        p(:,N+2) = -p(:,N+1);
        
        c(1,:) = -c(2,:);
        c(N+2,:) = -c(N+1,:);
        c(:,1) = -c(:,2);
        c(:,N+2) = -c(:,N+1);
    
        %Measurments:
        if mod(i,100)==0
            %Maximums in y th. center
            [~,indy]=maxk(p(N/2+0.5,:),6); 
            indy = sort(indy);
            indy = [indy(2) indy(4)];

            %Minimum in y btwn the maxs
            [~,ind2y]=min(p(N/2+0.5,indy(1):indy(2)));

            %The 2 radiis in y
            ry(1,i/100) = ind2y-1;
            ry2(1,i/100) = (indy(2)-indy(1))/2;

            %Maximums in x th. center
            [~,indx]=maxk(p(:,N/2+0.5),6);
            indx = sort(indx);
            indx = [indx(2) indx(4)];

            %Minimum in x btwn the maxs
            [~,ind2x]=min(p(N/2+0.5,indx(1):indx(2)));

            %The 2 radiis in x
            rx(1,i/100) = ind2x-1;
            rx2(1,i/100) = (indx(2)-indx(1))/2;

            %Check if x and y radii are equal:
            if sum(indx==indy)~=2 
                alert(1,i/100) = 1;
            end

            %Depth:
            prof(1,i/100) = (p(N/2+0.5,indy(1))-p(N/2+0.5,indy(1)+ind2y));

            %Width:
            avg = p(N/2+0.5,indy(1)+ind2y) + prof(1,i/100) * 9/10;
            gruix(1,i/100) = -1;
            if abs(indy(1)-indy(2))>1 && isempty(find((p(N/2+0.5,(indy(1):indy(2))))<=avg,1))==0 && isempty(find((p(N/2+0.5,(1:indy(1))))>=avg,1))==0
                gruix(1,i/100) = indy(1)+find((p(N/2+0.5,(indy(1):indy(1)+ind2y)))<=avg,1)-find((p(N/2+0.5,(1:indy(1))))>=avg,1);
            end
        end

        %Saving the data
        if mod(i,1000)==0
            writematrix(p,dir+"/p_"+nom+"(t="+i+").txt",'Delimiter','tab')
        end
        if mod(i,5000)==0
            writematrix(c,dir+"/c_"+nom+"(t="+i+").txt",'Delimiter','tab')
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
writematrix(p,dir+"/p_"+nom+"(t="+i+").txt",'Delimiter','tab')
writematrix(rx,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab')
writematrix(ry,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab','WriteMode','append')
writematrix(rx2,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab','WriteMode','append')
writematrix(ry2,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab','WriteMode','append')
writematrix(alert,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab','WriteMode','append')
writematrix(gruix,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab','WriteMode','append')
writematrix(prof,dir+"/rx-ry-inf_"+nom+".txt",'Delimiter','tab','WriteMode','append')
end