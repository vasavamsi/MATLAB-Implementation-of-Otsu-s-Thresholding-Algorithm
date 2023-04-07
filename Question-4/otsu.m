function[y] = otsu(p, int)

% initializing arrays to store the probability and mean values to
% calculate variance later.
p_1 = [];
p_2 = [];
u_1 = [];
u_2 = [];

%% calculating p1, p2, u1, u2 corresponding to intensity value in the given range:
for t = int(1) : int(length(int))
    
    % calculating p1
    p1 = 0;
    for k = int(1) : t
        p1 = p1 + p(k+1);
    end
    p_1 = [p_1 p1];
    
    % calculating p2
    p2 = 0;
    for k = t+1 : int(length(int))
        p2 = p2 + p(k+1);
    end
    p_2 = [p_2 p2];
    
    % calculating u1
    u1 = 0;
    for k = int(1) : t
        u1 = (k*p(k+1)) + u1;
    end
    u1 = u1/p1;
    u_1 = [u_1 u1];
    
    % calculating u2
    u2 = 0;
    for k = t+1 : int(length(int))
        u2 = (k*p(k+1)) + u2;
    end
    u2 = u2/p2;
    u_2 = [u_2 u2];
end

%% calculating in-between variance array for each intensity:
var_mat = [];
for t = 1 : length(p_1)
    var = (p_1(t)*p_2(t))*((u_1(t)-u_2(t))^2);
    var_mat(t) = var;
end
var_mat(isnan(var_mat)) = 0;
max = var_mat(1);
max_t = int(1);

%% finding the max variance and corresponding intensity value:
for t = 2 : length(p_1)
    if var_mat(t) >= max
        max = var_mat(t);
        max_t = int(t);
        thresh = t;
    else
        continue
    end
end
y = max_t;
end