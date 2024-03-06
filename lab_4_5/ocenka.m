clear
fid =fopen('data1.txt','r');
data = fscanf(fid, '%f', [3 inf]); fclose(fid);

t = data(1, :)';
u = data(2, :)';
y = data(3, :)';
lag = 30;

Rx = xcorr(u, u, lag, 'unbiased');
Rxy = xcorr(y,u, lag, 'unbiased');

figure(1);
plot(-lag:lag, Rx, 'b'), hold on, grid on;
plot(-lag:lag, Rxy, 'r');

[w, h] = wiener_hopf(Rx, Rxy, lag);
figure(2);
plot(h, 'b'), hold on;

figure(3);
plot(0:lag, w, 'b'), hold on;


t100 = data(1, 1:101);
u100 = data(2, 1:101)';
y100 = data(3, 1:101)';

Rx100 = xcorr(u100, u100, lag, 'unbiased');
Rxy100 = xcorr(y100,u100, lag, 'unbiased');

figure(1);
plot(-lag:lag, Rx100, 'b--'), hold on, grid on;
plot(-lag:lag, Rxy100, 'r--');

[w100, h100] = wiener_hopf(Rx100, Rxy100, lag);
figure(2);
plot(0:lag, h100, 'r'), grid on;

figure(3);
plot(0:lag, w100, 'r'), grid on;


