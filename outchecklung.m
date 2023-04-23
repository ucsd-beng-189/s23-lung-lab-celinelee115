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
%check that partial pressures are in expected order
% if((Pv<Pabar)&(Pabar<=PAbar)&(PAbar<PI))
%   'partial pressures ordered as expected' 
% else
%   'WARNING: partial pressures NOT ordered as expected'
%   Pv
%   Pabar
%   PAbar
%   PI
% end
%
%check that all equations are satisfied
%output a measure of relative residual in each case
%first consider individual-alveolus equations:
% fba= Q.*(ca-cv);
% faa=VA.*(cI-cA);
% check1=max(abs(fba-faa))/max(abs(fba))
% check2=max(abs(PA-Pa))/max(abs(PA))
% check3=max(abs(PA-RT*cA))/max(abs(PA))
% ca_check=cstar*((Pa/Pstar).^3)./(1+(Pa/Pstar).^3);
% check4=max(abs(ca-ca_check))/max(abs(ca))
% %
% %now check that total rate of oxygen transport 
% %matches rate of consumption
% fb=Q' *(ca-cv); %=sum(Q. *(ca-cv))
% fa=VA'*(cI-cA); %=sum(VA.*(cI-cA))
% check5=abs(M-fb)/abs(M)
% check6=abs(M-fa)/abs(M)
%
%plot various results 
%against the ventilation-perfusion ratio, r:
%(plot individual points instead of lines 
%since r values are not in order)
%define vector with all unit entries:
% u=ones(n,1);
% cblood=[cv*u cabar*u ca];
% cair=  [cI*u cAbar*u cA];

% Pressures=[Pv Pabar PAbar PI];
% figure(2)
% subplot(2,1,1),plot(r,cblood,'.')
% subplot(2,1,2),plot(r,cair  ,'.')
% figure(3)

% Based on trial and erros, the maximum M is recorded in vector M_vec,
% with corresponding beta values recorded in beta_vec.
figure();
beta_vec=0:0.1:1;
M_vec=[0.0310 0.0301 0.0297 0.0294 0.0285 0.0263 0.0250 0.0241 0.0221 0.0207 0.0187];
plot(beta_vec,M_vec);
title('Maximum Sustainable Rate of Oxygen Consumption');
xlabel('Beta');
ylabel('M');
