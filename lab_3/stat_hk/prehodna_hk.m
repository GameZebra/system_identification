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

subplot(212), hold on, grid on;
exp_sum = [];
exp_average = [];
for i = 1:length(exp1(1,:))
    exp_sum(i) = exp1(3,i) + exp2(3,i) + exp3(3,i) + exp4(3,i) + exp5(3,i) + exp6(3,i);
    exp_average(i) = exp_sum(i) ./ 6; 
end
plot(exp1(1,:), exp_average)

fid = fopen('h_etalon.txt', 'w');
fprintf(fid, '%f\n', exp_average);
fclose(fid);




