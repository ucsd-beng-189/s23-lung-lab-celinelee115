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
PAbar=RT*cAbar;
%
%oxygen partial pressure in the inspired air:
PI=RT*cI;
% 

% Plot partial pressure of oxygen vs. cI
figure();
Pressure = [PAbar;Pabar;Pv];
plot(cI,Pressure,'Linewidth',1.2);
legend Aveolar Arterial Venous;
title('Partial Pressure of Oxygen vs. Inspired');
ylabel('Partial Pressure');
xlabel('cI');
xlim([cI(end) cI(1)]); % Set x limit to first and last value of cI

% Plot concentration of oxygen vs. cI
figure();
Concentration = [cAbar;cabar;cv];
plot(cI,Concentration,'Linewidth',1.2);
legend Aveolar Arterial Venous;
title('Concentration of Oxygen vs. Inspired');
ylabel('Concentration');
xlabel('cI');
xlim([cI(end) cI(1)]);
