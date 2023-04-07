clear all
clc


%%%Comment out the whichever format is not used for testing!!

N = 10; % no. of codes to be sent together as one message
flag = 1; % it can either 0 or 1.

% %% For testing the code on an image:
% I = magic(15); %loading the sample image
% 
% % prob = histogram_19210112(I); % to generate the probability table as per the code requirement from the image
% % msg = rastor (I);
% arith_code(I, N, flag) % Function call if the input is Image

%% For testing the code on manually provided probability table:
prob = [1 0.3;2 0.2;3 0.1;4 0.1;5 0.1;6 0.05;7 0.05;8 0.1] % probability matrix designed as mentioned in the problem statement
msg = [2 3 4 5 2 4 1 4 6 3 4 2 4 5 6 4 3 1 6 5 2 3 7 8 6] % sequence of message to be encoded in form of an array

output = arith_code(prob, N, flag, msg) % Function call if the input is manually given





        
    
    
    

    
        
    
            
    

