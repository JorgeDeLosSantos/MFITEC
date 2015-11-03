function ta_5(subtipo)
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
    ,'Name','MFITEC-TA','position',[500,300,500,300],'color',cfondo);

%% Menú
barraMenuTA(f);

%% Datos de entrada y boton calcular

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 410 270],'backgroundcolor',cfondo);

% 1ra col  --------------------------------------------------------

eKu=uicontrol(pp,'style','text','String','Ku','position',[10 220 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dKu=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
uKu=uicontrol(pp,'style','text','String','','position',[150 220 30 20],'backgroundcolor',cfondo);

eKc=uicontrol(pp,'style','text','String','Kc','position',[10 180 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dKc=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
uKc=uicontrol(pp,'style','text','String','','position',[150 180 30 20],'backgroundcolor',cfondo);

ePa=uicontrol(pp,'style','text','String','Pa','position',[10 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dPa=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
uPa=uicontrol(pp,'style','text','String','kW','position',[150 140 30 20],'backgroundcolor',cfondo);

eH=uicontrol(pp,'style','text','String','H','position',[10 100 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dH=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
uH=uicontrol(pp,'style','text','String','m','position',[150 100 30 20],'backgroundcolor',cfondo);

% 2da Col -----------------------------------------------------------

eeta=uicontrol(pp,'style','text','String','eta','position',[210 220 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
deta=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
ueta=uicontrol(pp,'style','text','String','','position',[350 220 30 20],'backgroundcolor',cfondo);

if subtipo==2
    en=uicontrol(pp,'style','text','String','n','position',[210 180 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dn=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
    un=uicontrol(pp,'style','text','String','rpm','position',[350 180 30 20],'backgroundcolor',cfondo);
    
    evE=uicontrol(pp,'style','text','String','vE','position',[210 140 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dvE=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
    uvE=uicontrol(pp,'style','text','String','m/s','position',[350 140 30 20],'backgroundcolor',cfondo);
elseif subtipo==1
    eD=uicontrol(pp,'style','text','String','D','position',[210 180 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dD=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
    uD=uicontrol(pp,'style','text','String','m','position',[350 180 30 20],'backgroundcolor',cfondo);
end

% Calcular PB
boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[150 20 80 25],...
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
            Ku=str2double(get(dKu,'String'));
            Kc=str2double(get(dKc,'String'));
            Pa=str2double(get(dPa,'String'))*10^3;
            H=str2double(get(dH,'String'));
            eta=str2double(get(deta,'String'));
            
            if subtipo==1
                D=str2double(get(dD,'String'));
                
                c1=Kc*sqrt(2*g*H);
                Q=Pa/(rho*g*H*eta);
                d=sqrt((4*Q)/(pi*c1));
                u=Ku*sqrt(2*g*H);
                n=(60*u)/(pi*D);
                
                res1=horzcat('c1= ',num2str(c1),' m/s');
                res2=horzcat('Q= ',num2str(Q*10^3),' l/s');
                res3=horzcat('d= ',num2str(d),' m');
                res4=horzcat('u= ',num2str(u),' m/s');
                res5=horzcat('n= ',num2str(n),' rpm');
                
                figresultados({res1,'',res2,'',res3,'',res4,'',res5},5);
                
            elseif subtipo==2
                n=str2double(get(dn,'String'));
                vE=str2double(get(dvE,'String'));
                
                c1=Kc*sqrt(2*g*H);
                Q=Pa/(rho*g*H*eta);
                d=sqrt((4*Q)/(pi*c1));
                u=Ku*sqrt(2*g*H);
                D=(60*u)/(pi*n);
                PE=rho*g*(H-(vE^2/(2*g)));
                
                res1=horzcat('c1= ',num2str(c1),' m/s');
                res2=horzcat('Q= ',num2str(Q*10^3),' l/s');
                res3=horzcat('d= ',num2str(d),' m');
                res4=horzcat('u= ',num2str(u),' m/s');
                res5=horzcat('D= ',num2str(D),' m');
                res6=horzcat('PE= ',num2str(PE/10^3),' kPa');
                
                figresultados({res1,'',res2,'',res3,'',res4,'',res5,'',res6},6);
                
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
        Ku=str2double(get(dKu,'String'));
        Kc=str2double(get(dKc,'String'));
        Pa=str2double(get(dPa,'String'))*10^3;
        H=[5:2:200];
        eta=str2double(get(deta,'String'));
        
        if subtipo==1
            D=str2double(get(dD,'String'));
            
            c1=Kc*sqrt(2*g*H);
            grafica(H,c1,'H ( m )','c_1 ( m/s )','H vs c1');
            
        elseif subtipo==2
            n=str2double(get(dn,'String'));
            vE=str2double(get(dvE,'String'));
            
            c1=Kc*sqrt(2*g*H);
            Q=Pa./(rho*g*H*eta);
            d=sqrt((4.*Q)./(pi.*c1));
            u=Ku*sqrt(2*g*H);
            D=(60*u)/(pi*n);
            PE=rho*g.*(H-(vE^2/(2*g)));
            grafica(H,PE/10^3,'H ( m )','PE ( kPa )','H vs PE');
            
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