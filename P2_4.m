close all
clear all
clc

load('Quieto');
% Mean for offset
MA = mean(sensors(:,1:3));
MG = mean(sensors(:,4:6));

load('Ala_fija');
dt = 60/1000;

gx = sensors(:,4)-MG(:,1);
gy = sensors(:,5)-MG(:,2);
gz = sensors(:,6)-MG(:,3);
ax = sensors(:,1);
ay = sensors(:,2);
az = sensors(:,3);

N=linspace(1,60,length(sensors));
 for k=1:length(sensors)
     if k==1 
        acc_roll(k)  = atan(ay(k)/ sqrt(ax(k)^2 + az(k)^2))*57.2958;
        acc_pitch(k) = atan(-ax(k)/ sqrt(ay(k)^2 + az(k)^2))*57.2958;    
        
        gyro_roll(k) = acc_roll(k);
        gyro_pitch(k)= acc_pitch(k);  
 
        angle_pitch(k)= (0+(gy(k)*57.2958)*dt)*0.95 + acc_pitch(k)*0.05;      
        angle_roll(k) = (0+(gx(k)*57.2958)*dt) *0.95 + acc_roll(k) *0.05;
     else
        gyro_roll(k) = (gx(k)*57.2958)*dt+gyro_roll(k-1);
        gyro_pitch(k)= (gy(k)*57.2958)*dt+gyro_pitch(k-1);   

        acc_roll(k)  = atan(ay(k)/ sqrt(ax(k)^2 + az(k)^2))*57.2958;
        acc_pitch(k) = atan(-ax(k)/ sqrt(ay(k)^2 + az(k)^2))*57.2958;    
     
        angle_pitch(k)= (angle_pitch(k-1)+(gy(k)*57.2958)*dt)*0.95 + acc_pitch(k)*0.05;      
        angle_roll(k) = (angle_roll(k-1) +(gx(k)*57.2958)*dt)*0.95 + acc_roll(k) *0.05;
     end
 end

figure
plot(N,acc_pitch,N,gyro_pitch,N,angle_pitch)
title('Angles Pitch θ "Multirrotor"')
ylabel('Angle(grades)')
xlabel('time(s)')
legend('Acelerómetro','Giróscopo','Filtro Complementario')
figure
plot(N,acc_roll,N,gyro_roll,N,angle_roll)
title('Angles Roll Φ "Multirrotor"')
ylabel('Angle(grades)')
xlabel('time(s)')
legend('Acelerómetro','Giróscopo','Filtro Complementario')