%                                                                                       %
%  Developed in MATLAB R2016b                                                           %
%  Programmer: Kamran Rezaei                                                            %
%  e-Mail: kamran.rezaei6990@gmail.com                                                  %
%                                                                                       %
% Main paper:                                                                           %
% Rezaei, K., Rezaei, H., An improved firefly algorithm, 3rd International 
% Conference on Soft Computing (2019), 1132-1140
%_______________________________________________________________________________________%

function [best_fit,best_pos,convergence_curve]=INaFA(nPop,dim,lb,ub,MaxFe,alpha,beta0,betamin,gamma)

pop = initialization(nPop,dim,lb,ub);
pop_cost = zeros(1,nPop);
best_fit = inf;
fe = 0;
convergence_curve = zeros(1,MaxFe);
for i=1:nPop
    pop_cost(i) = CostFunction(pop(i,:));
    fe = fe+1;
    if pop_cost(i)<best_fit
        best_fit = pop_cost(i);
        best_pos = pop(i,:);
    end
    convergence_curve(fe) = best_fit;
end

it = 1;
k = 3;
while fe<MaxFe

    alpha = alpha*((1-(fe/MaxFe))^(1/(3*dim)));
    scale = repmat(abs(ub-lb),1,dim);

    for i=1:nPop
        neighbors = (i-k):(i+k);
        for neighbor_ind=1:size(neighbors,2)
            j = rem((neighbors(neighbor_ind)+nPop),nPop);
            if j==0
                j = nPop;
            end
            if j==i
                continue;
            end
            if pop_cost(j) < pop_cost(i)
                rij=sqrt(sum((pop(i,:)-pop(j,:)).^2));
                beta=(beta0-betamin)*exp(-gamma*rij^2)+betamin;
                e=scale.*(rand(1,dim)-0.5);
                pop(i,:) = pop(i,:)+beta.*(pop(j,:)-pop(i,:))+alpha*e;
                pop(i,:) = min(pop(i,:),ub);
                pop(i,:) = max(pop(i,:),lb);
                pop_cost(i) = CostFunction(pop(i,:));
                fe=fe+1;
                if pop_cost(i)<best_fit
                    best_fit = pop_cost(i);
                    best_pos = pop(i,:);
                end
                convergence_curve(fe) = best_fit;
            end
        end
    end
    it=it+1;
    fprintf('best fitness of iteration %d is:  %f\n',it,best_fit);
end
end
