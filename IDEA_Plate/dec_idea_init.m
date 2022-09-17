function key = dec_idea_init(k)

i=1;
key(6*(i-1)+1) = inv_mult(k(6*(9-i) + 1));
key(6*(i-1)+4) = inv_mult(k(6*(9-i) + 4));
key(6*(i-1)+2) = comp(k(6*(9-i) + 2));
key(6*(i-1)+3) = comp(k(6*(9-i) + 3));
    
key(6*(i-1)+5) = k(6*(8-i) + 5);
key(6*(i-1)+6) = k(6*(8-i) + 6);

for i = 2 : 8
    key(6*(i-1)+1) = inv_mult(k(6*(9-i) + 1));
    key(6*(i-1)+4) = inv_mult(k(6*(9-i) + 4));
    key(6*(i-1)+2) = comp(k(6*(9-i) + 3));
    key(6*(i-1)+3) = comp(k(6*(9-i) + 2));
    
    key(6*(i-1)+5) = k(6*(8-i) + 5);
    key(6*(i-1)+6) = k(6*(8-i) + 6);
end

i=9;
    key(6*(i-1)+1) = inv_mult(k( 1));
    key(6*(i-1)+4) = inv_mult(k( 4));
    key(6*(i-1)+2) = comp(k( 2));
    key(6*(i-1)+3) = comp(k( 3));