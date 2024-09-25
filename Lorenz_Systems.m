clear all
close all
clc

%% prob 1
Beta = [10;28;8/3];
x0 =  [0;1;20];% I.C
dt = 0.001; % time step size
tspan = 0:dt:50;

figure(1)
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);
plot3(x(:,1),x(:,2),x(:,3),'r','lineWidth',1.5);
set(gca,'color','w','xcolor','r','ycolor','r','zcolor','r')
set(gcf,'color','w')
xlabel('porportional to the rate of convention')
ylabel('horizontal temperature variation')
zlabel('vertical temperature variation')

hold on
options1 = odeset('RelTol',1e-6,'AbsTol',1e-6*ones(1,3));
[t1,x1] = ode45(@(t1,x1)lorenz(t1,x1,Beta),tspan,x0,options1);
plot3(x1(:,1),x1(:,2),x1(:,3),'b','lineWidth',1.5);
set(gca,'color','w','xcolor','b','ycolor','b','zcolor','b')
set(gcf,'color','w') 
grid on
legend('1e-12','1e-6')

figure(2)
subplot(3,1,1)
plot(t,x(:,1),'r',t1,x1(:,1),'b')
title('x(t)') %porportional to the rate of convention in respect to time
legend('1e-12','1e-6')
xlabel('time')
ylabel('y(t)') %porportional to the rate of convention
subplot(3,1,2)
plot(t,x(:,2),'r',t1,x1(:,2),'b')
title('y(t)') %horizontal temperature variation in respect to time
ylabel('HA temp var')
xlabel('time')
subplot(3,1,3)
plot(t,x(:,3),'r',t1,x1(:,3),'b')
title('z(t)') %vertical temperature variation in respect to time
xlabel('time')
ylabel('VA temp var') %vertical temperature variation


%% problem 2
Beta = [10;28;8/3]; 
x0=[0;1;20]; 
x01=[0.10001;1;20]; 
x02=[0.15;1;20]; 
dt=0.001; 
tspan1=0:dt:1; 
tspan2=0:dt:3; 
tspan3=0:dt:7; 

% t=1
figure(3) 
options=odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3)); 
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan1,x0,options); 
plot3(x(:,1),x(:,2),x(:,3),'r','LineWidth',1.5); 
set(gca,'color','k','xcolor','w','ycolor','w','zcolor','w'); 
set(gcf,'color','k') 
xlabel('x') 
ylabel('y') 
zlabel('z') 
title('T=1') 
hold on 
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan1,x01,options1); 
plot3(x(:,1),x(:,2),x(:,3),'b','LineWidth',1.5); 
set(gca,'color','w','xcolor','k','ycolor','k','zcolor','k'); 
set(gcf,'color','w') 
hold on 
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan1,x02,options1); 
plot3(x(:,1),x(:,2),x(:,3),'g','LineWidth',1.5); 
set(gca,'color','w','xcolor','k','ycolor','k','zcolor','k'); 
set(gcf,'color','w') 
legend('(0,1,20)','(0.10001,1,20)', '(0.15,1,20)' ,"Location","NorthEast"); 
hold off 

figure (4)
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan1,x0,options);
subplot(3,1,1),plot(t,x(:,1))
hold on
subplot(3,1,2),plot(t,x(:,2))
hold on
subplot(3,1,3),plot(t,x(:,3))
hold on
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan1,x01,options);
subplot(3,1,1),plot(t,x(:,1))
subplot(3,1,2),plot(t,x(:,2))
subplot(3,1,3),plot(t,x(:,3))
hold on
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan1,x02,options);
subplot(3,1,1),plot(t,x(:,1))
title('x component')
xlabel('t')
ylabel('x(t)')
legend('(0,1,20)','(0.10001,1,20)', '(0.15,1,20)' ,"Location","NorthEast");
subplot(3,1,2),plot(t,x(:,2))
title('y component')
xlabel('t')
ylabel('y(t)')
legend('(0,1,20)','(0.10001,1,20)', '(0.15,1,20)' ,"Location","NorthEast");
subplot(3,1,3),plot(t,x(:,3))
title('z component')
xlabel('t')
ylabel('z(t)')
legend('(0,1,20)','(0.10001,1,20)', '(0.15,1,20)' ,"Location","NorthEast");
hold off

% T=3
figure(5) 
options=odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3)); 
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan2,x0,options); 
plot3(x(:,1),x(:,2),x(:,3),'r','LineWidth',1.5); 
set(gca,'color','k','xcolor','w','ycolor','w','zcolor','w'); 
set(gcf,'color','k') 
xlabel('x') 
ylabel('y') 
zlabel('z') 
title('T=3') 
hold on 
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan2,x01,options1); 
plot3(x(:,1),x(:,2),x(:,3),'b','LineWidth',1.5); 
set(gca,'color','w','xcolor','k','ycolor','k','zcolor','k'); 
set(gcf,'color','w') 
hold on 
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan2,x02,options1); 
plot3(x(:,1),x(:,2),x(:,3),'g','LineWidth',1.5); 
set(gca,'color','w','xcolor','k','ycolor','k','zcolor','k'); 
set(gcf,'color','w') 
legend('(0,1,20)','(0.10001,1,20)', '(0.15,1,20)' ,"Location","NorthEast"); 
hold off 

