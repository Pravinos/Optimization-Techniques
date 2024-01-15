%% 1st Assignment
%%

clear all;
close all;

a = 0;
b = 3;
l = 0.01;

funNos = [1, 2, 3]; % Define the list of funNo values

for funNoIdx = 1:length(funNos)
    funNo = funNos(funNoIdx);
    
    k = zeros([100 1]);
    
        for eps = 1e-5 : 1e-5 : 100e-5
            [kTemp, ~] = dichotomyMethod(a, b, l, eps, funNo);
            k(round(eps/(1e-5))) = kTemp;
        end
    
    %Figure No.1

    figure(110 + funNo) 
    clf
    X = 1e-5 : 1e-5 : 100e-5; 
    Y = 2 * k;
    stem(X*10000,Y,'-xr');
    title('Function Calls per e of Dichotomy Method')
    xlabel('e $10^-4$','Interpreter','latex')
    ylabel('Complexity - Calls of the Function')
   
    k2 = zeros([91 1]);
    e = 0.001;
    limits = zeros([91 2]);
    
    for l = 10e-3 : 1e-3 : 100e-3
        [kTemp, limit] = dichotomyMethod(a,b,l,e,funNo);
        k2(round((l-9e-3)/(1e-3))) = kTemp;
        limits(round((l-9e-3)/(1e-3)), 1) = limit(kTemp,1);
        limits(round((l-9e-3)/(1e-3)), 2) = limit(kTemp,2);
    end

    %Figure No.2 
    
    figure(120 + funNo) 
    clf
    X = 10e-3 : 1e-3 : 100e-3; 
    
    Y = 2 * k2;
    
    plot(X * 100, Y);
    xlabel('l 10$^-1$','Interpreter','latex')
    ylabel('Complexity - Calls of the Function')
    title('Calls per l of the Dichotomy Method')
    
    %Selection for Lamba values: l = [10e-3, 25e-3, 100e-3]
    
    lambda_plot = [10e-3 25e-3 100e-3];
    
    [~, edge1] = dichotomyMethod(a,b,lambda_plot(1),e,funNo);
    [~, edge2] = dichotomyMethod(a,b,lambda_plot(2),e,funNo);
    [~, edge3] = dichotomyMethod(a,b,lambda_plot(3),e,funNo);
    edge1 = [0 3;edge1];
    edge2 = [0 3;edge2];
    edge3 = [0 3;edge3];
    
    %Figure No.3 
    
    figure(130 + funNo) 
    clf
    plot(edge1)
    hold on
    plot(edge2)
    hold on
    plot(edge3)
    hold on
    
    legend('Limit when l = 10$^-2$','Limit when l = 2.5 $10^-2$ ','Limit when l = 10$^-1$','Interpreter','latex')
    xlabel('Function Calls')
    ylabel(sprintf('Value of Function f%d', funNo))
    title('Limits a and b of the calls of Dichotomy Method')

end