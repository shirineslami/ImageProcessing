function f_out = f( R , k )

R_expan = ( f_bit_expantion_gen(R) );
% R_expan = expansion of R 
%"32,5,4,9,8,13,12,17,16,21,20,25,24,29,28,1" are repeated

temp = bitxor ( R_expan , k);


s_out = s(temp);
sout_vec = [s_out{1}, s_out{2}, s_out{3},s_out{4}, s_out{5},...
            s_out{6}, s_out{7}, s_out{8} ];
        
f_out = sout_vec(f_permution_box());
