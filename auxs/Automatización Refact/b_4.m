function b_4(subtipo)
%% Descripción General
% Bombas centrífugas (Tipo 4)
% Consideración de pérdidas en tuberías de aspiración e impulsión
% $ Ref. sub1 1913-193 / sub2 1922 $
% $ Rev. 1.0 $ 12/11/13 $
% 

%% Constantes persistentes
persistent g rho
g=9.81; % Aceleración de la gravedad
rho=struct2array(load('data/mfun/rho.mat'));

%% Características Generales
cfondo=[0.5 0.8 0.9];
etsize=8;

%% Interfaz
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-B','position',[500,300,650,300],'color',cfondo);
centerfig(f);

%% Menú
barraMenuBC(f);

%% Datos de entrada y boton calcular

% Paneles -----------------------------------
pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 570 280],'backgroundcolor',cfondo);
pasp=uipanel(pp,'title','Aspiración','units','pixels','position',[180 80 180 180],'backgroundcolor',cfondo);
pimp=uipanel(pp,'title','Impulsión','units','pixels','position',[365 80 180 180],'backgroundcolor',cfondo);


eQ=uicontrol(pp,'style','text','String','Q','position',[10 220 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dQ=uicontrol(pp,'style','edit','String','','position',[50 220 80 20]);
uQ=uicontrol(pp,'style','text','String','m^3/s','position',[130 220 30 20],'backgroundcolor',cfondo);

eeta=uicontrol(pp,'style','text','String','eta','position',[10 180 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
deta=uicontrol(pp,'style','edit','String','','position',[50 180 80 20]);
ueta=uicontrol(pp,'style','text','String','','position',[130 180 30 20],'backgroundcolor',cfondo);

eEps=uicontrol(pp,'style','text','String','Eps','position',[10 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dEps=uicontrol(pp,'style','edit','String','','position',[50 140 80 20]);
uEps=uicontrol(pp,'style','text','String','mm','position',[130 140 30 20],'backgroundcolor',cfondo);

evisc=uicontrol(pp,'style','text','String','Viscosidad cinemática','position',[20 60 150 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dvisc=uicontrol(pp,'style','edit','String','','position',[20 30 80 20]);
uvisc=uicontrol(pp,'style','text','String',' m^2/s*(10^-6)','position',[100 30 70 20],'backgroundcolor',cfondo,'fontsize',8);

% Aspiración ----------------------------------------

ezA=uicontrol(pasp,'style','text','String','zA','position',[10 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dzA=uicontrol(pasp,'style','edit','String','','position',[50 140 80 20]);
uzA=uicontrol(pasp,'style','text','String','m','position',[130 140 30 20],'backgroundcolor',cfondo);

eda=uicontrol(pasp,'style','text','String','da','position',[10 100 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dda=uicontrol(pasp,'style','edit','String','','position',[50 100 80 20]);
uda=uicontrol(pasp,'style','text','String','m','position',[130 100 30 20],'backgroundcolor',cfondo);

eLa=uicontrol(pasp,'style','text','String','La','position',[10 60 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dLa=uicontrol(pasp,'style','edit','String','','position',[50 60 80 20]);
uLa=uicontrol(pasp,'style','text','String','m','position',[130 60 30 20],'backgroundcolor',cfondo);

if subtipo==1
    eKa=uicontrol(pasp,'style','text','String','Ka','position',[10 20 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dKa=uicontrol(pasp,'style','edit','String','','position',[50 20 80 20]);
    uKa=uicontrol(pasp,'style','text','String','','position',[130 20 30 20],'backgroundcolor',cfondo);
end

% Impulsión  ---------------------------------------
ezZ=uicontrol(pimp,'style','text','String','zZ','position',[10 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dzZ=uicontrol(pimp,'style','edit','String','','position',[50 140 80 20]);
uzZ=uicontrol(pimp,'style','text','String','m','position',[130 140 30 20],'backgroundcolor',cfondo);

edi=uicontrol(pimp,'style','text','String','di','position',[10 100 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
ddi=uicontrol(pimp,'style','edit','String','','position',[50 100 80 20]);
udi=uicontrol(pimp,'style','text','String','m','position',[130 100 30 20],'backgroundcolor',cfondo);

eLi=uicontrol(pimp,'style','text','String','Li','position',[10 60 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dLi=uicontrol(pimp,'style','edit','String','','position',[50 60 80 20]);
uLi=uicontrol(pimp,'style','text','String','m','position',[130 60 30 20],'backgroundcolor',cfondo);

if subtipo==1
    eKi=uicontrol(pimp,'style','text','String','Ki','position',[10 20 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dKi=uicontrol(pimp,'style','edit','String','','position',[50 20 80 20]);
    uKi=uicontrol(pimp,'style','text','String','','position',[130 20 30 20],'backgroundcolor',cfondo);
end

% Calcular PB ------------------------------------------------------------
uicontrol(pp,'style','pushbutton','String','Calcular','position',[320 20 80 25],...
    'callback',{@calcular,subtipo},'fontsize',10,'fontweight','bold');


%% Menú Botones
posb=250;

uicontrol('style','pushbutton','String','','position',[0 posb 35 35],...
    'callback',@gohome,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/inicio.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-35 35 35],...
    'callback',@gographics,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/grafica.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-2*35 35 35],...
    'callback',@goconv,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/unidades.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-3*35 35 35],...
    'callback',@gotablas,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/tabla.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-4*35 35 35],...
    'callback',@gocalc,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/calculadora.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-5*35 35 35],...
    'callback',@goayuda,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/ayuda.png'));


%% Funcion calcular principal
    function calcular(~,~,subtipo)
        MV=get(findobj('style','edit'),'String');
        if any(strcmp(MV,'')==1)
            warndlg({'Algunos datos no han sido proporcionados',...
                'Por favor verfique...'},'DATOS INCOMPLETOS');
        else
            Q=str2double(get(dQ,'String'));
            eta=str2double(get(deta,'String'));
            zZ=str2double(get(dzZ,'String'));
            zA=str2double(get(dzA,'String'));
            da=str2double(get(dda,'String'));
            di=str2double(get(ddi,'String'));
            La=str2double(get(dLa,'String'));
            Li=str2double(get(dLi,'String'));
            visc=str2double(get(dvisc,'String'))*10^(-6);
            Eps=str2double(get(dEps,'String'))*10^(-3); % En mm
            
            if subtipo==1
                Ka=str2double(get(dKa,'String'));
                Ki=str2double(get(dKi,'String'));
                va=(4*Q)/(pi*da^2);
                vi=(4*Q)/(pi*di^2);
                
                Rea=(va*da)/(visc);
                ecooleb=@(Fa) -1/sqrt(Fa)-2*log10(((Eps/da)/3.7)+(2.51/(Rea*sqrt(Fa))));
                Fa=fzero(ecooleb,0.1);
                Hra=(Ka+(Fa*La/da))*(va^2/(2*g));
                
                Rei=(vi*di)/(visc);
                ecooleb=@(Fi) -1/sqrt(Fi)-2*log10(((Eps/di)/3.7)+(2.51/(Rei*sqrt(Fi))));
                Fi=fzero(ecooleb,0.1);
                Hri=(Ki+(Fi*Li/di))*(vi^2/(2*g));
                
                H=zZ-zA+Hra+Hri+(vi^2/(2*g));
                Pa=(Q*rho*g*H)/eta;
                
                res1=horzcat('Hra= ',num2str(Hra),' m');
                res2=horzcat('Hri= ',num2str(Hri),' m');
                res3=horzcat('va= ',num2str(va),' m/s');
                res4=horzcat('vi= ',num2str(vi),' m/s');
                res5=horzcat('H= ',num2str(H),' m');
                res6=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                
                figresultados({res1,'',res2,'',res3,'',res4,'',res5,'',res6},7);
            else
                va=(4*Q)/(pi*da^2);
                vi=(4*Q)/(pi*di^2);
                
                Rea=(va*da)/(visc);
                ecooleb=@(Fa) -1/sqrt(Fa)-2*log10(((Eps/da)/3.7)+(2.51/(Rea*sqrt(Fa))));
                Fa=fzero(ecooleb,0.1);
                Hra=((Fa*La/da))*(va^2/(2*g));
                
                Rei=(vi*di)/(visc);
                ecooleb=@(Fi) -1/sqrt(Fi)-2*log10(((Eps/di)/3.7)+(2.51/(Rei*sqrt(Fi))));
                Fi=fzero(ecooleb,0.1);
                Hri=((Fi*Li/di))*(vi^2/(2*g));
                
                H=zZ-zA+Hra+Hri+(vi^2/(2*g));
                Pa=(Q*rho*g*H)/eta;
                
                res1=horzcat('H= ',num2str(H),' m');
                res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                
                figresultados({res1,'',res2},2);
            end
        end
    end


%% Funciones Menú de Botones -------------------------------------------
    function gohome(~,~)
        close(gcf);
        run('App_Bombas.m');
    end

    function gographics(~,~)
        msgbox('Herramienta no disponible','MFITEC','custom',imread('data/imag/herramienta.png'));
    end

    function goconv(~,~)
        winopen('data/mfun/convert.exe');
    end

    function gotablas(~,~)
        winopen('data/docs/Tablas.pdf');
    end

    function gocalc(~,~)
        winopen('data/mfun/calc.exe');
    end

    function goayuda(~,~)
        winopen('data/docs/Ayuda.pdf');
    end


end   winopen('data/docs/Ayuda.pdf');
    end


end