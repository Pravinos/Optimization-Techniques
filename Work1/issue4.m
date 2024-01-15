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
    k = zeros([91 1]);
    limits = zeros([91 2]);
        
        for l = 10e-3 : 1e-3 : 100e-3
            [kTemp, limit] = derivativeMethod(a,b,l,funNo);
            k(round((l-9e-3)/(1e-3))) = kTemp;
            limits(round((l-9e-3)/(1e-3)), 1) = limit(kTemp,1);
            limits(round((l-9e-3)/(1e-3)), 2) = limit(kTemp,2);
        end
    
    figure(410+funNo)
    clf
    X = 10e-3:1e-3:100e-3;
    
    Y = k;
    
    plot(X * 100, Y,'LineWidth',3);
    xlabel('l 10$^-1$','Interpreter','latex')
    ylabel('Complexity - Function Calls')

    %Selection for lamba value: l = [10e-3, 25e-3, 100e-3]
    
    lambda_plot = [10e-3 25e-3 100e-3];
    
    [~, edge1] = derivativeMethod(a,b,lambda_plot(1),funNo);
    edge1 = [0 3;edge1];
    [~, edge2] = derivativeMethod(a,b,lambda_plot(2),funNo);
    edge2 = [0 3;edge2];
    [~, edge3] = derivativeMethod(a,b,lambda_plot(3),funNo);
    edge3 = [0 3;edge3];
    
    figure(420 + funNo)
    clf
    plot(edge1)
    hold on
    plot(edge2)
    hold on
    plot(edge3)
    
    legend('limits for l = 10$^-2$','limits for l = 2.5 $10^-2$ ','limits for l = 10$^-1$','Interpreter','latex')
    xlabel('Function Calls')
    ylabel(sprintf('Value of Function f%d', funNo))
    title('Limits a and b of the calls of the Dichotomy Method using Derivatives')
end