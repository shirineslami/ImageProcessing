function ciphertext = cipher (plaintext , k)
%CIPHER  Convert 8 bytes of plaintext to 8 bytes of ciphertext.
%
%   CIPHERTEXT = CIPHER (PLAINTEXT) 
%   converts PLAINTEXT to CIPHERTEXT,
%   using the expanded cipher key K.

X1 = bitconcat(fi(plaintext(2) ,0,8,0) , fi(plaintext(1) ,0,8,0) );
X2 = bitconcat(fi(plaintext(4) ,0,8,0) , fi(plaintext(3) ,0,8,0) );
X3 = bitconcat(fi(plaintext(6) ,0,8,0) , fi(plaintext(5) ,0,8,0) );
X4 = bitconcat(fi(plaintext(8) ,0,8,0) , fi(plaintext(7) ,0,8,0) );
% This part divides the plaintext to 4 16_bit_slices for process.

for i = 1 : 8
   R1 = mult(X1 , k(6*(i-1)+1));
   R2 = add (X2 , k(6*(i-1)+2));
   R3 = add (X3 , k(6*(i-1)+3));
   R4 = mult(X4 , k(6*(i-1)+4));
   
   R5 = bitxor(R1 , R3);
   R6 = bitxor(R2 , R4);
   
   R7 = mult(R5 , k(6*(i-1)+5));
   R8 = add (R6 , R7);
   
   R9 = mult(R8 , k(6*(i-1)+6));
   R10 = add (R7 , R9);
   
   R11 = bitxor(R1 , R9);
   R12 = bitxor(R3 , R9);
   R13 = bitxor(R2 , R10);
   R14 = bitxor(R4 , R10);
   
   X1 = R11;
   X2 = R12;
   X3 = R13;
   X4 = R14;
end

Y1 = mult(X1 , k(49));
Y2 = add (X3 , k(50));
Y3 = add (X2 , k(51));
Y4 = mult(X4 , k(52));

t2 = uint8(bitsliceget( fi(Y1 , 0  , 16 , 0) , 16 , 9));
t1 = uint8(bitsliceget( fi(Y1 , 0  , 16 , 0) , 8 , 1));
t4 = uint8(bitsliceget( fi(Y2 , 0  , 16 , 0) , 16 , 9));
t3 = uint8(bitsliceget( fi(Y2 , 0  , 16 , 0) , 8 , 1));
t6 = uint8(bitsliceget( fi(Y3 , 0  , 16 , 0) , 16 , 9));
t5 = uint8(bitsliceget( fi(Y3 , 0  , 16 , 0) , 8 , 1));
t8 = uint8(bitsliceget( fi(Y4 , 0  , 16 , 0) , 16 , 9));
t7 = uint8(bitsliceget( fi(Y4 , 0  , 16 , 0) , 8 , 1));

ciphertext = [t1 , t2 , t3 , t4 , t5 , t6 , t7 , t8];