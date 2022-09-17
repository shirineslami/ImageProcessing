function ciphertext = cipher (plaintext , K , m)
%CIPHER  Convert 16 bytes of plaintext to 16 bytes of ciphertext.
%
%   CIPHERTEXT = CIPHER (PLAINTEXT) 
%   converts PLAINTEXT to CIPHERTEXT,
%   using the expanded cipher key K.

% In this part the input block devides to A,B,C,D words.
% Every words has 4 bytes.
state = dec2bin(plaintext,8);
t = state';
temp = t(1);
for i = 2 : 32
    temp = [temp , t(i)];
end
A = bin2dec(temp);

temp = t(33);
for i = 34 : 64
    temp = [temp , t(i)];
end
B = bin2dec(temp);

temp = t(65);
for i = 66 : 96
    temp = [temp , t(i)];
end
C = bin2dec(temp);

temp = t(97);
for i = 98 : 128
    temp = [temp , t(i)];
end
D = bin2dec(temp);

if m  ==1
    [A , B , C , D] = procedure1(A, B , C ,D , K);
else
    [A , B , C , D] = procedure2(A, B , C ,D , K);
end

s = dec2binvec(A , 32);
s1 = [s(1) , s(2), s(3), s(4), s(5), s(6), s(7), s(8)];
s2 = [s(9) , s(10), s(11), s(12), s(13), s(14), s(15), s(16)];
s3 = [s(17) , s(18), s(19), s(20), s(21), s(22), s(23), s(24)];
s4 = [s(25) , s(26), s(27), s(28), s(29), s(30), s(31), s(32)];
ciphertext(4) = binvec2dec(s1);
ciphertext(3) = binvec2dec(s2);
ciphertext(2) = binvec2dec(s3);
ciphertext(1) = binvec2dec(s4);

s = dec2binvec(B , 32);
s1 = [s(1) , s(2), s(3), s(4), s(5), s(6), s(7), s(8)];
s2 = [s(9) , s(10), s(11), s(12), s(13), s(14), s(15), s(16)];
s3 = [s(17) , s(18), s(19), s(20), s(21), s(22), s(23), s(24)];
s4 = [s(25) , s(26), s(27), s(28), s(29), s(30), s(31), s(32)];
ciphertext(8) = binvec2dec(s1);
ciphertext(7) = binvec2dec(s2);
ciphertext(6) = binvec2dec(s3);
ciphertext(5) = binvec2dec(s4);

s = dec2binvec(C , 32);
s1 = [s(1) , s(2), s(3), s(4), s(5), s(6), s(7), s(8)];
s2 = [s(9) , s(10), s(11), s(12), s(13), s(14), s(15), s(16)];
s3 = [s(17) , s(18), s(19), s(20), s(21), s(22), s(23), s(24)];
s4 = [s(25) , s(26), s(27), s(28), s(29), s(30), s(31), s(32)];
ciphertext(12) = binvec2dec(s1);
ciphertext(11) = binvec2dec(s2);
ciphertext(10) = binvec2dec(s3);
ciphertext( 9) = binvec2dec(s4);


s = dec2binvec(D , 32);
s1 = [s(1) , s(2), s(3), s(4), s(5), s(6), s(7), s(8)];
s2 = [s(9) , s(10), s(11), s(12), s(13), s(14), s(15), s(16)];
s3 = [s(17) , s(18), s(19), s(20), s(21), s(22), s(23), s(24)];
s4 = [s(25) , s(26), s(27), s(28), s(29), s(30), s(31), s(32)];
ciphertext(16) = binvec2dec(s1);
ciphertext(15) = binvec2dec(s2);
ciphertext(14) = binvec2dec(s3);
ciphertext(13) = binvec2dec(s4);