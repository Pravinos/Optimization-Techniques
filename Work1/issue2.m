%% 1st Assignment
%%

clear all;
close all;

a = 0;
b = 3;
e = 0.001;

funNos = [1, 2, 3]; % Define the list of funNo values

for funNoIdx = 1:length(funNos)
    funNo = funNos(funNoIdx);
    
    k2 = zeros([91 1]);
    limits = zeros([91 2]);
        
        for l = 10e-3 : 1e-3 : 100e-3
            [k, limit] = goldenSectionMethod(a,b,l,funNo);
            k2(round((l-9e-3)/(1e-3))) = k;
            limits(round((l-9e-3)/(1e-3)), 1) = limit(k,1);
            limits(round((l-9e-3)/(1e-3)), 2) = limit(k,2);
        end
        
    figure(210 + funNo)
    clf
    X = 10e-3 : 1e-3 : 100e-3;
    Y = k2;
    plot(X * 100, Y,'r');
    xlabel('l = 10$^-1$','Interpreter','latex')
    ylabel('Complexity - Calls of the Function')
    title('Function Calls per l of the Golden - Section Method')

    % Selection for lamba value: l = [10e-3, 25e-3, 100e-3]
    
    lambda_plot = [10e-3 25e-3 100e-3];
    
    [~, edge1] = goldenSectionMethod(a,b,lambda_plot(1),funNo);
    edge1 = [0 3;edge1];
    [~, edge2] = goldenSectionMethod(a,b,lambda_plot(2),funNo);
    edge2 = [0 3;edge2];
    [~, edge3] = goldenSectionMethod(a,b,lambda_plot(3),funNo);
    edge3 = [0 3;edge3];
    
    figure(220 + funNo)
    clf
    plot(edge1)
    hold on
    plot(edge2)
    hold on
    plot(edge3)
    
    legend('Limit when lambda = 10$^-2$','Limit when lambda = 2.5 x $10^-2$ ','Limit when lambda = 10$^-1$','Interpreter','latex')
    xlabel('Function Calls','Interpreter','latex')
    ylabel(sprintf('Value of Function f%d', funNo))
    title('Limits a and b of the calls of Golden - Section Method')

end