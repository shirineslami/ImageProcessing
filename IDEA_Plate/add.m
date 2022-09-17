function output = add(input1, input2)
% This function produces the sum of 2 16_bit-numbers in GF(2^16)
% that means skip the carry of the sum

temp = uint32(input1) + uint32(input2);
state = fi(temp , 0 , 17 , 0);

output = uint16(bitsliceget(state , 16 , 1));