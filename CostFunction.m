%                                                                                       %
%  Developed in MATLAB R2016b                                                           %
%  Programmer: Kamran Rezaei                                                            %
%  e-Mail: kamran.rezaei6990@gmail.com                                                  %
%                                                                                       %
% Main paper:                                                                           %
% Rezaei, K., Rezaei, H., An improved firefly algorithm, 3rd International 
% Conference on Soft Computing (2019), 1132-1140
%_______________________________________________________________________________________%

function cost_val = CostFunction(x)

cost_val=sum(x.^2);

end

