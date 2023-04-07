function [I_quant,index] = imquantize_19210112(I, levels, values)
M = length(I(:,1));
N = length(I(1,:));
I_lev = zeros(M,N);
I_val = zeros(M,N);

%% Assigning pre-approved values to each level after quantization with respect to second argument.
if nargin() == 3
    if length(values) ~= length(levels)+1
        k = length(levels)+1;
        error('enter correct no. of values');
    else
        for i = 1 : (M*N)
            for l = 1 : length(levels)
                if I(i) > levels(length(levels))
                    I_lev(i) = 1+length(levels);
                    I_val(i) = values(1+length(levels));
                    break
                elseif I(i) <= levels(l)
                    I_lev(i) = l;
                    I_val(i) = values(l);
                    break
                else
                    continue
                end
            end
        end
        I_quant = I_val;
        index = I_lev;
    end
    
%% just indexing the levels after quantization with respect to the second argument in the function:
elseif nargin() == 2
    for i = 1 : (M*N)
        for l = 1 : length(levels)
            if I(i) > levels(length(levels))
                I_lev(i) = 1+length(levels);
                break
            elseif I(i) <= levels(l)
                I_lev(i) = l;
                break
            else
                continue
            end
        end
    end
    I_quant = I_lev;
    index = I_lev;
end
imshow(uint8(I_quant))
end
