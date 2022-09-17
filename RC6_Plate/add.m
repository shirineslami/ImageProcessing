function output = add(input1, input2)
% This function produces the sum of 2 32_bit-numbers in GF(2^32)
% that means skip the carry of the sum

temp = fi(input1,0,32,0) + fi(input2,0,32,0);
output = double(bitsliceget(temp , 32 , 1));