% filename: setup_lung.m
%heterogeneity parameter (0<=beta<=1):
%beta=0 for homogenous lung
%beta=1 for no ventilation/perfusion correlation
beta=0.5;
%number of iterations used in bisection:
maxcount=20;
%
%number of ``alveoli'':
n=100;
%
%reference oxygen concentration (moles/liter):
cref=0.2/(22.4*(310/273));
%cref=concentration of oxygen 
%in air at sea level at body temperature
%
mo=[0.2095 0.1604 0.1243 0.0935 0.07 0.0524];
for i=1:6
    %oxygen concentration in the inspired air:
    cI(i)=cref/0.2*mo(i);
    %
    %blood oxygen concentration
    %at full hemoglobin saturation: 
    cstar=0.003;
    %cstar=4*(concentration of hemoglobin 
    %in blood expressed in moles/liter)
    %
    %rate of oxygen consumption (moles/minute):
    M=0.25*cref*5.6;
    %
    %oxygen partial pressure 
    %at which hemoglobin is half-saturated:
    Pstar=25;
    %
    %gas constant*absolute temperature 
    %(mmHg*liters/mole):
    RT=760*22.4*(310/273);
    %
    %oxygen partial pressure 
    %in the inspired air (mmHg):
    PI=RT*cI(i);
    % oxygen concentration
    % in blood exposed directly to inspired air:
    camax(i)=cstar*(PI/Pstar)^3/(1+(PI/Pstar)^3);
    % camax is an upper bound 
    % on oxygen concentration in blood
end
%expected value of total alveolar ventilation:
VAtotal=5.0;     %(liters/minute)
%
%expected value of total perfusion:
Qtotal=5.6;      %(liters/minute)
%
%expected alveolar ventilation per alveolus:
VAbar=VAtotal/n;
%
%expected perfusion per alveolus: 
Qbar=Qtotal/n;

% Generate random vectors for ventilation and perfusion (exponential random variables with a mean of 1)
a1=-log(rand(n,1));
a2=-log(rand(n,1));
av=(a1+a2)/2; % With mean of 1 and distribution like t*exp(-t)

% Varying beta values
VA=VAbar*(a1*beta+av*(1-beta)); % When beta=1, the term av*(1-beta)=0, so VA and Q are independent
Q = Qbar*(a2*beta+av*(1-beta)); % When beta=0, VA and Q are in fixed proportion
r=VA./Q; % Find the r value by getting the ratio between VA and Q
%figure(1)
%plot(Q,VA,'.') % Plot VA vs. Q in a scatterplot

%find actual values of 
%VAtotal, Qtotal, VAbar, and Qbar:
% VAtotal=sum(VA)
% Qtotal =sum(Q)
% VAbar=VAtotal/n
%  Qbar= Qtotal/n
