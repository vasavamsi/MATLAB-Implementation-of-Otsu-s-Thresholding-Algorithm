clear all
clc
I = imread('coins.png'); % loading image.

% Function call to decide threshold levels. 
% Put second input argument as 1 for Single threshold using Global
% Tresholding method
% Put second argument 2 or 3 for Multiple thresholding using Otsu's method.

levels = multithresh_19210112(I); 

values = [0 255]; % should have 1 more value than levels.

[I_quant, index] = imquantize_19210112(I, levels, values); %Function call for quantization.



          
            
