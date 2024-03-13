% task_1
p = tf('p')
W1 = (0.62/1.2)/(6.8*0.62*p+1)
W2 = 2/(3.3*2.4*p+1)
W = W1*W2
T0 = 1
Wd = c2d(W, T0)


A = Wd.den{1}
B = Wd.num{1}

matrix = idpoly(A,B,T0)

% task_2
figure(1)
zpplot(matrix)          %iopzplot()
figure(2)
nyquist(matrix)
figure(3)
bode(matrix)


