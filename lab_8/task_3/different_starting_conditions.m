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

data2 = iddata(y2, u, T0);


the=zeros(4,1);phi=zeros(4,1);psi=zeros(4,1);
P=10^10*eye(4);
NN=[2 2 1];lambda=1;thm=[];Pm=[];
for k = 1 : length (data2.y)
    [the,yh,P,phi] = rarx([data2.y(k) data2.u(k)], NN, 'ff', lambda, the', P, phi);
    thm = [thm ; the]; Pm = [Pm , trace(P)] ;
end
thitaARX=thm;PmARX=Pm;

the=zeros(6,1);phi=zeros(6,1);psi=zeros(6,1);
P=10^10*eye(6);
NN=[2 2 2 1];lambda=1;thm=[];Pm=[];
for k = 1 : length (data2.y)
    [the,yh,P,phi,psi] = rarmax([data2.y(k) data2.u(k)], NN, 'ff', lambda, the', P, phi,psi);
    thm = [thm ; the] ; Pm = [Pm , trace(P)] ;
end
thitaARMAX=thm;PmARMAX=Pm;

the=zeros(4,1);phi=zeros(4,1);psi=zeros(4,1);
P=10^10*eye(4);
NN=[2 2 1];lambda=1;
thm=[];Pm=[];
for k = 1 : length (data2.y)
    [the,yh,P,phi,psi] = roe([data2.y(k) data2.u(k)], NN, 'ff', lambda, the', P, phi,psi);
    thm = [thm ; the]; Pm = [Pm , trace(P)] ;
end
thitaOE=thm;PmOE=Pm;

figure(21)
plot(1:500,thitaARX(:,1),'k',1:500,thitaARMAX(:,1),'r',1:500, ...
    thitaOE(:,3),'b',1:500,ones(500,1)*matrix.a(2),'g','LineWidth',2),grid
title('Оценки на параметъра a_1'),xlabel('Време'),
ylabel('Оценки на параметри'),legend('ARX','ARMAX','OE','точна стойност')
figure(22)
plot(1:500,thitaARX(:,2),'k',1:500,thitaARMAX(:,2),'r',1:500, ...
    thitaOE(:,4),'b',1:500,ones(500,1)*matrix.a(3),'g','LineWidth',2),grid
title('Оценки на параметъра a_2'),xlabel('Време'),
ylabel('Оценки на параметри'),legend('ARX','ARMAX','OE','точна стойност')
figure(23)
plot(1:500,thitaARX(:,3),'k',1:500,thitaARMAX(:,3),'r',1:500, ...
    thitaOE(:,1),'b',1:500,ones(500,1)*matrix.b(2),'g','LineWidth',2),grid
title('Оценки на параметъра b_1'),xlabel('Време'),ylabel('Оценки на параметри'),legend('ARX','ARMAX','OE','точна стойност')

figure(24)
plot(1:500,thitaARX(:,4),'k',1:500,thitaARMAX(:,4),'r',1:500, ...
    thitaOE(:,2),'b',1:500,ones(500,1)*matrix.b(3),'g','LineWidth',2),grid
title('Оценки на параметъра b_2'),xlabel('Време'),
ylabel('Оценки на параметри'),legend('ARX','ARMAX','OE','точна стойност')


the=zeros(4,1);phi=zeros(4,1);psi=zeros(4,1);
P=10^2*eye(4);
NN=[2 2 1];lambda=1;thm=[];Pm=[];
for k = 1 : length (data2.y)
    [the,yh,P,phi] = rarx([data2.y(k) data2.u(k)], NN, 'ff', lambda, the', P, phi);
    thm = [thm ; the]; Pm = [Pm , trace(P)] ;
end
thitaARX=thm;PmARX=Pm;

the=zeros(6,1);phi=zeros(6,1);psi=zeros(6,1);
P=10^2*eye(6);
NN=[2 2 2 1];lambda=1;thm=[];Pm=[];
for k = 1 : length (data2.y)
    [the,yh,P,phi,psi] = rarmax([data2.y(k) data2.u(k)], NN, 'ff', lambda, the', P, phi,psi);
    thm = [thm ; the] ; Pm = [Pm , trace(P)] ;
end
thitaARMAX=thm;PmARMAX=Pm;

the=zeros(4,1);phi=zeros(4,1);psi=zeros(4,1);
P=10^2*eye(4);
NN=[2 2 1];lambda=1;
thm=[];Pm=[];
for k = 1 : length (data2.y)
    [the,yh,P,phi,psi] = roe([data2.y(k) data2.u(k)], NN, 'ff', lambda, the', P, phi,psi);
    thm = [thm ; the]; Pm = [Pm , trace(P)] ;
end
thitaOE=thm;PmOE=Pm;

figure(31)
plot(1:500,thitaARX(:,1),'k',1:500,thitaARMAX(:,1),'r',1:500, ...
    thitaOE(:,3),'b',1:500,ones(500,1)*matrix.a(2),'g','LineWidth',2),grid
title('Оценки на параметъра a_1'),xlabel('Време'),
ylabel('Оценки на параметри'),legend('ARX','ARMAX','OE','точна стойност')
figure(32)
plot(1:500,thitaARX(:,2),'k',1:500,thitaARMAX(:,2),'r',1:500, ...
    thitaOE(:,4),'b',1:500,ones(500,1)*matrix.a(3),'g','LineWidth',2),grid
title('Оценки на параметъра a_2'),xlabel('Време'),
ylabel('Оценки на параметри'),legend('ARX','ARMAX','OE','точна стойност')
figure(33)
plot(1:500,thitaARX(:,3),'k',1:500,thitaARMAX(:,3),'r',1:500, ...
    thitaOE(:,1),'b',1:500,ones(500,1)*matrix.b(2),'g','LineWidth',2),grid
title('Оценки на параметъра b_1'),xlabel('Време'),ylabel('Оценки на параметри'),legend('ARX','ARMAX','OE','точна стойност')

figure(34)
plot(1:500,thitaARX(:,4),'k',1:500,thitaARMAX(:,4),'r',1:500, ...
    thitaOE(:,2),'b',1:500,ones(500,1)*matrix.b(3),'g','LineWidth',2),grid
title('Оценки на параметъра b_2'),xlabel('Време'),
ylabel('Оценки на параметри'),legend('ARX','ARMAX','OE','точна стойност')


the=zeros(4,1);phi=zeros(4,1);psi=zeros(4,1);
P=10*eye(4);
NN=[2 2 1];lambda=1;thm=[];Pm=[];
for k = 1 : length (data2.y)
    [the,yh,P,phi] = rarx([data2.y(k) data2.u(k)], NN, 'ff', lambda, the', P, phi);
    thm = [thm ; the]; Pm = [Pm , trace(P)] ;
end
thitaARX=thm;PmARX=Pm;

the=zeros(6,1);phi=zeros(6,1);psi=zeros(6,1);
P=10*eye(6);
NN=[2 2 2 1];lambda=1;thm=[];Pm=[];
for k = 1 : length (data2.y)
    [the,yh,P,phi,psi] = rarmax([data2.y(k) data2.u(k)], NN, 'ff', lambda, the', P, phi,psi);
    thm = [thm ; the] ; Pm = [Pm , trace(P)] ;
end
thitaARMAX=thm;PmARMAX=Pm;

the=zeros(4,1);phi=zeros(4,1);psi=zeros(4,1);
P=10*eye(4);
NN=[2 2 1];lambda=1;
thm=[];Pm=[];
for k = 1 : length (data2.y)
    [the,yh,P,phi,psi] = roe([data2.y(k) data2.u(k)], NN, 'ff', lambda, the', P, phi,psi);
    thm = [thm ; the]; Pm = [Pm , trace(P)] ;
end
thitaOE=thm;PmOE=Pm;

figure(41)
plot(1:500,thitaARX(:,1),'k',1:500,thitaARMAX(:,1),'r',1:500, ...
    thitaOE(:,3),'b',1:500,ones(500,1)*matrix.a(2),'g','LineWidth',2),grid
title('Оценки на параметъра a_1'),xlabel('Време'),
ylabel('Оценки на параметри'),legend('ARX','ARMAX','OE','точна стойност')
figure(42)
plot(1:500,thitaARX(:,2),'k',1:500,thitaARMAX(:,2),'r',1:500, ...
    thitaOE(:,4),'b',1:500,ones(500,1)*matrix.a(3),'g','LineWidth',2),grid
title('Оценки на параметъра a_2'),xlabel('Време'),
ylabel('Оценки на параметри'),legend('ARX','ARMAX','OE','точна стойност')
figure(43)
plot(1:500,thitaARX(:,3),'k',1:500,thitaARMAX(:,3),'r',1:500, ...
    thitaOE(:,1),'b',1:500,ones(500,1)*matrix.b(2),'g','LineWidth',2),grid
title('Оценки на параметъра b_1'),xlabel('Време'),ylabel('Оценки на параметри'),
legend('ARX','ARMAX','OE','точна стойност')
figure(44)
plot(1:500,thitaARX(:,4),'k',1:500,thitaARMAX(:,4),'r',1:500, ...
    thitaOE(:,2),'b',1:500,ones(500,1)*matrix.b(3),'g','LineWidth',2),grid
title('Оценки на параметъра b_2'),xlabel('Време'),
ylabel('Оценки на параметри'),legend('ARX','ARMAX','OE','точна стойност')
