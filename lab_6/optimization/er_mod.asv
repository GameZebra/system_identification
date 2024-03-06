function er = er_mod(par);
% par - [k T1 T2]
% more info can be foud on page 56
% this function does not have delay

global k T1 T2 k_vec T1_vec T2_vec;
global orig optima op_st;


op_st = op_st + 1;

k = par(1);
T1 = par(2);
T2 = par(3);

k_vec(op_st)= k;
T1_vec(op_st) = T1;
T2_vec(op_st) = T2;

N = 50;
[t, x, y] = sim('mod_op.slx', N);
yint = interp1(t,y,orig(:,1));
optima = [orig(:,1) yint];
er = yint - orig(:,2);
