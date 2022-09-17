function output = mult(input1, input2 , w)
% This function produces the multiplation of 2 32_bit-numbers in GF(2^32 +1)
  
temp = fi(input1,0,32,0) * fi(input2,0,32,0);
output =double(bitsliceget(temp  , w , 1));