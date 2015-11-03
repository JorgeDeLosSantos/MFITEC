H=str2double(get(dH,'String'));
eta_h=str2double(get(deta_h,'String'));
D2=str2double(get(dD2,'String'));
b2=str2double(get(db2,'String'));
beta2=str2double(get(dbeta2,'String'))*pi/180;
n=str2double(get(dn,'String'));
Hrext=str2double(get(dHrext,'String'));

%Procedimiento General ---------------------
str=['u2=(pi*D2*n)/60;',...
'Hu=H/eta_h;',...
'c2u=(Hu*g)/u2;',...
'c2m=(u2-c2u)*tan(beta2);',...
'Q=pi*b2*D2*c2m;'];