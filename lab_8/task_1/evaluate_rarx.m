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


% forgetting factor 1
thita0=rarx(data0,[2 2 1],'ff',1);
thita1=rarx(data1,[2 2 1],'ff',1);
thita2=rarx(data2,[2 2 1],'ff',1);
figure(1)
plot(1:500,thita0(:,1),'k',1:500,thita1(:,1),'r',1:500,thita2(:,1),'b',1:500,ones(500,1)*matrix.a(2),'g','LineWidth',2),grid
title('Оценки на параметъра a_1'),xlabel('Време'),ylabel('Оценки на параметри')
,legend('Без шум','С цветен шум','С бял шум','Точна стойност')

figure(2)
plot(1:500,thita0(:,2),'k',1:500,thita1(:,2),'r',1:500,thita2(:,2),'b',1:500,ones(500,1)*matrix.a(3),'g','LineWidth',2),grid
title('Оценки на параметъра a_2'),xlabel('Време'),ylabel('Оценки на параметри')
,legend('Без шум','С цветен шум','С бял шум','Точна стойност')

figure(3)
plot(1:500,thita0(:,3),'k',1:500,thita1(:,3),'r',1:500,thita2(:,3),'b',1:500,ones(500,1)*matrix.b(2),'g','LineWidth',2),grid
title('Оценки на параметъра b_1'),xlabel('Време'),ylabel('Оценки на параметри')
,legend('Без шум','С цветен шум','С бял шум','Точна стойност')

figure(4)
plot(1:500,thita0(:,4),'k',1:500,thita1(:,4),'r',1:500,thita2(:,4),'b',1:500,ones(500,1)*matrix.b(3),'g','LineWidth',2),grid
title('Оценки на параметъра b_2'),xlabel('Време'),ylabel('Оценки на параметри')
,legend('Без шум','С цветен шум','С бял шум','Точна стойност')


% forgetting factor 0.98
thita0=rarx(data0,[2 2 1],'ff',0.98);
thita1=rarx(data1,[2 2 1],'ff',0.98);
thita2=rarx(data2,[2 2 1],'ff',0.98);
figure(11)
plot(1:500,thita0(:,1),'k',1:500,thita1(:,1),'r',1:500,thita2(:,1),'b',1:500,ones(500,1)*matrix.a(2),'g','LineWidth',2),grid
title('Оценки на параметъра a_1'),xlabel('Време'),ylabel('Оценки на параметри')
,legend('Без шум','С цветен шум','С бял шум','Точна стойност')

figure(12)
plot(1:500,thita0(:,2),'k',1:500,thita1(:,2),'r',1:500,thita2(:,2),'b',1:500,ones(500,1)*matrix.a(3),'g','LineWidth',2),grid
title('Оценки на параметъра a_2'),xlabel('Време'),ylabel('Оценки на параметри')
,legend('Без шум','С цветен шум','С бял шум','Точна стойност')

figure(13)
plot(1:500,thita0(:,3),'k',1:500,thita1(:,3),'r',1:500,thita2(:,3),'b',1:500,ones(500,1)*matrix.b(2),'g','LineWidth',2),grid
title('Оценки на параметъра b_1'),xlabel('Време'),ylabel('Оценки на параметри')
,legend('Без шум','С цветен шум','С бял шум','Точна стойност')

figure(14)
plot(1:500,thita0(:,4),'k',1:500,thita1(:,4),'r',1:500,thita2(:,4),'b',1:500,ones(500,1)*matrix.b(3),'g','LineWidth',2),grid
title('Оценки на параметъра b_2'),xlabel('Време'),ylabel('Оценки на параметри')
,legend('Без шум','С цветен шум','С бял шум','Точна стойност')

% with bigger forgetting factor:
% has bigger oscilations
% is supposed to be faster


