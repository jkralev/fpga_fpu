function y=single2bits(u)
b_single=single(u);
%dec2bin(typecast(single(-0.15625),'uint32'),32)
y=typecast(b_single,'uint32');