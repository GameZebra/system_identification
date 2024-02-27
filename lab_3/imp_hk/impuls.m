T = 50;
Timp = T / 4;
takts = int32(Timp*10);
u(1:takts) = 5;
u(takts:500) = 0; 

fid = fopen('vhoden_signal.txt', 'w');
fprintf(fid, '%f\n', u);
fclose(fid);
