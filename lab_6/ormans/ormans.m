%clear all
exp1 = load("exp1.txt");
time = exp1(:,1);
h_etalon = load("h_etalon.txt");
h_norm = h_etalon ./max(h_etalon);

plot(time, h_norm), grid on;

t7 = 15.2;
h7 = 0.700578;
t4 = t7/3;
h4 = 0.200206;
lambda2 = 0.12;
lambda=sqrt(lambda2);

T = t7/2.4;
T1 = T*(1+lambda);
T2 = T*(1-lambda);
