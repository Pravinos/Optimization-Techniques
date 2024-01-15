function funder = derSelect(x,funNo)
    
    if funNo == 1
        funder = -(x-4)^2*sin(x)+2*(x-4)*cos(x)+3*(x-1)^2;
    elseif funNo == 2
        funder = 2*(x-2)-2*exp(-2*x);
    elseif funNo == 3
        funder = 2*x*log(0.5*x)+x+0.4*sin(0.2*x)*cos(0.2*x); 
    end
end
