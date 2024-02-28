t = out.simout.time;
u = out.simout.signals.values(:,2);
y = out.simout.signals.values(:,1);

s = tf('s');
W = (0.62/1.2)*2/((6.8*0.62*s+1)*(3.3*2.4*s+1));
T0 = 1;
Wd = c2d(W, T0);

% in simulink
% Wd.num{1}
% Wd.den{1}
