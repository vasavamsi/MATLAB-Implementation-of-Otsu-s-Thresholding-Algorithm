function[y] = bin_19210112(a,b)
format long
n = 1;
k = 0;
out = 1;

%% generating the binary code with less no. of binary digits correspoding to the given message:
while k <= a || k > b
    bit = 1;
    temp = k;
    k = k + (bit)*(2^(-n));
    if k > b
        bit = 0;
        k = temp + bit*(2^(-n));
    end
    out = (out*10) + bit;
    n = n+1
end
out = out/(10^(n-1));
y = out - floor(out);
end