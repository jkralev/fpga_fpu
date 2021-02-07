function y=fix2uint(u)
if u<0
    y=uint32(2^32+u*2^16);
else
    y=uint32(u*2^16);
end