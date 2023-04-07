function [y] = arith_code(input, N, flag, msg)
format long
out = [];
seq = 1;
row = 1;
bin_out = [];
if nargin == 3
    msg = rastor(input); %It keeps the pixel values in raster order in a single sequence array
    input = histogram_19210112(input);
end
while seq < length(msg) + 1
    
    %% for range determintion to select the code:
    ini_val = 0;
    fin_val = 1;
    sym = 1;
    cnt = 0;
    low = ini_val;
    while cnt <= N
        high = low + ((fin_val - ini_val)*input(sym,2));
        if sym == msg(seq)
            ini_val = low;
            fin_val = high;
            cnt = cnt+1;
            sym = 1;
            seq = seq + 1;
            if cnt == N || seq > length(msg)
                break
            end
        elseif sym ~= msg(seq)
            low = high;
            if sym < length(input(:,1))
                sym = sym + 1;
                continue
            else
                sym = 1;
                continue
            end
        end
    end
    ini_val
    fin_val

    %% for decimal output:
    if flag == 0
        k = ini_val;
        cnt = 0;
        while k ~= 0
            k = (10*k) - floor(10*k);
            if k ~= 0
                cnt = cnt+1;
                continue
            else
                break
            end
        end

        k = ini_val;
        for t = 1 : cnt
            val = (floor(k*(10^t)))*(10^-t) + (10^-t);
            if val < fin_val
                out = [out; val];
                break
            else
                continue
            end
        end
    
    %% for binary output:
    elseif flag == 1
        fin_code = bin_19210112(ini_val,fin_val); %function call for binary output for the encoded message
        bin_out = [bin_out ;fin_code];
    end
end

if flag == 0
    y = out;
else
    y = bin_out;
end
save('output.mat','y');
end

        


