function[y] = rastor(I)
msg = [];
M = length(I(:,1));
N = length(I(1,:));

%% to align all the intensity values in single array format:
for i = 1 : M*N
    msg(i) = I(i);
end
y = msg;
end

      