function presat
% Calcula la presión de saturación del agua a una determinada temperatura.
% Las unidades de la temperatura son °C y la presión devuelta está en kPa.
%
% $ Por: Jorge De Los Santos $
% $ Rev. 1.0 $ 13/11/13 $

fondoc=randi([5,10],1,3)/10;
f=figure('MenuBar','None','NumberTitle','off','Name','Presión de saturación',...
    'position',[300 200 200 200],'color',fondoc,'resize','off');
centerfig(f);

uicontrol('Style','text','str','Temperatura ( °C )','position',[50 170 105 20],...
    'backgroundcolor',fondoc,'fontsize',9);
dT=uicontrol('style','edit','str','','position',[50 150 100 20],'fontsize',9,...
    'fontweight','bold');

uicontrol('Style','text','str','Presión de Saturación ( kPa )','position',[10 100 180 20],...
    'backgroundcolor',fondoc,'fontsize',9);
dPsv=uicontrol('style','text','str','','position',[50 80 100 20],'fontsize',10,...
    'fontweight','bold');

uicontrol('style','push','str','Calcular','position',[60 30 80 25],...
    'fontsize',10,'fontweight','bold','callback',@calcular);

helpdlg({'Proporcione la temperatura en el rango [0.01 120]°C',...
    'El resultado está dado en kPa para la Presión de saturación'},...
    'MFITEC');

    function calcular(src,event)
        T=str2double(get(dT,'String'));
        M=[0.01 0.6117; % Matriz T (°C) - P (kPa) (Sat)
           5 0.8725;
           10 1.2281;
           15 1.7057;
           20 2.3392;
           25 3.1698;
           30 4.2469;
           35 5.6291;
           40 7.3851;
           45 9.5953;
           50 12.352;
           55 15.763;
           60 19.947;
           65 25.043;
           70 31.202;
           75 38.597;
           80 47.416;
           85 57.868;
           90 70.183;
           95 84.609;
           100 101.42;
           105 120.9;
           110 143.38;
           115 169.18;
           120 198.67];
       if T>120 || T<0
           set(dPsv,'str','No disponible');
       else
           Psv=interp1(M(:,1),M(:,2),T);
           set(dPsv,'str',num2str(Psv));
       end
    end
end