%                                                                                       %
%  Developed in MATLAB R2016b                                                           %
%  Programmer: Kamran Rezaei                                                            %
%  e-Mail: kamran.rezaei6990@gmail.com                                                  %
%                                                                                       %
% Main paper:                                                                           %
% Rezaei, K., Rezaei, H., An improved firefly algorithm, 3rd International 
% Conference on Soft Computing (2019), 1132-1140
%_______________________________________________________________________________________%

clear 
close all
clc

pop_size = 20;
MaxFe = 150000;
dim = 10;
lb = -100;
ub = 100;

alpha=0.5;
beta0=1;
betamin = 0.2;
gamma=1/(ub-lb)^2;

[best_fit,best_pos,convergence_curve] = INaFA(pop_size,dim,lb,ub,MaxFe,alpha,beta0,betamin,gamma);

plot(convergence_curve);
title('Convergence curve of INaFA')
xlabel('FEs');
ylabel('Objective function value');