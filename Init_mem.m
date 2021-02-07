FID=fopen('data_1.ivd','wb');
for ind=1:2048
    fprintf(FID,'00000000000000000000000000000000\n');
end
fclose(FID);

FID=fopen('program_1.ive','wb');
fprintf(FID,[dec2bin(hex2dec('8001'),16) '\n']);
fprintf(FID,[dec2bin(hex2dec('2000'),16) '\n']);
fprintf(FID,[dec2bin(hex2dec('8002'),16) '\n']);
fprintf(FID,[dec2bin(hex2dec('2001'),16) '\n']);
fprintf(FID,[dec2bin(hex2dec('1000'),16) '\n']);
fprintf(FID,[dec2bin(hex2dec('4001'),16) '\n']);
fprintf(FID,[dec2bin(hex2dec('6002'),16) '\n']);
fprintf(FID,[dec2bin(hex2dec('1002'),16) '\n']);
fprintf(FID,[dec2bin(hex2dec('9004'),16) '\n']);
fprintf(FID,[dec2bin(hex2dec('5009'),16) '\n']);
for ind=1:246
    fprintf(FID,[dec2bin(hex2dec('FFFF'),16) '\n']);
end
fclose(FID);

Program_VR=hex2dec([
    '1005'
    '2006'
    '8001'
    '2005'
    '1003'
    '2004'
    '7000'
    '1000'
    '3004'
    '1001'
    '3005'
    '1002'
    '3006'
    '6003'
    '1003'
    '9001'
    '5010'
    ]);
FID=fopen('program_1.ive','wb');
for ind=1:length(Program_VR)
    fprintf(FID,[dec2bin(Program_VR(ind,1),16) '\n']);
end
for ind=1:256-length(Program_VR)
    fprintf(FID,[dec2bin(hex2dec('FFFF'),16) '\n']);
end
fclose(FID);

%A1=1; B1=0.15; B2=0;%-0.147;
%data_init=[uint32(A1*2^20) uint32(B1*2^20) uint32(2^32+B2*2^20) 0 0 0 0];
%A1=0.003; B1=0.003; B2=0.15;
%data_init=[uint32(A1*2^16) uint32(B1*2^16) uint32(B2*2^16) 0 0 0 0];
data_init=[uint32(0.003*2^16) uint32(0.15*2^16) 0 0 0 0 0];
FID=fopen('data_1.ivd','wb');
for ind=1:length(data_init)
    fprintf(FID,[dec2bin(data_init(ind),32) '\n']);
end
for ind=1:2048-length(data_init)
    fprintf(FID,[dec2bin(hex2dec('00000000'),32) '\n']);
end
fclose(FID);

Program_ss1=hex2dec([
    '1003'
    '2002'
    '8001'
    '2004'
    '7000'
    '1000'
    '3002'
    '1001'
    '3004'
    '6005'
    '7000'
    '1002'
    '4004'
    '6003'
    '1005'
    '9001'
    '5010'
    ]);
FID=fopen('program_1.ive','wb');
for ind=1:length(Program_ss1)
    fprintf(FID,[dec2bin(Program_ss1(ind,1),16) '\n']);
end
for ind=1:256-length(Program_ss1)
    fprintf(FID,[dec2bin(hex2dec('FFFF'),16) '\n']);
end
fclose(FID);

Program_sum=hex2dec([
    '1003'
    '2002'
    '8001'
    '2004'
    '7000'
    '1002'
    '4004'
    '6003'
    '1002'
    '9001'
    '500A'
    ]);
FID=fopen('program_1.ive','wb');
for ind=1:length(Program_VR)
    fprintf(FID,[dec2bin(Program_VR(ind,1),16) '\n']);
end
for ind=1:256-length(Program_VR)
    fprintf(FID,[dec2bin(hex2dec('FFFF'),16) '\n']);
end
fclose(FID);

