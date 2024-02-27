fid = fopen('exp1.txt', 'r')
exp1 = fscanf(fid, '%f', [3 inf]);
fclose(fid)

fid = fopen('exp2.txt', 'r')
exp2 = fscanf(fid, '%f', [3 inf]);
fclose(fid)

fid = fopen('exp3.txt', 'r')
exp3 = fscanf(fid, '%f', [3 inf]);
fclose(fid)

fid = fopen('exp4.txt', 'r')
exp4 = fscanf(fid, '%f', [3 inf]);
fclose(fid)

fid = fopen('exp5.txt', 'r')
exp5 = fscanf(fid, '%f', [3 inf]);
fclose(fid)

fid = fopen('exp6.txt', 'r')
exp6 = fscanf(fid, '%f', [3 inf]);
fclose(fid)

figure(1);
subplot(211), hold on, grid on;
plot(exp1(1,:), exp1(3,:));
plot(exp2(1,:), exp2(3,:));
plot(exp3(1,:), exp3(3,:));
plot(exp4(1,:), exp4(3,:));
plot(exp5(1,:), exp5(3,:));
plot(exp6(1,:), exp6(3,:));

subplot(212);
exp_sum = [];
exp_average = [];
for i = 1:length(exp1(1,:))
    exp_sum(i) = exp1(3,i) + exp2(3,i) + exp3(3,i) + exp4(3,i) + exp5(3,i) + exp6(3,i);
    exp_average(i) = exp_sum(i) ./ 6; 
end
plot(exp1(1,:), exp_average, 'b'), hold on, grid on;

% zad 6
% metod za usrednqvane na stojnosti

h_star = [0];
h = exp1(3,:);
L = 13;
a = 4/ L;
c = 1 - exp(-a);
for i = 2:length(h)
    h_star(i) = h_star(i-1) + c * (h(i) - h_star(i-1));
end

plot(exp1(1,:), h_star, 'r')


fid = fopen('h_star_imp.txt', 'w');
fprintf(fid, '%f\n', h_star);
fclose(fid);

fid = fopen('time.txt', 'w');
fprintf(fid, '%f\n', exp1(1,:));
fclose(fid);

fid = fopen('input.txt', 'w');
fprintf(fid, '%f\n', exp1(2,:));
fclose(fid);


