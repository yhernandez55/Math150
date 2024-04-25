table = readtable('S23-Math150-HW01-Data.csv');

x = table2array(table(:,2)); % predictions x
y = table2array(table(:,3)); % observations y
t = table2array(table(:,1)); % time

plot(t,x,'-b')
xlabel('time')
ylabel('predictions and observations')
title('predictions vs observations')
grid on
hold on
plot(t,y,'-r')
legend('predictions','observation');
hold off

% Based on the graph we can say that predictions have an exponential decay
% while observations seem to be more steedy.

abs_error = abs(x - y);
rel_error = abs_error ./x;

figure;
subplot(3,1,1); % p-1 norm
plot(t, abs_error, 'r', 'LineWidth', 1.5);
title('Absolute Error (p=1)');
xlabel('Time (t)');
ylabel('Absolute Error');

subplot(3,1,2); % p-2 norm
plot(t, abs_error.^2, 'r', 'LineWidth', 1.5);
title('Absolute Error (p=2)');
xlabel('Time (t)');
ylabel('Absolute Error^2');

subplot(3,1,3); % inf norm
plot(t, abs_error, 'r', 'LineWidth', 1.5);
title('Absolute Error (p=\infty)');
xlabel('Time (t)');
ylabel('Absolute Error');
ylim([0 max(abs_error)]);

figure;
subplot(3,1,1);
plot(t, rel_error, 'r', 'LineWidth', 1.5);
title('Relative Error (p=1)');
xlabel('Time (t)');
ylabel('Relative Error');

subplot(3,1,2);
plot(t, rel_error.^2, 'r', 'LineWidth', 1.5);
title('Relative Error (p=2)');
xlabel('Time (t)');
ylabel('Relative Error^2');

subplot(3,1,3);
plot(t, rel_error, 'r', 'LineWidth', 1.5);
title('Relative Error (p=\infty)');
xlabel('Time (t)');
ylabel('Relative Error');
ylim([0 max(rel_error)]);

% The plots that are being presented show the accuracy of predictions
% compared to the observations. As time increase the absolute error gets
% close to zero for all p-norms, while the relative error is unstable for
% all p norms.









