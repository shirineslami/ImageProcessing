function output = f_bit_expantion_gen(input)
% In this function VECTOR with 32 bytes expanes to 48 bytes with
% reapetation of some it's bytes.

mat = [32 ,4 ,8 ,12 ,16 ,20 ,24 ,28 ,1 ,5 ,9 ,13 ,17 ,21 ,25 ,29,...
       2 ,6 ,10 ,14 ,18 ,22 ,26 ,30 ,3 ,7 ,11 ,15 ,19 ,23 ,27 ,31,...
       4 ,8 ,12 ,16 ,20 ,24 ,28 ,32 ,5 ,9 ,13 ,17 ,21 ,25 ,29 ,1];
       
output = input(mat);
%VECTOR permutions according to EXP_MAT.