function data_sim=ss2iveasm_AS(prog_file,data_file,A,B,C,D)
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
buf=single2bits(0.0016); %ADC gain, number to volts
MemBuf(AG+1) = buf;
buf=single2bits(-2030); %ADC offset, number to volts
MemBuf(AG+2) = buf;
buf=single2bits(1/0.0012); %DAC gain, volts to number
MemBuf(AG+3) = buf;
buf=single2bits(1380);
MemBuf(AG+4) = buf;
buf=single2bits(1); MemBuf(AG+5) = buf;
buf=single2bits(-1); MemBuf(AG+6) = buf;

%Get Inputs
fprintf(progf,'//get inputs \n');
for ind=1:nu
    fprintf(progf,'RMI\n');
    fprintf(progf,['IN ' num2str(ind) '\n']); %get reference value
    fprintf(progf,['MAC ' num2str(AG+4) '\n']);
    fprintf(progf,['IN ' num2str(ind+9) '\n']); %get ADC value
    fprintf(progf,['MAC ' num2str(AG) '\n']);
    fprintf(progf,['LACC ' num2str(AG+1) '\n']); %get offset value
    fprintf(progf,['MAC ' num2str(AG) '\n']);
    fprintf(progf,['SMS ' num2str(Uk+ind-1) '\n']);
    
    fprintf(progf,['LACC ' num2str(Uk+ind-1) '\n']);
    fprintf(progf,['OUT ' num2str(ind+2) '\n']);
end

%Time shift
fprintf(progf,'//x(k)=x(k-1) \n');
for ind=1:nx
    fprintf(progf,['LACC ' num2str(Xkp1+ind-1) '\n']);
    fprintf(progf,['SACC ' num2str(Xk+ind-1) '\n']);
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
            fprintf(progf,['LACC ' num2str(Xk+indx-1) '\n']);
            fprintf(progf,['MAC ' num2str(P+indP) '\n']);
            MemBuf(P+indP+1) = buf;
            indP=indP+1;
        end
    end
    for indu=1:nu
        buf=single2bits(D(ind,indu));
        if abs(D(ind,indu))>ZeroLim
            fprintf(progf,['LACC ' num2str(Uk+indu-1) '\n']);
            fprintf(progf,['MAC ' num2str(P+indP) '\n']);
            MemBuf(P+indP+1) = buf;
            indP=indP+1;
        end
    end
    fprintf(progf,['SMS ' num2str(Yk+ind-1) '\n']);
end

%State calclulation
fprintf(progf,'//x(k+1)=A*x(k)+B*u(k) \n');
for ind=1:nx
    fprintf(progf,['//x' num2str(ind) '\n']);
    fprintf(progf,'RMI\n');
    for indx=1:nx
        buf=single2bits(A(ind,indx));
        if abs(A(ind,indx))>ZeroLim
            fprintf(progf,['LACC ' num2str(Xk+indx-1) '\n']);
            fprintf(progf,['MAC ' num2str(P+indP) '\n']);
            MemBuf(P+indP+1) = buf;
            indP=indP+1;
        end
    end
    for indu=1:nu
        buf=single2bits(B(ind,indu));
        if abs(B(ind,indu))>ZeroLim
            fprintf(progf,['LACC ' num2str(Uk+indu-1) '\n']);
            fprintf(progf,['MAC ' num2str(P+indP) '\n']);
            MemBuf(P+indP+1) = buf;
            indP=indP+1;
        end
    end
    fprintf(progf,['SMS ' num2str(Xkp1+ind-1) '\n']);
end

%Store output
fprintf(progf,'//put outputs \n');
for ind=1:ny
    fprintf(progf,['LACC ' num2str(Yk+ind-1) '\n']);
    fprintf(progf,['OUT ' num2str(ind) '\n']);
    
    fprintf(progf,'RMI\n');
    fprintf(progf,['LACC ' num2str(Yk+ind-1) '\n']);
    fprintf(progf,['MAC ' num2str(AG+2) '\n']);
    fprintf(progf,['LACC ' num2str(AG+3) '\n']);
    fprintf(progf,['MAC ' num2str(AG+4) '\n']);
    fprintf(progf,['SMS ' num2str(Yk+ind-1) '\n']);
    fprintf(progf,['LACC ' num2str(Yk+ind-1) '\n']);
    fprintf(progf,['OUT ' num2str(ind+9) '\n']);
end
fprintf(progf,'JMP');
fclose(progf);

for ind=1:length(MemBuf)
    fprintf(dataf,[dec2bin(MemBuf(ind),32) '\n']);
end
fclose(dataf);

data_sim=MemBuf;