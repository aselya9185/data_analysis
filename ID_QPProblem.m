%%
% Identification as a QP problem
% Input : order, systemInput, systemOutput
% Output: Model parameters, fitness value
%
%

function [sysParam, fitness]=ID_QPProblem(n, m, SysIn, SysOut)

% The objetive function that is going to be minimized is the norm of the 
% error between prediction and measured value squared.

% Actual values
Y = SysOut(n+1:end);

phi = [];

% Add columns related to the output vector
for i = 1:n
    phi = [phi, SysOut(n-i+1:end-i)];
end

% Add columns related to the input vector
for i = 0:m
    phi = [phi, -SysIn(n-i+1:end-i)];
end

H = 2*phi'*phi;
f = 2*Y'*phi;

[sysParam, fitness] = quadprog(H,f);
end




