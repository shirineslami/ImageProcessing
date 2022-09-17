function Result = inv_bit_plate(im1, im2, im3, im4, im5, im6, im7, im8)

%Result = zeros();
[h , w , ~] = size(im1);
for x = 1 : h
    for y = 1 : w
        t1 = dec2binvec(im1(x,y,1),8);
        t2 = dec2binvec(im2(x,y,1),8);
        t3 = dec2binvec(im3(x,y,1),8);
        t4 = dec2binvec(im4(x,y,1),8);
        t5 = dec2binvec(im5(x,y,1),8);
        t6 = dec2binvec(im6(x,y,1),8);
        t7 = dec2binvec(im7(x,y,1),8);
        t8 = dec2binvec(im8(x,y,1),8);
        
        for i = 1 : 8
            s = [t1(i), t2(i), t3(i), t4(i), t5(i), t6(i), t7(i), t8(i)];
            temp = binvec2dec(s);
            Result(x,8*(y-1)+i,1) = temp;
        end
        
        t1 = dec2binvec(im1(x,y,2),8);
        t2 = dec2binvec(im2(x,y,2),8);
        t3 = dec2binvec(im3(x,y,2),8);
        t4 = dec2binvec(im4(x,y,2),8);
        t5 = dec2binvec(im5(x,y,2),8);
        t6 = dec2binvec(im6(x,y,2),8);
        t7 = dec2binvec(im7(x,y,2),8);
        t8 = dec2binvec(im8(x,y,2),8);
        
        for i = 1 : 8
            s = [t1(i), t2(i), t3(i), t4(i), t5(i), t6(i), t7(i), t8(i)];
            temp = binvec2dec(s);
            Result(x,8*(y-1)+i,2) = temp;
        end
        
        t1 = dec2binvec(im1(x,y,3),8);
        t2 = dec2binvec(im2(x,y,3),8);
        t3 = dec2binvec(im3(x,y,3),8);
        t4 = dec2binvec(im4(x,y,3),8);
        t5 = dec2binvec(im5(x,y,3),8);
        t6 = dec2binvec(im6(x,y,3),8);
        t7 = dec2binvec(im7(x,y,3),8);
        t8 = dec2binvec(im8(x,y,3),8);
        
        for i = 1 : 8
            s = [t1(i), t2(i), t3(i), t4(i), t5(i), t6(i), t7(i), t8(i)];
            temp = binvec2dec(s);
            Result(x,8*(y-1)+i,3) = temp;
        end
        
    end
end