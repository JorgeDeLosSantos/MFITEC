function b_14(subtipo)
%% Descripción General ------------------------------------------------
% $ Ref. 0 $
% $ Rev 1.0 $ 25/11/13 $

%% Constantes persistentes --------------------------------------------
persistent g rho
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));

%% Características generales ------------------------------------------
cfondo=[0.5 0.8 0.9];
etsize=8;

%% Interfaz -----------------------------------------------------------
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-B','position',[500,300,500,300],'color',cfondo);
centerfig(f);

%% Menú Superior

barraMenuBC(f);

%% Datos de entrada y boton calcular

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 410 270],'backgroundcolor',cfondo);

% 1ra Columna --------------------------------------------------------

ePA=uicontrol(pp,'style','text','String','PA','position',[10 220 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dPA=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
uPA=uicontrol(pp,'style','text','String','kPa','position',[150 220 30 20],'backgroundcolor',cfondo);

ePSV=uicontrol(pp,'style','text','String','PSV','position',[10 180 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dPSV=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
uPSV=uicontrol(pp,'style','text','String','kPa','position',[150 180 30 20],'backgroundcolor',cfondo);

if subtipo<4
    eHra=uicontrol(pp,'style','text','String','Hra','position',[10 140 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dHra=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
    uHra=uicontrol(pp,'style','text','String','m','position',[150 140 30 20],'backgroundcolor',cfondo);
elseif subtipo==4
    ezA=uicontrol(pp,'style','text','String','zA','position',[10 140 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dzA=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
    uzA=uicontrol(pp,'style','text','String','m','position',[150 140 30 20],'backgroundcolor',cfondo);
end

if subtipo==1 | subtipo==3
    eQ=uicontrol(pp,'style','text','String','Q','position',[10 100 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dQ=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
    uQ=uicontrol(pp,'style','text','String','m^3/s','position',[150 100 30 20],'backgroundcolor',cfondo);
elseif subtipo==2 | subtipo==4
    ezE=uicontrol(pp,'style','text','String','zE','position',[10 100 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dzE=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
    uzE=uicontrol(pp,'style','text','String','m','position',[150 100 30 20],'backgroundcolor',cfondo);
end
% 2da Columna  ----------------------------------------------------------
if subtipo==1 | subtipo==3
    eH=uicontrol(pp,'style','text','String','H','position',[210 220 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dH=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
    uH=uicontrol(pp,'style','text','String','m','position',[350 220 30 20],'backgroundcolor',cfondo);
    
    en=uicontrol(pp,'style','text','String','n','position',[210 180 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dn=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
    un=uicontrol(pp,'style','text','String','rpm','position',[350 180 30 20],'backgroundcolor',cfondo);
elseif subtipo==2
    ezA=uicontrol(pp,'style','text','String','zA','position',[210 220 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dzA=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
    uzA=uicontrol(pp,'style','text','String','m','position',[350 220 30 20],'backgroundcolor',cfondo);
end
if subtipo==1
    eNPSH=uicontrol(pp,'style','text','String','NPSH','position',[210 140 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dNPSH=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
    uNPSH=uicontrol(pp,'style','text','String','m','position',[350 140 30 20],'backgroundcolor',cfondo);
elseif subtipo==3
    ezA=uicontrol(pp,'style','text','String','zA','position',[210 140 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dzA=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
    uzA=uicontrol(pp,'style','text','String','m','position',[350 140 30 20],'backgroundcolor',cfondo);
    
    ezE=uicontrol(pp,'style','text','String','zE','position',[210 100 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dzE=uicontrol(pp,'style','edit','String','','position',[250 100 100 20]);
    uzE=uicontrol(pp,'style','text','String','m','position',[350 100 30 20],'backgroundcolor',cfondo);
end

if subtipo==4
    eKa=uicontrol(pp,'style','text','String','Ka','position',[210 220 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dKa=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
    uKa=uicontrol(pp,'style','text','String','','position',[350 220 30 20],'backgroundcolor',cfondo);
    
    eLa=uicontrol(pp,'style','text','String','La','position',[210 180 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dLa=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
    uLa=uicontrol(pp,'style','text','String','m','position',[350 180 30 20],'backgroundcolor',cfondo);
    
    eda=uicontrol(pp,'style','text','String','da','position',[210 140 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dda=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
    uda=uicontrol(pp,'style','text','String','m','position',[350 140 30 20],'backgroundcolor',cfondo);
    
    eEps=uicontrol(pp,'style','text','String','Eps','position',[210 100 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dEps=uicontrol(pp,'style','edit','String','','position',[250 100 100 20]);
    uEps=uicontrol(pp,'style','text','String','mm','position',[350 100 30 20],'backgroundcolor',cfondo);
    
    eQ=uicontrol(pp,'style','text','String','Q','position',[210 60 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dQ=uicontrol(pp,'style','edit','String','','position',[250 60 100 20]);
    uQ=uicontrol(pp,'style','text','String','m^3/s','position',[350 60 30 20],'backgroundcolor',cfondo);
end

% Calcular PB
boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[150 10 80 25],...
    'callback',{@calcular,subtipo},'fontsize',10,'fontweight','bold');


%% Menú Botones
posb=250;

regresar=uicontrol('style','pushbutton','String','','position',[0 posb 35 35],...
    'callback',@gohome,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/inicio.png'));

tvel=uicontrol('style','pushbutton','String','','position',[0 posb-35 35 35],...
    'callback',@gotrian,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/triangulo.png'));

graphs=uicontrol('style','pushbutton','String','','position',[0 posb-2*35 35 35],...
    'callback',{@gographics,subtipo},'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/grafica.png'));

convuni=uicontrol('style','pushbutton','String','','position',[0 posb-3*35 35 35],...
    'callback',@goconv,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/unidades.png'));

tablasb=uicontrol('style','pushbutton','String','','position',[0 posb-4*35 35 35],...
    'callback',@gotablas,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/tabla.png'));

calcu=uicontrol('style','pushbutton','String','','position',[0 posb-5*35 35 35],...
    'callback',@gocalc,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/calculadora.png'));

helping=uicontrol('style','pushbutton','String','','position',[0 posb-6*35 35 35],...
    'callback',@goayuda,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/ayuda.png'));

if subtipo==4
    conf.Interpreter='tex';
    visc=inputdlg({'Viscosidad Cinemática (m^2/s)*10^{-6}'},'Viscosidad Cinemática',1,{'1.007'},conf);
    visc=str2double(visc(1))*10^(-6);
end


%% Funciones  --------------------------------------------------------
    function calcular(~,~,subtipo)
        MV=get(findobj('style','edit'),'String');
        if any(strcmp(MV,'')==1)
            warndlg({'Algunos datos no han sido proporcionados',...
                'Por favor verfique...'},'DATOS INCOMPLETOS');
        else
            PA=str2double(get(dPA,'String'))*10^3;
            PSV=str2double(get(dPSV,'String'))*10^3;
            if subtipo~=4
                Hra=str2double(get(dHra,'String'));
            end
            if subtipo==1
                Q=str2double(get(dQ,'String'));
                H=str2double(get(dH,'String'));
                n=str2double(get(dn,'String'));
                NPSH=str2double(get(dNPSH,'String'));
                
                Hsmax=((PA-PSV)/(rho*g))-Hra-NPSH;
                ns=(3.65*n*Q^(1/2))/(H^(3/4));
                Ccav=NPSH/H;
                P=Q*rho*g*H;
                
                res1=horzcat('Hsmax= ',num2str(Hsmax),' m');
                res2=horzcat('ns= ',num2str(ns),'');
                res3=horzcat('Ccav= ',num2str(Ccav),'');
                res4=horzcat('P= ',num2str(P/10^3),' kW');
                
                figresultados({res1,'',res2,'',res3,'',res4},4);
                
            elseif subtipo==2
                zA=str2double(get(dzA,'String'));
                zE=str2double(get(dzE,'String'));
                
                NPSH=((PA-PSV)/(rho*g))-zE+zA-Hra;
                
                res1=horzcat('NPSH= ',num2str(NPSH),' m');
                
                figresultados(res1,1);
                
            elseif subtipo==3
                Q=str2double(get(dQ,'String'));
                H=str2double(get(dH,'String'));
                n=str2double(get(dn,'String'));
                zE=str2double(get(dzE,'String'));
                zA=str2double(get(dzA,'String'));
                
                NPSH=((PA-PSV)/(rho*g))-zE+zA-Hra;
                Hsmax=((PA-PSV)/(rho*g))-Hra-NPSH;
                ns=(3.65*n*Q^(1/2))/(H^(3/4));
                Ccav=NPSH/H;
                P=Q*rho*g*H;
                
                res1=horzcat('Hsmax= ',num2str(Hsmax),' m');
                res2=horzcat('ns= ',num2str(ns),'');
                res3=horzcat('Ccav= ',num2str(Ccav),'');
                res4=horzcat('P= ',num2str(P/10^3),' kW');
                res5=horzcat('NPSH= ',num2str(NPSH),' m');
                
                figresultados({res1,'',res2,'',res3,'',res4,'',res5},5);
                
            elseif subtipo==4
                Ka=str2double(get(dKa,'String'));
                La=str2double(get(dLa,'String'));
                da=str2double(get(dda,'String'));
                Eps=str2double(get(dEps,'String'))*10^(-3);
                Q=str2double(get(dQ,'String'));
                zE=str2double(get(dzE,'String'));
                zA=str2double(get(dzA,'String'));
                
                va=(4*Q)/(pi*da^2);
                Rea=(va*da)/visc;
                ecooleb=@(Fa) -1/sqrt(Fa)-2*log10(((Eps/da)/3.7)+(2.51/(Rea*sqrt(Fa))));
                Fa=fzero(ecooleb,0.1);
                Hra=(Ka+(Fa*La/da))*(va^2/(2*g));
                NPSH=((PA-PSV)/(rho*g))-zE+zA-Hra;
                
                res1=horzcat('va= ',num2str(va),' m/s');
                res2=horzcat('Hra= ',num2str(Hra),' m');
                res3=horzcat('NPSH= ',num2str(NPSH),' m');
                
                figresultados({res1,'',res2,'',res3},3);
            end
        end
    end

    function gohome(~,~)
        close(gcf);
        run('App_Bombas.m');
    end

    function gotrian(~,~)
        msgbox('Herramienta no disponible','MFITEC','custom',imread('data/imag/herramienta.png'));
    end

    function gographics(~,~,subtipo)
        PA=str2double(get(dPA,'String'))*10^3;
        PSV=str2double(get(dPSV,'String'))*10^3;
        if subtipo~=4
            Hra=str2double(get(dHra,'String'));
        end
        if subtipo==1
            Q=str2double(get(dQ,'String'));
            H=[5:100];
            n=str2double(get(dn,'String'));
            NPSH=str2double(get(dNPSH,'String'));
            
            Hsmax=((PA-PSV)/(rho*g))-Hra-NPSH;
            ns=(3.65*n*Q^(1/2))./(H.^(3/4));
            grafica(H,ns,'H ( m )','n_s','H vs n_s');
            
        elseif subtipo==2
            zA=str2double(get(dzA,'String'));
            zE=str2double(get(dzE,'String'));
            PSV=[1:90]*10^3;
            NPSH=((PA-PSV)/(rho*g))-zE+zA-Hra;
            grafica(PSV/10^3,NPSH,'P_{SV} ( kPa )','NPSH ( m )','P_{SV} vs NPSH');
            
        elseif subtipo==3
            Q=str2double(get(dQ,'String'));
            H=[5:100];
            n=str2double(get(dn,'String'));
            zE=str2double(get(dzE,'String'));
            zA=str2double(get(dzA,'String'));
            
            ns=(3.65*n*Q^(1/2))./(H.^(3/4));
            grafica(H,ns,'H ( m )','n_s','H vs n_s');
            
        elseif subtipo==4
            Ka=str2double(get(dKa,'String'));
            La=str2double(get(dLa,'String'));
            da=str2double(get(dda,'String'));
            Eps=str2double(get(dEps,'String'))*10^(-3);
            Q=[1:300]/10^3;
            zE=str2double(get(dzE,'String'));
            zA=str2double(get(dzA,'String'));
            
            va=(4*Q)/(pi*da^2);
            Rea=(va*da)/visc;
            for i=1:length(Q)
                ecooleb=@(Fa) -1/sqrt(Fa)-2*log10(((Eps/da)/3.7)+(2.51/(Rea(i)*sqrt(Fa))));
                Fa(i)=fzero(ecooleb,0.1);
            end
            Hra=(Ka+(Fa*La/da)).*(va.^2/(2*g));
            NPSH=((PA-PSV)/(rho*g))-zE+zA-Hra;
            grafica(Q*10^3,NPSH,'Q ( l/s )','NPSH ( m )','Q vs NPSH');
        end
%         msgbox('Herramienta no disponible','MFITEC','custom',imread('data/imag/herramienta.png'));
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

end