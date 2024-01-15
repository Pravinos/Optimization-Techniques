%% 3rd Assignment

clear;
close all;
clc;

x = sym('x',[1 2]);
f(x) = (1/3)*x(1)^2 + 3*x(2)^2;

X = [5, -5;-5, 10;5, -8];
epsilon = [0.01 0.01 0.01];
gamma = [0.5 0.1 0.2];
sk = [5 15 0.1];
flag = [100 100 100];
values = zeros(3,3);
for i=1:3
    values(i,:) = steepestDescent_projection(f, x, epsilon(i), gamma(i),...
        X(i,:), sk(i),flag(i));
end
disp(values);


