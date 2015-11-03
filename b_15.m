function b_15(subtipo)
% Bombas centrífugas (Tipo 15)
% $ Ref. 0 $
% $ Rev. 1.1 $ 08/12/12 $


%% Constantes persistentes --------------------------------------------
persistent g rho
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));

%% Características generales ------------------------------------------
cfondo=[0.5 0.8 0.9];
etsize=8;

%% Interfaz -----------------------------------------------------------
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-B','position',[500,300,300,300],'color',cfondo);
centerfig(f);

%% Menú Superior

barraMenuBC(f);

%% Datos de entrada y boton calcular

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 200 270],'backgroundcolor',cfondo);

% 1ra Columna --------------------------------------------------------
if subtipo<6
    ens=uicontrol(pp,'style','text','String','ns','position',[10 220 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dns=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
    uns=uicontrol(pp,'style','text','String','','position',[150 220 30 20],'backgroundcolor',cfondo);
else
    en=uicontrol(pp,'style','text','String','n','position',[10 220 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dn=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
    un=uicontrol(pp,'style','text','String','rpm','position',[150 220 30 20],'backgroundcolor',cfondo);
end

if subtipo==1 | subtipo==2 | subtipo==6
    eQ=uicontrol(pp,'style','text','String','Q','position',[10 180 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dQ=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
    uQ=uicontrol(pp,'style','text','String','m^3/s','position',[150 180 30 20],'backgroundcolor',cfondo);
elseif subtipo==3
    eH=uicontrol(pp,'style','text','String','H','position',[10 180 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dH=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
    uH=uicontrol(pp,'style','text','String','m','position',[150 180 30 20],'backgroundcolor',cfondo);
elseif subtipo==4 | subtipo==5 | subtipo==7
    eP=uicontrol(pp,'style','text','String','P','position',[10 180 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dP=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
    uP=uicontrol(pp,'style','text','String','kW','position',[150 180 30 20],'backgroundcolor',cfondo);
end

if subtipo==1 | subtipo==5 | subtipo==6 | subtipo==7
    eH=uicontrol(pp,'style','text','String','H','position',[10 140 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dH=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
    uH=uicontrol(pp,'style','text','String','m','position',[150 140 30 20],'backgroundcolor',cfondo);
elseif subtipo==2 | subtipo==3 | subtipo==4
    en=uicontrol(pp,'style','text','String','n','position',[10 140 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dn=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
    un=uicontrol(pp,'style','text','String','rpm','position',[150 140 30 20],'backgroundcolor',cfondo);
end

% Calcular PB
boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[60 10 80 25],...
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


%% Funciones  --------------------------------------------------------
    function calcular(~,~,subtipo)
        MV=get(findobj('style','edit'),'String');
        if any(strcmp(MV,'')==1)
            warndlg({'Algunos datos no han sido proporcionados',...
                'Por favor verfique...'},'DATOS INCOMPLETOS');
        else
            if subtipo<6
                ns=str2double(get(dns,'String'));
            else
                n=str2double(get(dn,'String'));
            end
            
            if subtipo==1
                Q=str2double(get(dQ,'String'));
                H=str2double(get(dH,'String'));
                
                n=(ns*H^(3/4))/(3.65*Q^(1/2));
                P=Q*rho*g*H;
                
                res1=horzcat('n= ',num2str(round(n)),' rpm');
                res2=horzcat('P= ',num2str(P/10^3),' kW');
                
                figresultados({res1,'',res2},2);
                
            elseif subtipo==2
                Q=str2double(get(dQ,'String'));
                n=str2double(get(dn,'String'));
                
                H=((3.65*n*Q^(1/2))/(ns))^(4/3);
                P=Q*rho*g*H;
                
                res1=horzcat('H= ',num2str(H),' m');
                res2=horzcat('P= ',num2str(P/10^3),' kW');
                
                figresultados({res1,'',res2},2);
                
            elseif subtipo==3
                n=str2double(get(dn,'String'));
                H=str2double(get(dH,'String'));
                
                Q=((ns*H^(3/4))/(3.65*n))^2;
                P=Q*rho*g*H;
                
                res1=horzcat('Q= ',num2str(Q*10^3),' l/s');
                res2=horzcat('P= ',num2str(P/10^3),' kW');
                
                figresultados({res1,'',res2},2);
                
            elseif subtipo==4
                P=str2double(get(dP,'String'))*10^3;
                n=str2double(get(dn,'String'));

                P=P/735.499;
                H=((n*P^(1/2))/(ns))^(4/5);
                Q=((ns*H^(3/4))/(3.65*n))^2;
                
                res1=horzcat('H= ',num2str(H),' m');
                res2=horzcat('Q= ',num2str(Q*10^3),' l/s');
                
                figresultados({res1,'',res2},2);
                
            elseif subtipo==5
                P=str2double(get(dP,'String'))*10^3;
                H=str2double(get(dH,'String'));
                
                P=P/735.499;
                n=(ns*H^(5/4))/(P^(1/2));
                Q=((ns*H^(3/4))/(3.65*n))^2;
                
                res1=horzcat('n= ',num2str(round(n)),' rpm');
                res2=horzcat('Q= ',num2str(Q*10^3),' l/s');
                
                figresultados({res1,'',res2},2);
            
            elseif subtipo==6
                Q=str2double(get(dQ,'String'));
                H=str2double(get(dH,'String'));
                
                ns=3.65*(n*Q^(1/2))/(H^(3/4));
                P=Q*rho*g*H;
                
                res1=horzcat('ns= ',num2str(round(ns)),'');
                res2=horzcat('P= ',num2str(P/10^3),' kW');
                
                figresultados({res1,'',res2},2);
                
            elseif subtipo==7
                P=str2double(get(dP,'String'))*10^3;
                H=str2double(get(dH,'String'));
                
                P=P/735.499; % To CV
                ns=(n*P^(1/2))/(H^(5/4));
                Q=((ns*H^(3/4))/(3.65*n))^2;
                
                res1=horzcat('ns= ',num2str(round(ns)),'');
                res2=horzcat('Q= ',num2str(Q*10^3),' l/s');
                
                figresultados({res1,'',res2},2);
                
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
        if subtipo<6
            ns=str2double(get(dns,'String'));
        else
            n=str2double(get(dn,'String'));
        end
        
        if subtipo==1
            ns=insertRango('ns','30:1000');
            Q=str2double(get(dQ,'String'));
            H=str2double(get(dH,'String'));
            
            n=(ns.*H^(3/4))./(3.65*Q^(1/2));
            P=Q*rho*g*H;
            grafica(ns,n,'n_s','n ( rpm )','n_s vs n');
            
        elseif subtipo==2
            ns=insertRango('ns','30:1000');
            Q=str2double(get(dQ,'String'));
            n=str2double(get(dn,'String'));
            
            H=((3.65*n*Q^(1/2))./(ns)).^(4/3);
            P=Q*rho*g*H;
            grafica(ns,P/10^3,'n_s',' P ( kW )','n_s vs P');

        elseif subtipo==3
            ns=insertRango('ns','30:1000');
            n=str2double(get(dn,'String'));
            H=str2double(get(dH,'String'));
            
            Q=((ns*H^(3/4))/(3.65*n)).^2;
            P=Q*rho*g*H;
            grafica(ns,P/10^3,'n_s',' P ( kW )','n_s vs P');
            
        elseif subtipo==4
            ns=insertRango('ns','30:1000');
            P=str2double(get(dP,'String'))*10^3;
            n=str2double(get(dn,'String'));
            
            P=P/735.499;
            H=((n*P^(1/2))./(ns)).^(4/5);
            
            grafica(ns,H,'n_s','H ( m )','n_s vs H');
            
        elseif subtipo==5
            ns=insertRango('ns','30:1000');
            P=str2double(get(dP,'String'))*10^3;
            H=str2double(get(dH,'String'));
            
            P=P/735.499;
            n=(ns*H^(5/4))/(P^(1/2));
            Q=((ns*H^(3/4))/(3.65*n)).^2;
            grafica(ns,n,'n_s','n ( rpm )','n_s vs n');
            
        elseif subtipo==6
            H=insertRango('H ( m )','1:100');
            Q=str2double(get(dQ,'String'));
            
            ns=3.65*(n*Q^(1/2))./(H.^(3/4));
            P=Q*rho*g*H;
            grafica(H,ns,'H ( m )','n_s','H vs n_s');
            
        elseif subtipo==7
            H=insertRango('H ( m )','1:100');
            P=str2double(get(dP,'String'))*10^3;
            
            P=P/735.499; % To CV
            ns=(n*P^(1/2))./(H.^(5/4));
            grafica(H,ns,'H ( m )','n_s','H vs n_s');
            
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