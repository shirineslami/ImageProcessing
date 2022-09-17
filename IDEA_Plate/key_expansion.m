function k = key_expansion(key)

a1 = key(1);
a2 = key(2);
a3 = key(3);
a4 = key(4);

a5 = key(5);
a6 = key(6);
a7 = key(7);
a8 = key(8);

k = [a1 , a2 , a3 , a4 , a5 , a6 , a7 , a8];
temp = key;
state_concat = bind(temp);

for i = 1 : 6
    state = rotl(state_concat , 25);
    temp = sliceget(state);
    k = [k, temp];
    state_concat = state;
end