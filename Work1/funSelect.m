function funct = funSelect(x,funNo)
    if funNo == 1
        funct = (x-1)^3+(x-4)^2*cos(x);
    elseif funNo == 2
        funct = exp(-2*x) + (x-2)^2; 
    elseif funNo == 3
        funct = x^2*log(0.5*x)+sin(0.2*x)^2;
    end
end
