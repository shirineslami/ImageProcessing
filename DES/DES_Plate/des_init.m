function k = des_init()
% Result of this function is 16_k each 6*8
key_hex = { '5b' , '5a' , '57' , '67' , '6a' , '56' , '67' , '6e'};
key_dec = hex2dec(key_hex);

key = bit_slice(key_dec);
k = key_expansion (key );