%filename: outchecklung.m
%starting from the value of cv 
%determined by cvsolve, 
%solve for all other unknowns:
%concentrations and partial pressures 
%in the individual alveoli:
%vector of oxygen concentrations in 
%arterial blood leaving each alveolus:
ca=carterial(cv,r);
%
%vector of oxygen partial pressures
%in arterial blood leaving each alveolus:
Pa=H(ca);
%
%vector of oxygen partial pressures 
%in alveolar air:
PA=Pa;
%
%vector of oxygen concentrations
%in alveolar air:
cA=PA/RT;
%
%concentrations and partial pressures 
%for the whole organism:
%(write out these results)
%oxygen concentration in (systemic) venous blood:
cv;
%
%mean arterial oxygen concentration:
cabar=Q' *ca/sum(Q);
%  
%mean alveolar oxygen concentration:
cAbar=VA'*cA/sum(VA);
%
%oxygen concentration is the inspired air:
cI;
%
%oxygen partial pressure in venous blood:
Pv=H(cv);
%
%mean arterial oxygen partial pressure:
Pabar=H(cabar);
%
%mean alveolar oxygen partial pressure:
PAbar=RT.*cAbar;
%
%oxygen partial pressure in the inspired air:
PI=RT.*cI;
% 

% Get vector of altitude
altitude=[0 5000 10000 15000 20000 25000];

% Plot partial pressure of oxygen vs. cI
Pressure = [PAbar;Pabar;Pv];
plot(altitude,Pressure,'Linewidth',1.2);
legend Aveolar Arterial Venous;
title('Partial Pressure of Oxygen vs. Altitude Above Sea Level');
ylabel('Partial Pressure');
xlabel('Altitude (feet)');

% Plot concentration of oxygen vs. cI
Concentration = [cAbar;cabar;cv];
plot(altitude,Concentration,'Linewidth',1.2);
legend Aveolar Arterial Venous;
title('Concentration of Oxygen vs. Altitude Above Sea Level');
ylabel('Concentration');
xlabel('Altitude (feet)');