data_init_sim=zeros(1,100);
data_init_sim(1)=-1;
data_init_sim(2)=Ad(1,1);
data_init_sim(3)=Ad(2,2);
data_init_sim(4)=Ad(3,3);
data_init_sim(5)=Ad(3,4);
data_init_sim(6)=Ad(4,4);
data_init_sim(7)=Ad(5,5);
data_init_sim(8)=Ad(6,6);
data_init_sim(9)=Ad(6,7);
data_init_sim(10)=Ad(7,6);
data_init_sim(11)=Ad(8,8);
data_init_sim(12)=Ad(8,9);
data_init_sim(13)=Ad(9,8);
data_init_sim(14)=Cd(1,1);
data_init_sim(15)=Cd(2,2);
data_init_sim(16)=Cd(2,3);
data_init_sim(17)=Cd(2,4);
data_init_sim(18)=Dd(2,2);
data_init_sim(19)=Dd(2,4);
data_init_sim(20)=Cd(3,5);
data_init_sim(21)=Cd(3,6);
data_init_sim(22)=Cd(3,7);
data_init_sim(23)=Dd(3,1);
data_init_sim(24)=Dd(3,5);
data_init_sim(25)=Cd(4,8);
data_init_sim(26)=Cd(4,9);
data_init_sim(27)=Dd(4,6);
data_init_sim(57)=Dd(1,3);
data_init_sim(58)=1;
%State space helicopter controller
data_init=zeros(1,60);
data_init(1)=fix2uint(-1);
data_init(2)=fix2uint(Ad(1,1));
data_init(3)=fix2uint(Ad(2,2));
data_init(4)=fix2uint(Ad(3,3));
data_init(5)=fix2uint(Ad(3,4));
data_init(6)=fix2uint(Ad(4,4));
data_init(7)=fix2uint(Ad(5,5));
data_init(8)=fix2uint(Ad(6,6));
data_init(9)=fix2uint(Ad(6,7));
data_init(10)=fix2uint(Ad(7,6));
data_init(11)=fix2uint(Ad(8,8));
data_init(12)=fix2uint(Ad(8,9));
data_init(13)=fix2uint(Ad(9,8));
data_init(14)=fix2uint(Cd(1,1));
data_init(15)=fix2uint(Cd(2,2));
data_init(16)=fix2uint(Cd(2,3));
data_init(17)=fix2uint(Cd(2,4));
data_init(18)=fix2uint(Dd(2,2));
data_init(19)=fix2uint(Dd(2,4));
data_init(20)=fix2uint(Cd(3,5));
data_init(21)=fix2uint(Cd(3,6));
data_init(22)=fix2uint(Cd(3,7));
data_init(23)=fix2uint(Dd(3,1));
data_init(24)=fix2uint(Dd(3,5));
data_init(25)=fix2uint(Cd(4,8));
data_init(26)=fix2uint(Cd(4,9));
data_init(27)=fix2uint(Dd(4,6));
data_init(57)=fix2uint(Dd(1,3));
data_init(58)=fix2uint(1);
FID=fopen('data_1.ivd','wb');
for ind=1:length(data_init)
    fprintf(FID,[dec2bin(data_init(ind),32) '\n']);
end
for ind=1:2048-length(data_init)
    fprintf(FID,[dec2bin(hex2dec('00000000'),32) '\n']);
end
fclose(FID);

Program_ss1=hex2dec([
'8001'
'202E'
'8002'
'202F'
'8003'
'2030'
'8004'
'2031'
'8005'
'2032'
'8006'
'2033'
'1025'
'201C'
'1026'
'201D'
'1027'
'201E'
'1028'
'201F'
'1029'
'2020'
'102A'
'2021'
'102B'
'2022'
'102C'
'2023'
'102D'
'2024'
'7000'
'100D'
'301C'
'1038'
'3030'
'6034'
'7000'
'100E'
'301D'
'100F'
'301E'
'1010'
'301F'
'1011'
'302F'
'1012'
'3031'
'6035'
'7000'
'1013'
'3020'
'1014'
'3021'
'1015'
'3022'
'1016'
'302E'
'1017'
'3032'
'6036'
'7000'
'1018'
'3023'
'1019'
'3024'
'101A'
'3033'
'6037'
'7000'
'1001'
'301C'
'1039'
'3030'
'6025'
'7000'
'1002'
'301D'
'1000'
'3031'
'6026'
'7000'
'1003'
'301E'
'1004'
'301F'
'1000'
'302F'
'6027'
'7000'
'1005'
'301F'
'6028'
'7000'
'1006'
'3020'
'1000'
'3032'
'6029'
'7000'
'1007'
'3021'
'1008'
'3022'
'1039'
'302E'
'602A'
'7000'
'1009'
'3021'
'602B'
'7000'
'100A'
'3023'
'100B'
'3024'
'1000'
'3033'
'602C'
'7000'
'100C'
'3023'
'602D'
'1034'
'9001'
'1035'
'9002'
'1036'
'9003'
'1037'
'9004'
'5082'
    ]);
FID=fopen('program_1.ive','wb');
for ind=1:length(Program_ss1)
    fprintf(FID,[dec2bin(hex2dec(Program_ss1(ind,1)),16) '\n']);
end
for ind=1:256-length(Program_ss1)
    fprintf(FID,[dec2bin(hex2dec('FFFF'),16) '\n']);
end
fclose(FID);

%Controller 29.11.2012
%State space helicopter controller
data_init=zeros(1,60);
data_init(1)=fix2uint(-1);
data_init(2)=fix2uint(1);
data_init(3)=fix2uint(1.9);
data_init(4)=fix2uint(-0.95);
data_init(5)=fix2uint(2);
data_init(6)=fix2uint(0.003);
data_init(7)=fix2uint(0.15);
data_init(8)=fix2uint(-0.0001);
data_init(9)=fix2uint(0.0001);
data_init(10)=fix2uint(-0.006);
data_init(11)=fix2uint(0.0059);
data_init(40)=fix2uint(0.001);
data_init(41)=fix2uint(0.95);
FID=fopen('data_1.ivd','wb');
for ind=1:length(data_init)
    fprintf(FID,[dec2bin(data_init(ind),32) '\n']);
