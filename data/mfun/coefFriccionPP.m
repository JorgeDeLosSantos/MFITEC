function coefFriccionPP
% Cálculo del coeficiente de fricción de pérdidas primarias en tuberías.
% Ecuación de Colebrook-White
% $ Por: Jorge De Los Santos $ 
% $ Rev 1.0 $
cfondo=[1 1 1];
f=figure('NumberTitle','off','MenuBar','none','Name','MFITEC - Coeficiente de fricción','position',...
    [300 200 200 80],'color',cfondo,'resize','off');
centerfig(f);

uicontrol('style','pushbutton','String','Insertar datos...','position',[40 45 120 25],'fontsize',10,...
    'fontweight','bold','callback',@datos,'BackGroundColor',[0 0 0],'foregroundcolor','w');

uicontrol('style','pushbutton','String','Calcular','position',[60 10 80 25],'fontsize',10,...
    'fontweight','bold','callback',@calcular);

    function calcular(~,~)
        global V D Eps visc
        if any(isnan([Eps,V,D,visc]))
            warndlg('Por favor rellene los campos correspondientes...','MFITEC Error');
        else
            Re=(V*D)/visc;
            eccooleb=@(F) -1/sqrt(F)-2*log10(((Eps/D)/3.7)+(2.51/(Re*sqrt(F))));
            F=fzero(eccooleb,0.1);
            res1=horzcat('Re= ',num2str(Re));
            res2=horzcat('f= ',num2str(F));
            figresultados({res1,res2},1);
        end        
    end

    function datos(~,~)
        global V D Eps visc
        conf.Interpreter='tex';
        txt={'Velocidad (m/s)','Diámetro (mm)','Coeficiente de rugosidad \epsilon (mm)','Viscosidad cinemática (m^2/s)*10^{-6}'};
        nomb='MFITEC-Datos';
        respdef={'10','300','0.17','1.007'};
        resp=inputdlg(txt,nomb,1,respdef,conf);
        V=str2double(resp{1});
        D=str2double(resp{2});
        Eps=str2double(resp{3});
        visc=str2double(resp{4});
    end
end