clear

% task_1
p = tf('p');
W1 = (0.62/1.2)/(6.8*0.62*p+1);
W2 = 2/(3.3*2.4*p+1);
W = W1*W2
T0 = 1;
Wd = c2d(W, T0)


A = Wd.den{1}
B = Wd.num{1}

matrix = idpoly(A,B,T0);

% task_2
figure(1)
zpplot(matrix)          %iopzplot()
figure(2)
nyquist(matrix)
figure(3)
bode(matrix)

% task_3
ivu = 22;
randn('seed', ivu);
u0 = randn(500,1);
u = sign(u0);

ive = 30;
randn('seed', ive);
e = randn(500,1);
cv=sum(B)/5;     % 20% noise to signal
ev=cv*e;

y0 = sim(matrix, u);
y1 = sim(matrix, [u, ev]);

cn = 0.2*std(y0)/std(e);
en = cn*e;
y2 = y0 + en;

data0 = iddata(y0, u, T0);
data1 = iddata(y1, u, T0);
data2 = iddata(y2, u, T0);


% task 4
na = length(A)-1;
nk = 1;
nb = length(B)-nk;
th0 = arx(data0, [na, nb, nk]);
th1 = arx(data1, [na, nb, nk]);
th2 = arx(data2, [na, nb, nk]);

present(matrix)
present(th0)
present(th1)
present(th2)
%compare(data2,th2)

% task_5
figure(4)
iopzplot(th0, 'sd', 3)
figure(5)
iopzplot(th1, 'sd', 3)
figure(6)
iopzplot(th2, 'sd', 3)


figure(7)
nyquist(th0, 'sd', 3)
figure(8)
nyquist(th1, 'sd', 3)
figure(9)
nyquist(th2, 'sd', 3)

figure(10)
bode(th0, 'sd', 3)
figure(11)
bode(th1, 'sd', 3)
figure(12)
bode(th2, 'sd', 3)

figure(13)
subplot(311)
step(th0, 'sd', 3)
subplot(312)
step(th1, 'sd', 3)
subplot(313)
step(th2, 'sd', 3)


