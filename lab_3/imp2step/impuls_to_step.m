fid = fopen('time.txt', 'r');
time = fscanf(fid, '%f', [1, inf]);
fclose(fid);

fid = fopen('h_star_imp.txt', 'r');
h_star = fscanf(fid, '%f', [1, inf]);
fclose(fid);

fid = fopen('input.txt', 'r');
input = fscanf(fid, '%f', [1, inf]);
fclose(fid);


plot(time, h_star, 'b'), hold on, grid on;

step_respons = [];
flag = 0;
input_old = input(1);
imp_takt = 0;
for i = 1: length(time)
    if flag == 0
        if input_old ~= input(i+1)
            flag = 1;
            imp_takt = i;
        end
        step_respons(i) = h_star(i);
    else
        step_respons(i) = h_star(i) + step_respons(i-imp_takt);
    end
end

plot(time, step_respons, 'r--'), hold on, grid on;
xlabel("time, s");
ylabel("Voltage");
title("impuls to step graph");
