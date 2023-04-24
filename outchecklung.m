%filename: outchecklung.m
%starting from the value of cv 
%determined by cvsolve, 
%solve for all other unknowns:
%concentrations and partial pressures 
%in the individual alveoli:
for i=1:length(beta)
    %vector of oxygen concentrations in 
    %arterial blood leaving each alveolus:
    ca=carterial(cv_vec(i),r(:,i));
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
    PAbar_vec(i)=PAbar;
    Pabar_vec(i)=Pabar;
    Pv_vec(i)=Pv;
    cAbar_vec(i)=cAbar;
    cabar_vec(i)=cabar;
end

% Plot partial pressure of oxygen vs. cI
Pressure = [PAbar_vec;Pabar_vec;Pv_vec];
plot(beta,Pressure,'Linewidth',1.2);
legend Alveolar Arterial Venous;
title('Partial Pressure of Oxygen vs. Beta at 30,000ft');
ylabel('Partial Pressure');
xlabel('Beta');

% Plot concentration of oxygen vs. cI
Concentration = [cAbar_vec;cabar_vec;cv_vec];
plot(beta,Concentration,'Linewidth',1.2);
legend Alveolar Arterial Venous;
title('Concentration of Oxygen vs. Beta at 30,000ft');
ylabel('Concentration');
xlabel('Beta');
