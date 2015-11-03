function ta_2(subtipo)
% REF 221
% @ DLS
% Mod 11/11/13

%% Constantes persistentes
persistent g rho
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));
%% Características generales
cfondo=[0.5 0.8 0.7];
etsize=8;
%% Interfaz
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-TA','position',[500,300,300,300],'color',cfondo);
centerfig(f);

%% Menú
barraMenuTA(f);

%% Datos de entrada y boton calcular

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 200 270],'backgroundcolor',cfondo);

% 1ra col  --------------------------------------------------------

ed=uicontrol(pp,'style','text','String','d','position',[10 220 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dd=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
ud=uicontrol(pp,'style','text','String','m','position',[150 220 30 20],'backgroundcolor',cfondo);

if subtipo==2 | subtipo==3 | subtipo==4
    eD=uicontrol(pp,'style','text','String','D','position',[10 185 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dD=uicontrol(pp,'style','edit','String','','position',[50 185 100 20]);
    uD=uicontrol(pp,'style','text','String','m','position',[150 185 30 20],'backgroundcolor',cfondo);
    
    ec1=uicontrol(pp,'style','text','String','c1','position',[10 150 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dc1=uicontrol(pp,'style','edit','String','','position',[50 150 100 20]);
    uc1=uicontrol(pp,'style','text','String','m/s','position',[150 150 30 20],'backgroundcolor',cfondo);
elseif subtipo==1
    ec1=uicontrol(pp,'style','text','String','c1','position',[10 185 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dc1=uicontrol(pp,'style','edit','String','','position',[50 185 100 20]);
    uc1=uicontrol(pp,'style','text','String','m/s','position',[150 185 30 20],'backgroundcolor',cfondo);
    
    eu=uicontrol(pp,'style','text','String','u','position',[10 150 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    du=uicontrol(pp,'style','edit','String','','position',[50 150 100 20]);
    uu=uicontrol(pp,'style','text','String','m/s','position',[150 150 30 20],'backgroundcolor',cfondo);
    
    ebeta2=uicontrol(pp,'style','text','String','beta2','position',[10 115 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dbeta2=uicontrol(pp,'style','edit','String','','position',[50 115 100 20]);
    ubeta2=uicontrol(pp,'style','text','String','°','position',[150 115 30 20],'backgroundcolor',cfondo);
end

if subtipo==2 | subtipo==3
    eu=uicontrol(pp,'style','text','String','u','position',[10 115 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    du=uicontrol(pp,'style','edit','String','','position',[50 115 100 20]);
    uu=uicontrol(pp,'style','text','String','m/s','position',[150 115 30 20],'backgroundcolor',cfondo);
elseif subtipo==4
    eeta=uicontrol(pp,'style','text','String','eta','position',[10 115 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    deta=uicontrol(pp,'style','edit','String','','position',[50 115 100 20]);
    ueta=uicontrol(pp,'style','text','String','','position',[150 115 30 20],'backgroundcolor',cfondo);
end

if subtipo==2
    ebeta2=uicontrol(pp,'style','text','String','beta2','position',[10 80 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dbeta2=uicontrol(pp,'style','edit','String','','position',[50 80 100 20]);
    ubeta2=uicontrol(pp,'style','text','String','°','position',[150 80 30 20],'backgroundcolor',cfondo);
elseif subtipo==3
    eeta_h=uicontrol(pp,'style','text','String','eta_h','position',[10 80 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    deta_h=uicontrol(pp,'style','edit','String','','position',[50 80 100 20]);
    ueta_h=uicontrol(pp,'style','text','String','','position',[150 80 30 20],'backgroundcolor',cfondo);
end
% 2da Col


% Calcular PB
boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[60 20 80 25],...
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


%% Funciones
    function calcular(~,~,subtipo)
        MV=get(findobj('style','edit'),'String');
        if any(strcmp(MV,'')==1)
            warndlg({'Algunos datos no han sido proporcionados',...
                'Por favor verfique...'},'DATOS INCOMPLETOS');
        else
            d=str2double(get(dd,'String'));
            
            if subtipo==1
                c1=str2double(get(dc1,'String'));
                u=str2double(get(du,'String'));
                beta2=str2double(get(dbeta2,'String'))*pi/180;
                
                Q=(pi*d^2*c1)/4;
                w1=c1-u;
                w1u=w1;
                w2=w1;
                w2u=-w2*cos(beta2);
                F=Q*rho*(w1u-w2u);
                Pi=F*u;
                c1u=c1;
                c2u=u-w2*cos(beta2);
                Hu=(u*(c1u-c2u))/g;
                
                res1=horzcat('Q= ',num2str(Q*10^3),' l/s');
                res2=horzcat('Hu= ',num2str(Hu),' m');
                res3=horzcat('Pi= ',num2str(Pi/10^3),' kW');
                res4=horzcat('F= ',num2str(F),' N');
                
                figresultados({res1,'',res2,'',res3,'',res4},4);
                
            elseif subtipo==2
                D=str2double(get(dD,'String'));
                c1=str2double(get(dc1,'String'));
                u=str2double(get(du,'String'));
                beta2=str2double(get(dbeta2,'String'))*pi/180;
                
                Q=(pi*d^2*c1)/4;
                w1=c1-u;
                w1u=w1;
                w2=w1;
                w2u=-w2*cos(beta2);
                F=Q*rho*(w1u-w2u);
                Pi=F*u;
                c1u=c1;
                c2u=u-w2*cos(beta2);
                Hu=(u*(c1u-c2u))/g;
                n=(60*u)/(pi*D);
                
                res1=horzcat('Q= ',num2str(Q*10^3),' l/s');
                res2=horzcat('Hu= ',num2str(Hu),' m');
                res3=horzcat('Pi= ',num2str(Pi/10^3),' kW');
                res4=horzcat('F= ',num2str(F),' N');
                res5=horzcat('n= ',num2str(round(n)),' rpm');
                
                figresultados({res1,'',res2,'',res3,'',res4,'',res5},5);
                
            elseif subtipo==3
                D=str2double(get(dD,'String'));
                c1=str2double(get(dc1,'String'));
                u=str2double(get(du,'String'));
                eta_h=str2double(get(deta_h,'String'));
                
                H=c1^2/(2*g);
                Q=(pi*d^2*c1)/4;
                eta=eta_h;
                Pa=Q*rho*g*H*eta;
                n=(60*u)/(pi*D);
                M=(Pa*D)/(2*u);
                
                res1=horzcat('Q= ',num2str(Q*10^3),' l/s');
                res2=horzcat('H= ',num2str(H),' m');
                res3=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                res4=horzcat('n= ',num2str(round(n)),' rpm');
                res5=horzcat('M= ',num2str(M),' N*m');
                
                figresultados({res1,'',res2,'',res3,'',res4,'',res5},5);
                
            elseif subtipo==4
                D=str2double(get(dD,'String'));
                c1=str2double(get(dc1,'String'));
                eta=str2double(get(deta,'String'));
                
                H=c1^2/(2*g);
                Q=(pi*d^2*c1)/4;
                Pa=Q*rho*g*H*eta;
                
                res1=horzcat('Q= ',num2str(Q*10^3),' l/s');
                res2=horzcat('H= ',num2str(H),' m');
                res3=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                
                figresultados({res1,'',res2,'',res3},3);
            end
        end
        
    end

    function gohome(~,~)
        close(gcf);
        run('App_Turbinas_A.m');
    end

    function gotrian(~,~)
        msgbox('Herramienta no disponible','MFITEC','custom',imread('data/imag/herramienta.png'));
    end

    function gographics(~,~,subtipo)
        d=str2double(get(dd,'String'));
        if subtipo==1
            c1=str2double(get(dc1,'String'));
            u=str2double(get(du,'String'));
            beta2=insertRango('beta2 (°)','1:85')*pi/180;
            Q=(pi*d^2*c1)/4;
            w1=c1-u;
            w1u=w1;
            w2=w1;
            w2u=-w2*cos(beta2);
            F=Q*rho*(w1u-w2u);
            Pi=F*u;
            c1u=c1;
            c2u=u-w2*cos(beta2);
            Hu=(u*(c1u-c2u))/g;
            grafica(beta2*180/pi,Hu,'\beta_2 ( ° )','H_u ( m )','\beta_2 vs H_u');
            
        elseif subtipo==2
            D=str2double(get(dD,'String'));
            c1=str2double(get(dc1,'String'));
            u=str2double(get(du,'String'));
            beta2=insertRango('beta2 (°)','1:85')*pi/180;
            
            Q=(pi*d^2*c1)/4;
            w1=c1-u;
            w1u=w1;
            w2=w1;
            w2u=-w2*cos(beta2);
            F=Q*rho*(w1u-w2u);
            Pi=F*u;
            c1u=c1;
            c2u=u-w2*cos(beta2);
            Hu=(u*(c1u-c2u))/g;
            n=(60*u)/(pi*D);
            grafica(beta2*180/pi,Pi/10^3,'\beta_2 ( ° )','Pi (kW)','\beta_2 vs P_i');
            
        elseif subtipo==3
            D=str2double(get(dD,'String'));
            c1=insertRango('c1 (m/s)','1:100');
            u=str2double(get(du,'String'));
            eta_h=str2double(get(deta_h,'String'));
            
            H=c1.^2/(2*g);
            Q=(pi*d^2*c1)/4;
            eta=eta_h;
            Pa=Q*rho*g.*H*eta;
            n=(60*u)/(pi*D);
            M=(Pa*D)/(2*u);
            grafica(c1,Pa/10^3,'c_1 ( m/s )','P_a ( kW )','c_1 vs P_a');
            
        elseif subtipo==4
            D=str2double(get(dD,'String'));
            c1=insertRango('c1 (m/s)','1:100');
            eta=str2double(get(deta,'String'));
            
            H=c1.^2/(2*g);
            Q=(pi*d^2*c1)/4;
            Pa=Q.*rho*g.*H*eta;
            grafica(c1,Pa/10^3,'c_1 ( m/s )','P_a ( kW )','c_1 vs P_a');
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