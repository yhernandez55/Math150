clear all
close all
clc
% Problem 1
T=[0 0 1/2;
    1 0 1/2;
    0 1 0];
L=T^50;
disp(L)
SUM=(1/2)*L(1,1)+1*L(2,1)+3*L(3,1);
v1=(1/2)*L(1,1)/SUM
v2=1*L(2,1)/SUM
v3=3*L(3,1)/SUM


%% Part B
x0=1;
arange=[5,8,13,20];
n=20;
figure
for i=1:length(arange)
    a=arange(i);
    iterates=RM(x0,a,n);
    subplot(2,2,i);
    plot(0:n,iterates,'r-');
    xlabel('n');
    ylabel('x(n)');
    title(sprintf('a=%d',a));
end
%% Part C
% In the first graph with the a value being set to 5, we can see that x(n)
% converges after fluctuating in the beginning when n<8. In the graph when
% a=8, the graph oscillates between x(n)=3 and x(n)=1 but then starts
% oscillating consistently with smaller amplitudes. In the graph where
% a=13, the amplitudes of the oscillations alternates with each iterations,
% suggesting that it follows the same behavior in the long term. Lastly in
% the a=20 graph, the lines do not follow a pattern with a little
% disturbance when n=10. This may suggest that when the Ricker model as an
% a value that is increasing, the stability of the graph weakens and the
% trends become unpredictable.
%% Part D
%function [iterates] = RModify(x0,a)
%n=600;
%iterates_tot=zeros(1,n+1);
%iterates_tot(1)=x0;
%for i=1:n
    %iterates_tot(i+1)=a*iterates_tot(i)*exp(-iterates_tot(i));
%end
%iterates=iterates_tot(end-99:end);
%end
%% Part E
x0=1;
arange=0:1:20;
figure
for a=arange
    iterates=RModify(x0,a);
    vector_a=a*ones(100,1);
    plot(vector_a,iterates,'.','MarkerSize',5);
    hold on
end
xlabel('a');
ylabel('x(n)');
title('Feigenbaum diagram for Ricker Model (a=0 to a=20)')
hold off
%% Part F
% In our plot, we can see that as the values of a begin to increase, x(n)
% takes on multiple values as the iterates keep bulding onto eachother.
% When a is near its max, x(n) takes on a large amount of numbers,
% indicating that x(n) will continue to increase as a increases.

%% Problem 2
% Part A
function [iterates] = RM(x0,a,n)
iterates=zeros(1,n+1);
iterates(1)=x0;
for i =1:n
    iterates(i+1)=a*iterates(i)*exp(-iterates(i));
end
end