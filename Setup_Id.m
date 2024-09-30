%% Template file for conducting System identification as a QP problem
%
% Car related Simulink models are assumed to be available
%
%   CarModel_GetData
%   CarModel_TestId
%
%   ID_QPProblem is needed to perform the identification
%
%
% LOOK FOR THE POINTS  'INSERT YOUR CODE HERE'
%

clc;
clear all;
close all;

%% Step 1: Data generation
% Simulation parameters
Tf = 50;         % 'INSERT YOUR CODE HERE'  Simulation / Experiment duration
Ts = 0.5;           % 'INSERT YOUR CODE HERE'  Sampling Time
InputPower = 1;   % 'INSERT YOUR CODE HERE'  Throtle input for Identification
SteadyState = 90;


out=sim('CarModel_GetData',[0 Tf]);

figure;
subplot(211); plot(out.v.time,(90+out.v.data),'r');  hold on;
subplot(211); stem(out.vs.Time,(90+out.vs.Data),'b');
title('Velocity');
legend('Continuous', 'Sampled');
axis([0 Tf 75 1.1*max(90+out.v.data)]);
subplot(212); plot(out.u.time,out.u.data,'k'); hold on;
subplot(212); stem(out.us.Time,out.us.Data,'b');
title('Control');
axis([0 Tf -1.1 1.1]);

%% Step 2: Identify Discrete time model

% 'INSERT YOUR CODE HERE'  Define data parameters for QP based Id function
SysInput = out.us.Data;  % 'INSERT YOUR CODE HERE'  
SysOutput = out.vs.data; % 'INSERT YOUR CODE HERE'  
ModelOrder = 1; % 'INSERT YOUR CODE HERE'  
m = 0; % the number of steps that one looks into the past of the input 

[X, fitness]=ID_QPProblem(ModelOrder, m, SysInput, SysOutput);



% Recover discrete time transfer function model
NumM = X(ModelOrder+1:end)';     % 'INSERT YOUR CODE HERE'  
DenM = [1; X(1:ModelOrder)]';     % 'INSERT YOUR CODE HERE'  
fprintf(' Identified model : ');
printsys(NumM,DenM,'z');

%% Step 3: Test identification and compare model and real process
%
out=sim('CarModel_TestId',[0 Tf]);

figure;
plot(out.v.time,(SteadyState+out.v.data),'r');  hold on;
stairs(out.yM.Time,(SteadyState+out.yM.Data),'b');
title('Velocity');
legend('Continuous Process output', 'Discrete Time model');
axis([0 Tf 75 1.1*max(90+out.v.data)]);