figure(6)
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan2,x0,options);
subplot(3,1,1),plot(t,x(:,1))
hold on
subplot(3,1,2),plot(t,x(:,2))
hold on
subplot(3,1,3),plot(t,x(:,3))
hold on
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan2,x01,options);
subplot(3,1,1),plot(t,x(:,1))
subplot(3,1,2),plot(t,x(:,2))
subplot(3,1,3),plot(t,x(:,3))
hold on
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan2,x02,options);
subplot(3,1,1),plot(t,x(:,1))
title('x component')
xlabel('t')
ylabel('x(t)')
legend('(0,1,20)','(0.10001,1,20)', '(0.15,1,20)' ,"Location","NorthEast");
subplot(3,1,2),plot(t,x(:,2))
title('y component')
xlabel('t')
ylabel('y(t)')
legend('(0,1,20)','(0.10001,1,20)', '(0.15,1,20)' ,"Location","NorthEast");
subplot(3,1,3),plot(t,x(:,3))
title('z component')
xlabel('t')
ylabel('z(t)')
legend('(0,1,20)','(0.10001,1,20)', '(0.15,1,20)' ,"Location","NorthEast");
hold off

%T =7
figure(7) 
options=odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3)); 
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan3,x0,options); 
plot3(x(:,1),x(:,2),x(:,3),'r','LineWidth',1.5); 
set(gca,'color','k','xcolor','w','ycolor','w','zcolor','w'); 
set(gcf,'color','k') 
xlabel('x') 
ylabel('y') 
zlabel('z') 
title('T=3') 
hold on 
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan3,x01,options1); 
plot3(x(:,1),x(:,2),x(:,3),'b','LineWidth',1.5); 
set(gca,'color','w','xcolor','k','ycolor','k','zcolor','k'); 
set(gcf,'color','w') 
hold on 
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan3,x02,options1); 
plot3(x(:,1),x(:,2),x(:,3),'g','LineWidth',1.5); 
set(gca,'color','w','xcolor','k','ycolor','k','zcolor','k'); 
set(gcf,'color','w') 
legend('(0,1,20)','(0.10001,1,20)', '(0.15,1,20)' ,"Location","NorthEast"); 
hold off 

figure(8)
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan3,x0,options);
subplot(3,1,1),plot(t,x(:,1))
hold on
subplot(3,1,2),plot(t,x(:,2))
hold on
subplot(3,1,3),plot(t,x(:,3))
hold on
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan3,x01,options);
subplot(3,1,1),plot(t,x(:,1))
subplot(3,1,2),plot(t,x(:,2))
subplot(3,1,3),plot(t,x(:,3))
hold on
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan3,x02,options);
subplot(3,1,1),plot(t,x(:,1))
title('x component')
xlabel('t')
ylabel('x(t)')
legend('(0,1,20)','(0.10001,1,20)', '(0.15,1,20)' ,"Location","NorthEast");
subplot(3,1,2),plot(t,x(:,2))
title('y component')
xlabel('t')
ylabel('y(t)')
legend('(0,1,20)','(0.10001,1,20)', '(0.15,1,20)' ,"Location","NorthEast");
subplot(3,1,3),plot(t,x(:,3))
title('z component')
xlabel('t')
ylabel('z(t)')
legend('(0,1,20)','(0.10001,1,20)', '(0.15,1,20)' ,"Location","NorthEast");
hold off


%% problem 3
Beta1 = [10;0.5;8/3];
Beta2 = [10;1;8/3];
Beta3 = [10;15;8/3];
x01 =  [0;0.5;20];% I.C
dt = 0.001; % time step size
tspan = 0:dt:7;

figure(9)
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta1),tspan,x0,options);
plot3(x(:,1),x(:,2),x(:,3),'r','lineWidth',1.5);
set(gca,'color','w','xcolor','r','ycolor','r','zcolor','r')
set(gcf,'color','w')
xlabel('porportional to the rate of convention')
ylabel('horizontal temperature variation')
zlabel('vertical temperature variation')

hold on
options1 = odeset('RelTol',1e-6,'AbsTol',1e-6*ones(1,3));
[t1,x1] = ode45(@(t1,x1)lorenz(t1,x1,Beta1),tspan,x0,options1);
plot3(x1(:,1),x1(:,2),x1(:,3),'b','lineWidth',1.5);
set(gca,'color','w','xcolor','b','ycolor','b','zcolor','b')
set(gcf,'color','w') 
grid on
legend('1e-12','1e-6')

