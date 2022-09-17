function output = mult(input1, input2)
% This function produces the multiplation of 2 16 bit-numbers in GF(2^16 +1)

temp = uint32(input1) * uint32(input2);
output =uint16( mod(temp , 65537));