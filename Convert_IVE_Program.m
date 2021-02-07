%Translates assembler language file to binary program
function y=Convert_IVE_Program(infile,outfile)
FID=fopen(infile,'r');
out_file=[];
while ~feof(FID)
    x=fgets(FID);
    if ~strcmp(x(1:2),'//')
        space_index = find(x==' ');
        if ~isempty(space_index)
            instr = x(1:space_index-1);
            oper = str2double(x(space_index+1:end-1));
            buf=dec2hex(oper);
            buf_oper=[char(zeros(1,3-length(buf))+48) buf];
        else
            instr=x(1:3);
        end
        if strcmp(instr,'LACC')
            out_file=[out_file; ['1' buf_oper]];
        end
        if strcmp(instr,'SACC')
            out_file=[out_file; ['2' buf_oper]];
        end
        if strcmp(instr,'MAC')
            out_file=[out_file; ['3' buf_oper]];
        end
        if strcmp(instr,'JMP')
            
        end
        if strcmp(instr,'SUM')
            out_file=[out_file; ['4' buf_oper]];
        end
        if strcmp(instr,'SMS')
            out_file=[out_file; ['6' buf_oper]];
        end
        if strcmp(instr,'RMI')
            out_file=[out_file; '7000'];
        end
        if strcmp(instr,'IN')
            out_file=[out_file; ['8' buf_oper]];
        end
        if strcmp(instr,'OUT')
            out_file=[out_file; ['9' buf_oper]];
        end
    end
end
fclose(FID);
len=length(out_file);
buf=dec2hex(len);
buf_oper=[char(zeros(1,3-length(buf))+48) buf];
out_file=[out_file; ['5' buf_oper]];
y=out_file;

FID=fopen(outfile,'wb');
for ind=1:length(out_file)
    fprintf(FID,[dec2bin(hex2dec(out_file(ind,:)),16) '\n']);
end
for ind=1:1024-length(out_file)
    fprintf(FID,[dec2bin(hex2dec('FFFF'),16) '\n']);
end
fclose(FID);