end
for ind=1:2048-length(data_init)
    fprintf(FID,[dec2bin(hex2dec('00000000'),32) '\n']);
end
fclose(FID);

data_init_sim=zeros(1,100);
data_init_sim(1)=-1;
data_init_sim(2)=1;
data_init_sim(3)=1.8;
data_init_sim(4)=-0.9;
data_init_sim(5)=2;
data_init_sim(6)=0.003;
data_init_sim(7)=0.15;
data_init_sim(8)=-0.0019;
data_init_sim(9)=0.002;
data_init_sim(10)=-0.006;
data_init_sim(11)=0.00594;
data_init_sim(40)=0.01;
data_init_sim(41)=0.9;


data_init=zeros(1,60);
data_init(1)=fix2uint(1);
data_init(2)=fix2uint(0.9018); %0.9017
data_init(3)=fix2uint(0.04819); %0.04835
data_init(4)=fix2uint(0.9018); %0.9017
data_init(5)=fix2uint(-0.04819); %-0.04835
data_init(6)=fix2uint(0.9982); %0.9983
data_init(7)=fix2uint(0.25);
data_init(8)=fix2uint(-0.5531); %-0.5424
data_init(9)=fix2uint(-0.4369);
data_init(10)=fix2uint(-0.0221);
data_init(11)=fix2uint(0.0221);
data_init(12)=fix2uint(-0.03162);
data_init(13)=fix2uint(-0.001369); %-0.00108
data_init(14)=fix2uint(0.012);
data_init(15)=fix2uint(0.012);
data_init(16)=fix2uint(0.03162);
data_init(17)=fix2uint(-0.001369); %-0.00108
data_init(18)=fix2uint(-0.03162);
data_init(19)=fix2uint(0.001369); %0.00108
data_init(20)=fix2uint(-0.001358);
data_init(21)=fix2uint(0.2702);
data_init(22)=fix2uint(0.15);
data_init(23)=fix2uint(-1);
data_init(24)=fix2uint(-2);
FID=fopen('data_1.ivd','wb');
for ind=1:length(data_init)
    fprintf(FID,[dec2bin(data_init(ind),32) '\n']);
end
for ind=1:2048-length(data_init)
    fprintf(FID,[dec2bin(hex2dec('00000000'),32) '\n']);
end
fclose(FID);
data_init_sim=zeros(1,100);
data_init_sim(1)=1;
data_init_sim(2)=0.9017;
data_init_sim(3)=0.04835;
data_init_sim(4)=0.9017;
data_init_sim(5)=-0.04835;
data_init_sim(6)=0.9983;
data_init_sim(7)=0.25;
data_init_sim(8)=-0.5424;
data_init_sim(9)=-0.4369;
data_init_sim(10)=-0.0221;
data_init_sim(11)=0.0221;
data_init_sim(12)=-0.03162;
data_init_sim(13)=-0.00108;
data_init_sim(14)=0.012;
data_init_sim(15)=0.012;
data_init_sim(16)=0.03162;
data_init_sim(17)=-0.00108;
data_init_sim(18)=-0.03162;
data_init_sim(19)=0.00108;
data_init_sim(20)=-0.001358;
data_init_sim(21)=0.2702;
data_init_sim(22)=0.15;
data_init_sim(23)=-1;
data_init_sim(24)=-2;

%Test1
data_init=zeros(1,6);
data_init(1)=single2bits(2);
data_init(2)=single2bits(100);
data_init(3)=single2bits(100);
data_init(4)=single2bits(0);
data_init(5)=single2bits(1000);
data_init(6)=single2bits(3.3/4095);
FID=fopen('data_1.ivd','wb');
for ind=1:length(data_init)
    fprintf(FID,[dec2bin(data_init(ind),32) '\n']);
end
for ind=1:2048-length(data_init)
    fprintf(FID,[dec2bin(hex2dec('00000000'),32) '\n']);
end
fclose(FID);

data_init_sim=zeros(1,100);
data_init_sim(1)=single2bits(0);
data_init_sim(2)=single2bits(100);
data_init_sim(3)=single2bits(100);
data_init_sim(4)=single2bits(0);
data_init_sim(5)=single2bits(0.5);
data_init_sim(6)=single2bits(1);


data_init_sim=zeros(1,100);
data_init_sim(6)=single2bits(1);
data_init_sim(7)=single2bits(0.8);
data_init_sim(8)=single2bits(1);

data_init_sim=zeros(1,100);
data_init_sim(8)=uint32(bin2dec('00111100000010110110110100001100'));
data_init_sim(9)=uint32(bin2dec('00111011100011000000001011110111'));
data_init_sim(10)=uint32(bin2dec('00111111011111101011010111100001'));
data_init_sim(11)=uint32(bin2dec('00111111100000000000000000000000'));
data_init_sim(12)=uint32(bin2dec('10111000110011111001111100100000'));
data_init_sim(13)=uint32(bin2dec('00111111011111101011010111100001'));
data_init_sim(14)=uint32(bin2dec('00111100001111110001010110010100'));

z=bin2dec('00111100001111110001010110010100');
typecast(uint32(z),'single')