function[y] = histogram_19210112(I)
M = length(I(:,1));
N = length(I(1,:));
p = [];

%% generating the probability table for the given image:
for i = 0 : 255
    cnt = 0;
    for k = 1 :(M*N)
        if I(k) == i
            cnt = cnt+1;
        else
            continue
        end
        p(i+1,1) = i+1;
        p(i+1,2) = cnt/(M*N);
    end
end
y = p;
end
