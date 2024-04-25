clear all
close all
clc
% pprob 2a
data =readtable('S23-Math150-Worksheet03-Data.csv');
dataMat = table2array(data);

figure(1)
scatter(dataMat(:,1), dataMat(:,2),'m*')
grid on

%% 2b and c
c0 = dataMat(1,2);
% t=0.1
indx01 =find(dataMat(:,1) == 0.1)
xval01 = dataMat(indx01,2); % row second col
k01 = log(xval01/c0)/0.1;

f1 = @(t) c0*exp(k01*t);

figure(2)
scatter(dataMat(:,1), dataMat(:,2),'m*')
hold on
plot(dataMat(:,1),f1(dataMat(:,2)),'rs')
xlabel('time')
ylabel('observations')
title('t vs o')

% t = 0.5
indx05 =find(dataMat(:,1) == 0.5)
xval05 = dataMat(indx05,2); % row second col
k05 = log(xval05/c0)/0.5;

% t = 1
indx1 =find(dataMat(:,1) == 1)
xval1 = dataMat(indx1,2); % row second col
k1 = log(xval1/c0)/1;

% t= 3
indx3 =find(dataMat(:,1) == 3)
xval3 = dataMat(indx3,2); % row second col
k3 = log(xval3/c0)/3;

% here the index are different

figure(3)
plot(k1,xval01)
hold on
plot(k05,xval05)
hold on
xlabel('time')
ylabel('observations')
title('t vs o')

% prob 3
alpha01 = 0;
f201 = @(t)(5*c0*exp(alpha01*t))/((5-c0)*(1+(c0/5-c0))*exp(alpha01*t));

alpha05 = 0.1534;
f205 = @(t)(5*c0*exp(alpha05*t))/((5-c0)*(1+(c0/5-c0))*exp(alpha05*t));

alpha1 = 0.1471;
f21 = @(t)(5*c0*exp(alpha1*t))/((5-c0)*(1+(c0/5-c0))*exp(alpha1*t));

alpha3 = 0.1035;
f23 = @(t)(5*c0*exp(alpha3*t))/((5-c0)*(1+(c0/5-c0))*exp(alpha3*t));

%plot(t, f(t),'r-o', t, f2(t), 'b-s',...
hold on
scatter(dataMat(:,1), dataMat(:,2))

plot(dataMat(:,1),f201(dataMat(:,1)),'r-o');
hold on
plot(dataMat(:,1),f205(dataMat(:,1)),'r-o');
hold on
plot(dataMat(:,1),f21(dataMat(:,1)),'r-o');
hold on
plot(dataMat(:,1),f23(dataMat(:,1)),'r-o');
hold on
xlabel("time");
ylabel("observations");
title("t vs o");



