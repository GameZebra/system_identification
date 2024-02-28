u = (sign(randn(500,1))+1) * 2.5;

fid = fopen('input_random_signal.txt', 'w');
fprintf(fid, '%f\n', u);
fclose(fid);
