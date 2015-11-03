function b_2 
% Bombas centrífugas (Tipo 2)
% $ Ref. 1937 $
% $ Por: Jorge De Los Santos $
% $ Rev 1.0 $ 12/11/13 $

%% Constantes persistentes
persistent g rho
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));

%% Características generales

cfondo=[0.5 0.8 0.9];
etsize=8;

%% Interfaz
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-B','position',[500,300,500,300],'color',cfondo);
centerfig(f);

%% Menú

barraMenuBC(f);

%% Datos de entrada
pp=uipanel(f,'title','DATOS','units','pixels','position',[80 20 400 270],'backgroundcolor',cfondo);


eH=uicontrol(pp,'style','text','String','H','position',[10 210 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dH=uicontrol(pp,'style','edit','String','','position',[50 210 100 20]);
uH=uicontrol(pp,'style','text','String','m','position',[150 210 30 20],'backgroundcolor',cfondo);

en=uicontrol(pp,'style','text','String','n','position',[10 170 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dn=uicontrol(pp,'style','edit','String','','position',[50 170 100 20]);
un=uicontrol(pp,'style','text','String','rpm','position',[150 170 30 20],'backgroundcolor',cfondo);

eD2=uicontrol(pp,'style','text','String','D2','position',[10 130 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dD2=uicontrol(pp,'style','edit','String','','position',[50 130 100 20]);
uD2=uicontrol(pp,'style','text','String','m','position',[150 130 30 20],'backgroundcolor',cfondo);

eb2=uicontrol(pp,'style','text','String','b2','position',[10 90 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
db2=uicontrol(pp,'style','edit','String','','position',[50 90 100 20]);
ub2=uicontrol(pp,'style','text','String','m','position',[150 90 30 20],'backgroundcolor',cfondo);

eD1=uicontrol(pp,'style','text','String','D1','position',[210 210 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dD1=uicontrol(pp,'style','edit','String','','position',[250 210 100 20]);
uD1=uicontrol(pp,'style','text','String','m','position',[350 210 30 20],'backgroundcolor',cfondo);

eb1=uicontrol(pp,'style','text','String','b1','position',[210 170 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
db1=uicontrol(pp,'style','edit','String','','position',[250 170 100 20]);
ub1=uicontrol(pp,'style','text','String','m','position',[350 170 30 20],'backgroundcolor',cfondo);

eQ=uicontrol(pp,'style','text','String','Q','position',[210 130 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dQ=uicontrol(pp,'style','edit','String','','position',[250 130 100 20]);
uQ=uicontrol(pp,'style','text','String','m^3/s','position',[350 130 30 20],'backgroundcolor',cfondo);

boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[150 20 80 25],...
    'callback',@calcular,'fontsize',10,'fontweight','bold');

%% Menú Botones
posb=250;

uicontrol('style','pushbutton','String','','position',[0 posb 35 35],...
    'callback',@gohome,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/inicio.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-35 35 35],...
    'callback',@gotrian,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/triangulo.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-2*35 35 35],...
    'callback',@gographics,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/grafica.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-3*35 35 35],...
    'callback',@goconv,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/unidades.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-4*35 35 35],...
    'callback',@gotablas,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/tabla.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-5*35 35 35],...
    'callback',@gocalc,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/calculadora.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-6*35 35 35],...
    'callback',@goayuda,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/ayuda.png'));

%% Funciones

    function calcular(~,~)
        global alpha1 alpha2 c1 c2 u1 u2
        MV=get(findobj('style','edit'),'String');
        if any(strcmp(MV,''))
            warndlg({'Algunos datos no han sido proporcionados',...
                'Por favor verfique...'},'DATOS INCOMPLETOS');
        else
            H=str2double(get(dH,'String'));
            n=str2double(get(dn,'String'));
            D2=str2double(get(dD2,'String'));
            b2=str2double(get(db2,'String'));
            D1=str2double(get(dD1,'String'));
            b1=str2double(get(db1,'String'));
            Q=str2double(get(dQ,'String'));
            
            alpha1=90*pi/180;
            u1=(pi*D1*n)/60;
            u2=(pi*D2*n)/60;
            Hu=H;
            c2u=(Hu*g)/u2;
            c2m=Q/(pi*b2*D2);
            c1m=Q/(pi*b1*D1);
            c1=c1m;
            c2=sqrt(c2u^2+c2m^2);
            beta1=atan(c1/u1);
            beta2=atan(c2m/(u2-c2u));
            alpha2=atan(c2m/c2u);
            Pa=Q*rho*g*H;
            
            res1=horzcat('beta1= ',num2str(beta1*180/pi), '  °');
            res2=horzcat('beta2= ',num2str(beta2*180/pi),' °');
            res3=horzcat('Pa = ',num2str(Pa/10^3), ' kW');
            res4=horzcat('u1 = ',num2str(u1), ' m/s');
            res5=horzcat('u2 = ',num2str(u2), ' m/s');
            res6=horzcat('c1 = ',num2str(c1), ' m/s');
            res7=horzcat('c2 = ',num2str(c2), ' m/s');
            
            figresultados({res1,'',res2,'',res3,'',res4,'',res5,'',res6,'',res7},8);
        end
    end

    function gohome(~,~)
        close(gcf);
        run('App_Bombas.m');
    end

    function gotrian(~,~)
        global alpha1 alpha2 c1 c2 u1 u2
        triangulos(u1,c1,alpha1,u2,c2,alpha2);
    end

    function gographics(~,~)
        H=insertRango('H (m)','1:100');
        n=str2double(get(dn,'String'));
        D2=str2double(get(dD2,'String'));
        b2=str2double(get(db2,'String'));
        D1=str2double(get(dD1,'String'));
        b1=str2double(get(db1,'String'));
        Q=str2double(get(dQ,'String'));
        
        u1=(pi*D1*n)/60;
        u2=(pi*D2*n)/60;
        Hu=H;
        c2u=(Hu*g)/u2;
        c2m=Q/(pi*b2*D2);
        c1m=Q/(pi*b1*D1);
        c1=c1m;
        c2=sqrt(c2u.^2+c2m^2);
        beta1=atan(c1/u1);
        beta2=atan(c2m./(u2-c2u));
        Pa=Q*rho*g*H;
        grafica(H,beta2*180/pi,'H ( m )','\beta_2 ( ° )','H vs \beta_2');

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