figure(10)
subplot(3,1,1)
plot(t,x(:,1),'r',t1,x1(:,1),'b')
title('x(t)') %porportional to the rate of convention in respect to time
legend('1e-12','1e-6')
xlabel('time')
ylabel('y(t)') %porportional to the rate of convention
subplot(3,1,2)
plot(t,x(:,2),'r',t1,x1(:,2),'b')
title('y(t)') %horizontal temperature variation in respect to time
ylabel('HA temp var')
xlabel('time')
subplot(3,1,3)
plot(t,x(:,3),'r',t1,x1(:,3),'b')
title('z(t)') %vertical temperature variation in respect to time
xlabel('time')
ylabel('VA temp var') %vertical temperature variation

figure(11)
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta2),tspan,x0,options);
plot3(x(:,1),x(:,2),x(:,3),'r','lineWidth',1.5);
set(gca,'color','w','xcolor','r','ycolor','r','zcolor','r')
set(gcf,'color','w')
xlabel('porportional to the rate of convention')
ylabel('horizontal temperature variation')
zlabel('vertical temperature variation')
hold on
options1 = odeset('RelTol',1e-6,'AbsTol',1e-6*ones(1,3));
[t1,x1] = ode45(@(t1,x1)lorenz(t1,x1,Beta2),tspan,x0,options1);
plot3(x1(:,1),x1(:,2),x1(:,3),'b','lineWidth',1.5);
set(gca,'color','w','xcolor','b','ycolor','b','zcolor','b')
set(gcf,'color','w') 
grid on
legend('1e-12','1e-6')

figure(12)
subplot(3,1,1)
plot(t,x(:,1),'r',t1,x1(:,1),'b')
title('x(t)') %porportional to the rate of convention in respect to time
legend('1e-12','1e-6')
xlabel('time')
ylabel('y(t)') %porportional to the rate of convention
subplot(3,1,2)
plot(t,x(:,2),'r',t1,x1(:,2),'b')
title('y(t)') %horizontal temperature variation in respect to time
ylabel('HA temp var')
xlabel('time')
subplot(3,1,3)
plot(t,x(:,3),'r',t1,x1(:,3),'b')
title('z(t)') %vertical temperature variation in respect to time
xlabel('time')
ylabel('VA temp var') %vertical temperature variation

figure(13)
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta3),tspan,x0,options);
plot3(x(:,1),x(:,2),x(:,3),'r','lineWidth',1.5);
set(gca,'color','w','xcolor','r','ycolor','r','zcolor','r')
set(gcf,'color','w')
xlabel('porportional to the rate of convention')
ylabel('horizontal temperature variation')
zlabel('vertical temperature variation')

hold on
options1 = odeset('RelTol',1e-6,'AbsTol',1e-6*ones(1,3));
[t1,x1] = ode45(@(t1,x1)lorenz(t1,x1,Beta3),tspan,x0,options1);
plot3(x1(:,1),x1(:,2),x1(:,3),'b','lineWidth',1.5);
set(gca,'color','w','xcolor','b','ycolor','b','zcolor','b')
set(gcf,'color','w') 
grid on
legend('1e-12','1e-6')

figure(14)
subplot(3,1,1)
plot(t,x(:,1),'r',t1,x1(:,1),'b')
title('x(t)') %porportional to the rate of convention in respect to time
legend('1e-12','1e-6')
xlabel('time')
ylabel('y(t)') %porportional to the rate of convention
subplot(3,1,2)
plot(t,x(:,2),'r',t1,x1(:,2),'b')
title('y(t)') %horizontal temperature variation in respect to time
ylabel('HA temp var')
xlabel('time')
subplot(3,1,3)
plot(t,x(:,3),'r',t1,x1(:,3),'b')
title('z(t)') %vertical temperature variation in respect to time
xlabel('time')
ylabel('VA temp var') %vertical temperature variation


%% prob 4 
Beta = [10;28;8/3];
t = 0:01:20;
xO = [10;10;10];
tf =20;

options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

% options1 = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
% [t,x] = ode45(@(t,x)lorenz(t,x,Beta),tspan,x0,options);

dt = 0.01;
tf = 20;
out_rk4 = rk4_test(@lorenz, xO,dt,tf,Beta);

figure(1)
plot3(x(:,1),x(:,2),x(:,3),'r', out_rk4(1,:),out_rk4(2,:),out_rk4(3,:),'b');
title('rk4 v ode')
xlabel('x')
ylabel('y')

figure(2)
subplot(3,1,1)
plot(t,x(:,1),'r',tf,out_rk4(1,:),'b')
xlabel('t')
ylabel('x')

subplot(3,1,2)
plot(t,x(:,2),'r',tf,out_rk4(2,:),'b')
xlabel('t')
ylabel('y')

subplot(3,1,3)
plot(t,x(:,3),'r',tf,out_rk4(3,:),'b')
xlabel('t')
ylabel('z')

sgtitle('rk4 v ode-2d')
legend('ode','rk4')

subplot(3,1,1)
plot(t,x(:,1),'r',tf,out_rk4(1,:),'b')
xlabel('t')
ylabel('x')

























