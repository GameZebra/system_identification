% first run optimization and ormans

s = tf('s');
k = h_etalon(500) / 5;
w_optimization = par(1)/(par(2)*s+1) * 1/(par(3)*s+1);
w_ormans = k/((T1*s+1)*(T2*s+1));

figure(1), hold on, grid on;
step(5*w_ormans);
step(5*w_optimization);
plot(time, h_etalon, 'g--'),  grid on;

