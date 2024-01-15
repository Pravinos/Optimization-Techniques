%% 1st Assignment
%%

clear all;
close all;

a = 0;
b = 3;

funNos = [1, 2, 3]; % Define the list of funNo values

for funNoIdx = 1:length(funNos)
    funNo = funNos(funNoIdx);
    
    k3 = zeros([9 1]);
    lims = zeros([9 2]);
        for l = 10e-3 : 1e-3 : 20e-3
            [kTemp, limit] = fibonacciSearch(a,b,l,funNo);
            k3(round((l-9e-3)/(1e-3))) = kTemp;
            lims(round((l-9e-3)/(1e-3)), 1) = limit(kTemp,1);
            lims(round((l-9e-3)/(1e-3)), 2) = limit(kTemp,2);
        end
        
    figure(310 + funNo)
    clf
    
    X = 10e-3 : 1e-3 : 20e-3;
    Y = k3;
    plot(X * 100,Y,'r');
    xlabel('l 10$^-1$','Interpreter','latex')
    ylabel('Complexity - Calls')
    title('Calls per l of the Fibonacci Method')
    
    %Selection for lamba value: l = [10e-3, 25e-3, 100e-3]
    
    lambda = [10e-3 15e-3 20e-3];
    
    [~, edge1] = fibonacciSearch(a,b,lambda(1),funNo);
    edge1 = [0 3;edge1];
    [~, edge2] = fibonacciSearch(a,b,lambda(2),funNo);
    edge2 = [0 3;edge2];
    [~, edge3] = fibonacciSearch(a,b,lambda(3),funNo);
    edge3 = [0 3;edge3];

    figure(320 + funNo)
    clf
    plot(edge1)
    hold on
    plot(edge2)
    hold on
    plot(edge3)
    hold on
    
    legend('Limit when l= 10$^-2$','Limit when l=1.5 $10^-2$ ','Limit when l= 2$^-2$','Interpreter','latex')
    xlabel('Calls')
    ylabel(sprintf('Value of Function f%d', funNo))
    title('Limits a and b of the calls of the Fibonacci Method')
end