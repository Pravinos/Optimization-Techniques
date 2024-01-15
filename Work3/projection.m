%% 3rd Assignment

function proj = projection(X)

a = [-10,5]; b = [-8,12];

    % if xk(1) out of X:
    if  X(1)  < a(1) 
        
        X(1) = a(1);
        
    elseif X(1) > a(2) 
            
            X(1) = a(2);
    end
    
    % if xk(2) out of X: 
    if  X(2)  < b(1) 
        
        X(2) = b(1);
        
    elseif X(2) > b(2) 
            
            X(2) = b(2);
    end 

    proj = X;
end

