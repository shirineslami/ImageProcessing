function [im1, im2, im3, im4, im5, im6, im7, im8] = bit_plate(im)

%    R1=zeros(); R2=zeros(); R3=zeros(); R4=zeros();
%    R5=zeros(); R6=zeros(); R7=zeros(); R8=zeros();
 %   im1=zeros(); im2=zeros(); im3=zeros(); im4=zeros();
  %  im5=zeros(); im6=zeros(); im7=zeros(); im8=zeros();
[h , w , ~] = size(im);
for x = 1 : h
    for y = 1 : w
        temp = dec2binvec(im(x,y,1),8);
        R1(x,y,1) = temp(1);
        R2(x,y,1) = temp(2);
        R3(x,y,1) = temp(3);
        R4(x,y,1) = temp(4);
        R5(x,y,1) = temp(5);
        R6(x,y,1) = temp(6);
        R7(x,y,1) = temp(7);
        R8(x,y,1) = temp(8);
        
        temp = dec2binvec(im(x,y,2),8);
        R1(x,y,2) = temp(1);
        R2(x,y,2) = temp(2);
        R3(x,y,2) = temp(3);
        R4(x,y,2) = temp(4);
        R5(x,y,2) = temp(5);
        R6(x,y,2) = temp(6);
        R7(x,y,2) = temp(7);
        R8(x,y,2) = temp(8);
        
        temp = dec2binvec(im(x,y,3),8);
        R1(x,y,3) = temp(1);
        R2(x,y,3) = temp(2);
        R3(x,y,3) = temp(3);
        R4(x,y,3) = temp(4);
        R5(x,y,3) = temp(5);
        R6(x,y,3) = temp(6);
        R7(x,y,3) = temp(7);
        R8(x,y,3) = temp(8);
    end
end

