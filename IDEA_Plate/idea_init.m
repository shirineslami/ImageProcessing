function k = idea_init()
% Primary key has 128 bits.
key_hex = { '01' , '02' , '03' , '04' , '05' , '06' , '07' , '08'};
key = hex2dec(key_hex);

k = key_expansion (key );