f1 = fopen("c1.txt", 'r');
data0 = fscanf(f1, '%f', [3 inf]);
fclose(f1);

f2 = fopen("c2.txt", 'r');
data1 = fscanf(f2, '%f', [3 inf]);
fclose(f2);

f3 = fopen("c3.txt", 'r');
data2 = fscanf(f3, '%f', [3 inf]);
fclose(f3);

mean(data0(2,:))
var(data0(2,:))./std(data0(2,:))
% kak se namira dispersiqta?


lag=30;
Rxy = xcorr(data0(2,:),data0(3,:), lag, 'unbiased');

