function CipherText = cipher2 (plaintext , K , m)
%CIPHER  Convert 16 bytes of plaintext to 16 bytes of ciphertext.
%
%   CIPHERTEXT = CIPHER (PLAINTEXT) 
%   converts PLAINTEXT to CIPHERTEXT,
%   using the expanded cipher key K.

% In this part the input block devides to A,B,C,D words.
% Every words has 4 bytes.
X1 = bitconcat(fi(plaintext(2 ) ,0,8,0) , fi(plaintext(1) ,0,8,0) );
X2 = bitconcat(fi(plaintext(4 ) ,0,8,0) , fi(plaintext(3) ,0,8,0) );
X3 = bitconcat(fi(plaintext(6 ) ,0,8,0) , fi(plaintext(5) ,0,8,0) );
X4 = bitconcat(fi(plaintext(8 ) ,0,8,0) , fi(plaintext(7) ,0,8,0) );
X5 = bitconcat(fi(plaintext(10) ,0,8,0) , fi(plaintext(9) ,0,8,0) );
X6 = bitconcat(fi(plaintext(12) ,0,8,0) , fi(plaintext(11) ,0,8,0) );
X7 = bitconcat(fi(plaintext(14) ,0,8,0) , fi(plaintext(13) ,0,8,0) );
X8 = bitconcat(fi(plaintext(16) ,0,8,0) , fi(plaintext(15) ,0,8,0) );

A = bitconcat(X2,X1);
B = bitconcat(X4,X3);
C = bitconcat(X6,X5);
D = bitconcat(X8,X7);
clear X1  X2  X3  X4 X5 X6 X7 X8

if m  ==1
    [A , B , C , D] = procedure1(double(A), double(B) , double(C) ,double(D) , double(K));
else
    [A , B , C , D] = procedure2(double(A), double(B) , double(C) ,double(D) , double(K));
end

A=fi(A,0,32,0);
B=fi(B,0,32,0);
C=fi(C,0,32,0);
D=fi(D,0,32,0);

ciphertext(4) = bitsliceget(A , 32 , 25);
ciphertext(3) = bitsliceget(A , 24 , 17);
ciphertext(2) = bitsliceget(A , 16 , 9);
ciphertext(1) = bitsliceget(A , 8 , 1);

ciphertext(8) = bitsliceget(B , 32 , 25);
ciphertext(7) = bitsliceget(B , 24 , 17);
ciphertext(6) = bitsliceget(B , 16 , 9);
ciphertext(5) = bitsliceget(B , 8 , 1);

ciphertext(12) = bitsliceget(C , 32 , 25);
ciphertext(11) = bitsliceget(C , 24 , 17);
ciphertext(10) = bitsliceget(C , 16 , 9);
ciphertext(9) = bitsliceget(C , 8 , 1);

ciphertext(16) = bitsliceget(D , 32 , 25);
ciphertext(15) = bitsliceget(D , 24 , 17);
ciphertext(14) = bitsliceget(D , 16 , 9);
ciphertext(13) = bitsliceget(D , 8 , 1);

CipherText = uint8(ciphertext);