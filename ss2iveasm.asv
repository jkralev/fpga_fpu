function data_sim=ss2iveasm(prog_file,data_file,A,B,C,D,options)
opts=uint8(options);
%opts values
%bit 1 - use adc
%bit 2 - use dac
nx=size(A,2);
nu=size(B,2);
ny=size(C,1);
nag=6;
progf=fopen(prog_file,'wb');
dataf=fopen(data_file,'wb');

ZeroLim=eps;

%Memory Map. Base indeces.
Xk = 0;              %address 1..nx x(k)
Xkp1 = nx;           %address nx+1..2*nx x(k+1)
Uk = 2*nx;           %address 2*nx+1..2*nx+nu u(k)
Yk = 2*nx+nu;        %address 2*nx+nu+1..2*nx+nu+ny y(k)
AG = 2*nx+nu+ny;     %address 2*nx+nu+ny+1..2*nx+nu+ny+nag analog parameters
P = 2*nx+nu+ny+nag;  %address 2*nx+nu+ny+nag+1..2*nx+nu+ny+nag+np parameters
MemBuf=zeros(1,2048);

%set analog gains
buf=single2bits(-3.3/4095); %ADC gain, number to volts
MemBuf(AG+1) = buf;
buf=single2bits(4095/4.096); %DAC gain, volts to number
MemBuf(AG+2) = buf;
buf=single2bits(1);
MemBuf(AG+3) = buf;

%Get Inputs
fprintf(progf,'//get inputs \n');
for ind=1:nu
    if bitand(opts,1)
        fprintf(progf,'RMI\n');
        fprintf(progf,['IN ' num2str(ind) '\n']); %get reference value
        fprintf(progf,['MAC ' num2str(AG+3) '\n']);
        fprintf(progf,['IN ' num2str(ind+9) '\n']); %get ADC value
        fprintf(progf,['MAC ' num2str(AG+1) '\n']);
        fprintf(progf,['SMS ' num2str(Uk+ind) '\n']);
    else
        fprintf(progf,['IN ' num2str(ind) '\n']);
        fprintf(progf,['SACC ' num2str(Uk+ind) '\n']);
    end
end

%Time shift
fprintf(progf,'//x(k)=x(k-1) \n');
for ind=1:nx
    fprintf(progf,['LACC ' num2str(Xkp1+ind) '\n']);
    fprintf(progf,['SACC ' num2str(Xk+ind) '\n']);
end

indP=0;
%Output calclulation
fprintf(progf,'//y=C*x(k)+D*u(k) \n');
for ind=1:ny
    fprintf(progf,['//y' num2str(ind) '\n']);
    fprintf(progf,'RMI\n');
    for indx=1:nx
        buf=single2bits(C(ind,indx));
        if abs(C(ind,indx))>ZeroLim
            indP=indP+1;
            MemBuf(P+indP+1) = buf;
            fprintf(progf,['LACC ' num2str(Xk+indx) '\n']);
            fprintf(progf,['MAC ' num2str(P+indP) '\n']);
        end
    end
    for indu=1:nu
        buf=single2bits(D(ind,indu));
        if abs(D(ind,indu))>ZeroLim
            indP=indP+1;
            MemBuf(P+indP+1) = buf;
            fprintf(progf,['LACC ' num2str(Uk+indu) '\n']);
            fprintf(progf,['MAC ' num2str(P+indP) '\n']);
        end
    end
    fprintf(progf,['SMS ' num2str(Yk+ind) '\n']);
end

%State calclulation
fprintf(progf,'//x(k+1)=A*x(k)+B*u(k) \n');
for ind=1:nx
    fprintf(progf,['//x' num2str(ind) '\n']);
    fprintf(progf,'RMI\n');
    for indx=1:nx
        buf=single2bits(A(ind,indx));
        if abs(A(ind,indx))>ZeroLim
            indP=indP+1;
            MemBuf(P+indP+1) = buf;
            fprintf(progf,['LACC ' num2str(Xk+indx) '\n']);
            fprintf(progf,['MAC ' num2str(P+indP) '\n']);
        end
    end
    for indu=1:nu
        buf=single2bits(B(ind,indu));
        if abs(B(ind,indu))>ZeroLim
            indP=indP+1;
            MemBuf(P+indP+1) = buf;
            fprintf(progf,['LACC ' num2str(Uk+indu) '\n']);
            fprintf(progf,['MAC ' num2str(P+indP) '\n']);
        end
    end
    fprintf(progf,['SMS ' num2str(Xkp1+ind) '\n']);
end

%Store output
fprintf(progf,'//put outputs \n');
for ind=1:ny
    fprintf(progf,['LACC ' num2str(Yk+ind) '\n']);
    fprintf(progf,['OUT ' num2str(ind) '\n']);
    if bitand(opts,2)
        fprintf(progf,'RMI\n');
        fprintf(progf,['MAC ' num2str(AG+2) '\n']);
        fprintf(progf,['SMS ' num2str(Yk+ind) '\n']);
        fprintf(progf,['LACC ' num2str(Yk+ind) '\n']);
        fprintf(progf,['OUT ' num2str(ind+9) '\n']);
    end
end
fprintf(progf,'JMP');
fclose(progf);

for ind=1:length(MemBuf)
    fprintf(dataf,[dec2bin(MemBuf(ind),32) '\n']);
end
fclose(dataf);

data_sim=MemBuf;