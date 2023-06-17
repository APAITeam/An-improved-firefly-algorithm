%                                                                                       %
%  Developed in MATLAB R2016b                                                           %
%  Programmer: Kamran Rezaei                                                            %
%  e-Mail: kamran.rezaei6990@gmail.com                                                  %
%                                                                                       %
% Main paper:                                                                           %
% Rezaei, K., Rezaei, H., An improved firefly algorithm, 3rd International 
% Conference on Soft Computing (2019), 1132-1140
%_______________________________________________________________________________________%

function X=initialization(pop_size,dim,lb,ub)

for i=1:pop_size
    X(i,:)=rand(1,dim).*(ub-lb)+lb;
end

