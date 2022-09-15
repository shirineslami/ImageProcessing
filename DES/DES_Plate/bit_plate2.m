function [im1, im2, im3, im4, im5, im6, im7, im8] = bit_plate2(im)

%    R1=zeros(); R2=zeros(); R3=zeros(); R4=zeros();
%    R5=zeros(); R6=zeros(); R7=zeros(); R8=zeros();
 %   im1=zeros(); im2=zeros(); im3=zeros(); im4=zeros();
  %  im5=zeros(); im6=zeros(); im7=zeros(); im8=zeros();
[h , w , ~] = size(im);
for x = 1 : h
    for y = 1 : w
        temp = dec2binvec(im(x,y),8);
        R1(x,y) = temp(1);
        R2(x,y) = temp(2);
        R3(x,y) = temp(3);
        R4(x,y) = temp(4);
        R5(x,y) = temp(5);
        R6(x,y) = temp(6);
        R7(x,y) = temp(7);
        R8(x,y) = temp(8);
        
    end
end

[h , w , ~] = size(R1);
for i = 1 : h
    for j = 1 : 8 : w-7
        s = [R1(i,j), R1(i,j+1), R1(i,j+2), R1(i,j+3),...
             R1(i,j+4), R1(i,j+5), R1(i,j+6), R1(i,j+7)];
        im1(i,(j+7)/8) = binvec2dec(s);
              
        
        s = [R2(i,j), R2(i,j+1), R2(i,j+2), R2(i,j+3),...
             R2(i,j+4), R2(i,j+5), R2(i,j+6), R2(i,j+7)];
        im2(i,(j+7)/8) = binvec2dec(s);
               
        
        s = [R3(i,j), R3(i,j+1), R3(i,j+2), R3(i,j+3),...
             R3(i,j+4), R3(i,j+5), R3(i,j+6), R3(i,j+7)];
        im3(i,(j+7)/8) = binvec2dec(s);        
       
        
        
        s = [R4(i,j), R4(i,j+1), R4(i,j+2), R4(i,j+3),...
             R4(i,j+4), R4(i,j+5), R4(i,j+6), R4(i,j+7)];
        im4(i,(j+7)/8) = binvec2dec(s);
      
        
        
        s = [R5(i,j), R5(i,j+1), R5(i,j+2), R5(i,j+3),...
             R5(i,j+4), R5(i,j+5), R5(i,j+6), R5(i,j+7)];
       im5(i,(j+7)/8) = binvec2dec(s);
       
        
        
        s = [R6(i,j), R6(i,j+1), R6(i,j+2), R6(i,j+3),...
             R6(i,j+4), R6(i,j+5), R6(i,j+6), R6(i,j+7)];
       im6(i,(j+7)/8) = binvec2dec(s);
        
        
        
        s = [R7(i,j), R7(i,j+1), R7(i,j+2), R7(i,j+3),...
             R7(i,j+4), R7(i,j+5), R7(i,j+6), R7(i,j+7)];
       im7(i,(j+7)/8) = binvec2dec(s);
     
        
        s = [R8(i,j), R8(i,j+1), R8(i,j+2), R8(i,j+3),...
             R8(i,j+4), R8(i,j+5), R8(i,j+6), R8(i,j+7)];
       im8(i,(j+7)/8) = binvec2dec(s);
    end
end
       