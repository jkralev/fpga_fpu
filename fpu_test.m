op1=dec2bin(typecast(single(12),'uint32'),32);
s1=op1(1);
e1=op1(2:9);
m1=op1(10:32);

e1n=bin2dec(e1)-127;

op2=dec2bin(typecast(single(10),'uint32'),32);
s2=op2(1);
e2=op2(2:9);
m2=op2(10:32);