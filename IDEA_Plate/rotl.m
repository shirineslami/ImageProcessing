function rot = rotl (input , n)

t1 = bitsliceget(input , 128 , (128-n)+1);
t2 = bitsliceget(input , (128-n) , 1);

rot = bitconcat(t2,t1);