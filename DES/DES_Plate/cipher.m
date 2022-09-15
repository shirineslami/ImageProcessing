function ciphertext = cipher (plaintext , k)
%CIPHER  Convert 8 bytes of plaintext to 8 bytes of ciphertext.
%
%   CIPHERTEXT = CIPHER (PLAINTEXT) 
%   converts PLAINTEXT to CIPHERTEXT,
%   using the expanded cipher key K.

temp = bit_slice(plaintext);
ip_box = ip_box_gen();
temp = temp(ip_box);
% This is the first step of Cipher that is implementation of 
% primary permusion on input.

R(1) = {half(temp', 33 , 64)};
L(1) = {half(temp', 1 , 32)};
% This is the 2nd step of Cipher.

for i = 2 : 17
    L(i) = R(i-1);
    Ri = R{i-1};
    Ki = k{i-1};
    
    R(i) = {bitxor(  L{i-1},  f(Ri , Ki)  )};
end
% The process operations in 16 rounds.

L = R(17);
R = R(16);
% Swap of 2 halfs.
state = binds(R{1}, L{1} , 64);

inv_ip_box = ip_box_inversion(ip_box');
% The last step means exactley Reverse  of first step.

temp = state(inv_ip_box);
ciphertext = compact(temp , 64);