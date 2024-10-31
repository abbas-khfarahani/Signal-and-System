t = 0:0.01:1;
z1 = sin(2*pi*t);
z2 = cos(2*pi*t);

figure;
subplot(1,2,1);
plot(t, z1, '--b');
xlabel('time');
ylabel('amplitude');
legend('sin');
title('sin');
grid on;
%x0 = [0.5; 0.25];
s = 'sin(2 \pi t)';
text(0.5, 0.25, s);

subplot(1,2,2);
plot(t, z2, 'r');

%y0 = [0.2; -0.8];
s1 = 'cos(2 \pi t)';
text(0.2, -0.8, s1); % add comment at (y0)

title('cos'); % Title
legend('cos'); % add elgend
xlabel('time') % the name of X-axis
ylabel('amplitude') % the name of Y-axis
grid on % Add grid