[h , w , ~] = size(R1);
for i = 1 : h
    for j = 1 : 8 : w-7
        s = [R1(i,j,1), R1(i,j+1,1), R1(i,j+2,1), R1(i,j+3,1),...
             R1(i,j+4,1), R1(i,j+5,1), R1(i,j+6,1), R1(i,j+7,1)];
        im1(i,(j+7)/8,1) = binvec2dec(s);
        s = [R1(i,j,2), R1(i,j+1,2), R1(i,j+2,2), R1(i,j+3,2),...
             R1(i,j+4,2), R1(i,j+5,2), R1(i,j+6,2), R1(i,j+7,2)];
        im1(i,(j+7)/8,2) = binvec2dec(s);
        s = [R1(i,j,3), R1(i,j+1,3), R1(i,j+2,3), R1(i,j+3,3),...
             R1(i,j+4,3), R1(i,j+5,3), R1(i,j+6,3), R1(i,j+7,3)];
        im1(i,(j+7)/8,3) = binvec2dec(s);
        
        
        s = [R2(i,j,1), R2(i,j+1,1), R2(i,j+2,1), R2(i,j+3,1),...
             R2(i,j+4,1), R2(i,j+5,1), R2(i,j+6,1), R2(i,j+7,1)];
        im2(i,(j+7)/8,1) = binvec2dec(s);
        s = [R2(i,j,2), R2(i,j+1,2), R2(i,j+2,2), R2(i,j+3,2),...
             R2(i,j+4,2), R2(i,j+5,2), R2(i,j+6,2), R2(i,j+7,2)];
        im2(i,(j+7)/8,2) = binvec2dec(s);
        s = [R2(i,j,3), R2(i,j+1,3), R2(i,j+2,3), R2(i,j+3,3),...
             R2(i,j+4,3), R2(i,j+5,3), R2(i,j+6,3), R2(i,j+7,3)];
        im2(i,(j+7)/8,3) = binvec2dec(s);
        
        
        s = [R3(i,j,1), R3(i,j+1,1), R3(i,j+2,1), R3(i,j+3,1),...
             R3(i,j+4,1), R3(i,j+5,1), R3(i,j+6,1), R3(i,j+7,1)];
        im3(i,(j+7)/8,1) = binvec2dec(s);        
        s = [R3(i,j,2), R3(i,j+1,2), R3(i,j+2,2), R3(i,j+3,2),...
             R3(i,j+4,2), R3(i,j+5,2), R3(i,j+6,2), R3(i,j+7,2)];
        im3(i,(j+7)/8,2) = binvec2dec(s);
        s = [R3(i,j,3), R3(i,j+1,3), R3(i,j+2,3), R3(i,j+3,3),...
             R3(i,j+4,3), R3(i,j+5,3), R3(i,j+6,3), R3(i,j+7,3)];
        im3(i,(j+7)/8,3) = binvec2dec(s);
        
        
        s = [R4(i,j,1), R4(i,j+1,1), R4(i,j+2,1), R4(i,j+3,1),...
             R4(i,j+4,1), R4(i,j+5,1), R4(i,j+6,1), R4(i,j+7,1)];
        im4(i,(j+7)/8,1) = binvec2dec(s);
        s = [R4(i,j,2), R4(i,j+1,2), R4(i,j+2,2), R4(i,j+3,2),...
             R4(i,j+4,2), R4(i,j+5,2), R4(i,j+6,2), R4(i,j+7,2)];
        im4(i,(j+7)/8,2) = binvec2dec(s);
        s = [R4(i,j,3), R4(i,j+1, 3), R4(i,j+2,3), R4(i,j+3,3),...
             R4(i,j+4,3), R4(i,j+5,3), R4(i,j+6,3), R4(i,j+7,3)];
        im4(i,(j+7)/8,3) = binvec2dec(s);
        
        
        s = [R5(i,j,1), R5(i,j+1,1), R5(i,j+2,1), R5(i,j+3,1),...
             R5(i,j+4,1), R5(i,j+5,1), R5(i,j+6,1), R5(i,j+7,1)];
       im5(i,(j+7)/8,1) = binvec2dec(s);
        s = [R5(i,j,2), R5(i,j+1,2), R5(i,j+2,2), R5(i,j+3,2),...
             R5(i,j+4,2), R5(i,j+5,2), R5(i,j+6,2), R5(i,j+7,2)];
       im5(i,(j+7)/8,2) = binvec2dec(s);
        s = [R5(i,j,3), R5(i,j+1,3), R5(i,j+2,3), R5(i,j+3,3),...
             R5(i,j+4,3), R5(i,j+5,3), R5(i,j+6,3), R5(i,j+7,3)];
        im5(i,(j+7)/8,3) = binvec2dec(s);
        
        
        s = [R6(i,j,1), R6(i,j+1,1), R6(i,j+2,1), R6(i,j+3,1),...
             R6(i,j+4,1), R6(i,j+5,1), R6(i,j+6,1), R6(i,j+7,1)];
       im6(i,(j+7)/8,1) = binvec2dec(s);
        s = [R6(i,j,2), R6(i,j+1,2), R6(i,j+2,2), R6(i,j+3,2),...
             R6(i,j+4,2), R6(i,j+5,2), R6(i,j+6,2), R6(i,j+7,2)];
        im6(i,(j+7)/8,2) = binvec2dec(s);
        s = [R6(i,j,3), R6(i,j+1,3), R6(i,j+2,3), R6(i,j+3,3),...
             R6(i,j+4,3), R6(i,j+5,3), R6(i,j+6,3), R6(i,j+7,3)];
        im6(i,(j+7)/8,3) = binvec2dec(s);
        
        
        s = [R7(i,j,1), R7(i,j+1,1), R7(i,j+2,1), R7(i,j+3,1),...
             R7(i,j+4,1), R7(i,j+5,1), R7(i,j+6,1), R7(i,j+7,1)];
       im7(i,(j+7)/8,1) = binvec2dec(s);
       s = [R7(i,j,2), R7(i,j+1,2), R7(i,j+2,2), R7(i,j+3,2),...
             R7(i,j+4,2), R7(i,j+5,2), R7(i,j+6,2), R7(i,j+7,2)];
       im7(i,(j+7)/8,2) = binvec2dec(s);
       s = [R7(i,j,3), R7(i,j+1,3), R7(i,j+2,3), R7(i,j+3,3),...
             R7(i,j+4,3), R7(i,j+5,3), R7(i,j+6,3), R7(i,j+7,3)];
       im7(i,(j+7)/8,3) = binvec2dec(s);
        
        s = [R8(i,j,1), R8(i,j+1,1), R8(i,j+2,1), R8(i,j+3,1),...
             R8(i,j+4,1), R8(i,j+5,1), R8(i,j+6,1), R8(i,j+7,1)];
       im8(i,(j+7)/8,1) = binvec2dec(s);
       s = [R8(i,j,2), R8(i,j+1,2), R8(i,j+2,2), R8(i,j+3,2),...
             R8(i,j+4,2), R8(i,j+5,2), R8(i,j+6,2), R8(i,j+7,2)];
       im8(i,(j+7)/8,2) = binvec2dec(s);
       s = [R8(i,j,3), R8(i,j+1,3), R8(i,j+2,3), R8(i,j+3,3),...
             R8(i,j+4,3), R8(i,j+5,3), R8(i,j+6,3), R8(i,j+7,3)];
       im8(i,(j+7)/8,3) = binvec2dec(s);
       
    end
end