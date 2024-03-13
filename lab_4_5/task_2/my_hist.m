s = tf('s');
W = (0.62/1.2)*2/((6.8*0.62*s+1)*(3.3*2.4*s+1));
T0 = 1;
Wd = c2d(W, T0);
const = [0, 0.1, 0.25];
names = ['c1.txt'; 'c2.txt';'c3.txt'];

for i = 1:length(const)
    c = const(i);
    sim("random_signal.slx");
    time = ans.tout;
    y = ans.simout.signals.values(:,1);
    u = ans.simout.signals.values(:,2);
    fid = fopen(names(i,:), 'w');
    for j = 1:500
        fprintf(fid, '%f\t%f\t%f\n', time(j), y(j), u(j));
    end
    fclose(fid);
    figure(1);
    subplot(3,2,2*i-1), histfit(u);
    subplot(3,2,2*i), histfit(y);
end



