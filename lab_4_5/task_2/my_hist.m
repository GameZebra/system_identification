s = tf('s');
W = (0.62/1.2)*2/((6.8*0.62*s+1)*(3.3*2.4*s+1));
T0 = 1;
Wd = c2d(W, T0);

% run the simulink first
time = out.tout;
y = out.simout.signals.values(:,1);
u = out.simout.signals.values(:,2);
figure(1), hist(u)
figure(2), histfit(y)