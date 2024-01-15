%% 3rd Assignment

function [xk,n] = steepestDescent(f,epsilon,gamma,X)

max_step = 120;
d = []; %create an array to hold the values of the dk vector
k = 1; 
xk = X;
f_grad = gradient(f); %calculate the gradient of our function

while (norm(double(subs(f_grad,symvar(f_grad),{xk(:,k)'}))) > epsilon...
        && k < max_step)
           
        % Calculate the k+1 d value and place it in the the 
        % placeholder Dk matrix
        d = [d -double(subs(f_grad,symvar(f_grad),{xk(:,k)'}))];
    
        % do the same for the xk+1 values
        x_k = xk(:,k) + gamma * d(:,k);
        xk = [xk x_k];
            
        % Increase the k counter 
        k = k + 1;
        
end
n = k - 1 ;
end

