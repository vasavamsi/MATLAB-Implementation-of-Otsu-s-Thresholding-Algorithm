function [y] = multithresh_19210112(I,lev)

%% Taking histogram of the image for pixel probability values:
M = length(I(:,1)); 
N = length(I(1,:));
p = [];
int = [];
for i = 0 : 255
    int = [int i];
    cnt = 0;
    for k = 1 :(M*N)
        if I(k) == i
            cnt = cnt+1;
        else
            continue
        end
        p = [p cnt/(M*N)];
    end
end


%% For single thresholding using Otsu's method:
if nargin == 1
    y = otsu(p, int); % Function call for Otsu's method.
    
%% For multiple thresholding using Otsu's method:
elseif nargin == 2 && lev >= 2
    % calculating global mean 
    uG = 0;
     for k = 0 : length(p)-1
         uG = uG + k*p(k+1);
     end
     
     % for N = 2:
     if lev == 2
         max = 0;
         for t1 = 0 : 255
             for t2 = t1+1 : 255
                 u1 = 0;
                 p1 = 0;
                 for k = 0 : t1
                     u1 = u1 + k*p(k+1);
                     p1 = p1 + p(k+1);
                 end
                 u1 = u1/p1;
                 
                 u2 = 0;
                 p2 = 0;
                 for k = t1+1 : t2
                     u2 = u2 + k*p(k+1);
                     p2 = p2 + p(k+1);
                 end
                 u2 = u2/p2;
                 
                 u3 = 0;
                 p3 = 0;
                 for k = t2+1 : 255
                     u3 = u3 + k*p(k+1);
                     p3 = p3 + p(k+1);
                 end
                 u3 = u3/p3;
                 
                 in_btw_var = ((u1-uG)^2)*p1 + ((u2-uG)^2)*p2 + ((u3-uG)^2)*p3;
                 in_btw_var(isnan(in_btw_var)) = 0;
                 if in_btw_var > max
                     max = in_btw_var;
                     thresh = [t1 t2];
                 end
             end
         end
     else
         max = 0;
         for t1 = 0 : 255
             for t2 = t1+1 : 255
                 for t3 = t2+1 : 255
                     u1 = 0;
                     p1 = 0;
                     for k = 0 : t1
                         u1 = u1 + k*p(k+1);
                         p1 = p1 + p(k+1);
                     end
                     u1 = u1/p1;

                     u2 = 0;
                     p2 = 0;
                     for k = t1+1 : t2
                         u2 = u2 + k*p(k+1);
                         p2 = p2 + p(k+1);
                     end
                     u2 = u2/p2;

                     u3 = 0;
                     p3 = 0;
                     for k = t2+1 : t3
                         u3 = u3 + k*p(k+1);
                         p3 = p3 + p(k+1);
                     end
                     u3 = u3/p3;
                     
                     u4 = 0;
                     p4 = 0;
                     for k = t3+1 : 255
                         u4 = u4 + k*p(k+1);
                         p4 = p4 + p(k+1);
                     end
                     u4 = u4/p4;

                     in_btw_var = ((u1-uG)^2)*p1 + ((u2-uG)^2)*p2 + ((u3-uG)^2)*p3 + ((u4-uG)^2)*p4;
                     in_btw_var(isnan(in_btw_var)) = 0;
                     if in_btw_var > max
                         max = in_btw_var;
                         thresh = [t1 t2 t3];
                     end
                 end
             end
         end
     end
         
     
     y = thresh;    
         
         
    
%% For single thresholding using Global thresholding method:
elseif nargin == 2 && lev == 1 
    T = 128; %initial assumption of taking the mid point in the given range of intensities
    
    % initial distribution into two classes corresponding to threshold
    class_1 = [int(1) : int(T+1)]; 
    class_2 = [int(T+1) : int(length(int))];
    Pre_T = 0;
    
    % main algorithm:
    while T-Pre_T >= 5 || Pre_T-T >= 5 %initial check for the tolerance between present and past values of threshold
        Pre_T = T; % assigning variable to the present threshold
        
        % redistribution of the classes corresponding to the new threshold
        class_1 = int(1) : int(T+1);
        class_2 = int(T+1) : int(length(int));
        
        % taking mean for both the classes
        u1 = 0;
        p1 = 0;
        for k = 1 : length(class_1)
            u1 = u1 + p(k)*class_1(k);
            p1 = p1 + p(k);
        end
        u1 = u1/p1;

        u2 = 0;
        p2 = 0;
        for k = 1 : length(class_2)
            u2 = u2 + p(k)*class_2(k);
            p2 = p2 + p(k);
        end
        u2 = u2/p2;
        
        %averaging the means to get new threshold
        T = floor(0.5*(u1 + u2));
    end
    y = T;
end        
end
        
        


        