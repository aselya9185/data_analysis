%% Template file for conducting the Model Predictive Control as a QP problem
%
% Car related Simulink models are assumed to be available
%
%   CarModel_MPCCtrl
%
%   Car model is assumed to be available as the following Discrete Time 
% transfer function
%   
% H(z) = NumM / DenM
%

clc;
close all;
%% Optimal control problem parameters
%

Ts = 4;         % Sampling time
H_p = 10;       % Prediction Horizon 
u_max=1;      % Max value for manipulated variable 
                %   (saturation constraint)
du_max=1;     % Max value for manipulated variable deviation 
                %   (Saturation on the instant control change constraint)

g=NumM(1);
a=-DenM(2);

Tf=1000;
out=sim('CarModel_MPCCtrl',[0 Tf]);

subplot(211); plot(out.vr.Time,(90+out.vr.data),'k'); hold on
subplot(211); plot(out.v.Time,(90+out.v.data),'r'); 
title('Velocity');
legend('Ref. Speed', 'Real Speed');
axis([0 Tf 75 1.1*max(90+out.v.data)]);

subplot(212); stairs(out.us.Time,out.us.Data,'b');
title('Throttle');
axis([0 Tf -1.1 1.1]);

fprintf(' Speed tracking evaluation %.2f \n',out.Eval_Tracking.Data(length(out.Eval_Tracking.Data)));
fprintf(' Throttle Usage            %.2f \n',out.Eval_Control.Data(length(out.Eval_Control.Data)));

