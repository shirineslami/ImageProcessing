function output = bind(input)

temp = input;
state(1) = fi(temp(1) , 0 , 16 , 0);
state(2) = fi(temp(2) , 0 , 16 , 0);
state(3) = fi(temp(3) , 0 , 16 , 0);
state(4) = fi(temp(4) , 0 , 16 , 0);
state(5) = fi(temp(5) , 0 , 16 , 0);
state(6) = fi(temp(6) , 0 , 16 , 0);
state(7) = fi(temp(7) , 0 , 16 , 0);
state(8) = fi(temp(8) , 0 , 16 , 0);
output= bitconcat(state(1) , state(2), state(3) , state(4) , state(5), state(6), state(7), state(8));