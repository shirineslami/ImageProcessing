function k = RC6_init()

% Primary key has 128 bits.
key_hex = { '0102' , '0304' , '0506' , '0708'};
key = hex2dec(key_hex);

k = key_expansion (key );