u = (sign(randn(250,1))+1) * 2.5;

fid = fopen('input_random_signal_250.txt', 'w');
fprintf(fid, '%f\n', u);
fclose(fid);
