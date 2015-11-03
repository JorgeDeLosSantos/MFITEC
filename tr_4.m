function tr_4

%% Constantes persistentes
persistent g rho
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));
%% Características generales
cfondo=[0.85 0.82 0.75];
etsize=8;
%% Interfaz
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-TR','position',[500,300,500,300],'color',cfondo);

%% Menú
barramenuTR(f);

%% Datos de entrada y boton calcular

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 410 270],'backgroundcolor',cfondo);

% 1ra col  --------------------------------------------------------

eD1=uicontrol(pp,'style','text','String','D1','position',[10 220 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dD1=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
uD1=uicontrol(pp,'style','text','String','m','position',[150 220 30 20],'backgroundcolor',cfondo);

eD2=uicontrol(pp,'style','text','String','D2','position',[10 180 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dD2=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
uD2=uicontrol(pp,'style','text','String','m','position',[150 180 30 20],'backgroundcolor',cfondo);

eb1=uicontrol(pp,'style','text','String','b1','position',[10 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
db1=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
ub1=uicontrol(pp,'style','text','String','m','position',[150 140 30 20],'backgroundcolor',cfondo);

eb2=uicontrol(pp,'style','text','String','b2','position',[10 100 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
db2=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
ub2=uicontrol(pp,'style','text','String','m','position',[150 100 30 20],'backgroundcolor',cfondo);



% 2da Col

ew1=uicontrol(pp,'style','text','String','w1','position',[210 220 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dw1=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
uw1=uicontrol(pp,'style','text','String','m/s','position',[350 220 30 20],'backgroundcolor',cfondo);

ew2=uicontrol(pp,'style','text','String','w2','position',[210 180 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dw2=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
uw2=uicontrol(pp,'style','text','String','m/s','position',[350 180 30 20],'backgroundcolor',cfondo);

en=uicontrol(pp,'style','text','String','n','position',[210 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dn=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
un=uicontrol(pp,'style','text','String','rpm','position',[350 140 30 20],'backgroundcolor',cfondo);


% Calcular PB
boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[150 20 80 25],...
    'callback',@calcular,'fontsize',10,'fontweight','bold');


%% Menú Botones
posb=250;

regresar=uicontrol('style','pushbutton','String','','position',[0 posb 35 35],...
    'callback',@gohome,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/inicio.png'));

tvel=uicontrol('style','pushbutton','String','','position',[0 posb-35 35 35],...
    'callback',@gotrian,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/triangulo.png'));

graphs=uicontrol('style','pushbutton','String','','position',[0 posb-2*35 35 35],...
    'callback',@gographics,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/grafica.png'));

convuni=uicontrol('style','pushbutton','String','','position',[0 posb-3*35 35 35],...
    'callback',@goconv,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/unidades.png'));

tablasb=uicontrol('style','pushbutton','String','','position',[0 posb-4*35 35 35],...
    'callback',@gotablas,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/tabla.png'));

calcu=uicontrol('style','pushbutton','String','','position',[0 posb-5*35 35 35],...
    'callback',@gocalc,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/calculadora.png'));

helping=uicontrol('style','pushbutton','String','','position',[0 posb-6*35 35 35],...
    'callback',@goayuda,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/ayuda.png'));


%% Funciones
    function calcular(~,~)
        MV=get(findobj('style','edit'),'String');
        if any(strcmp(MV,'')==1)
            warndlg({'Algunos datos no han sido proporcionados',...
                'Por favor verfique...'},'DATOS INCOMPLETOS');
        else
            D1=str2double(get(dD1,'String'));
            D2=str2double(get(dD2,'String'));
            b1=str2double(get(db1,'String'));
            b2=str2double(get(db2,'String'));
            w1=str2double(get(dw1,'String'));
            w2=str2double(get(dw2,'String'));
            n=str2double(get(dn,'String'));
            
            u1=(pi*D1*n)/60;
            u2=(pi*D2*n)/60;
            c2=sqrt(w2^2-u2^2);
            c2m=c2;
            Q=pi*b2*D2*c2m;
            c1m=(b2*D2*c2m)/(b1*D1);
            beta2=atan(c2/u2);
            beta1=asin(c1m/w1);
            c1u=u1-w1*cos(beta1);
            c1=sqrt(c1u^2+c1m^2);
            alpha1=atan(c1m/c1u);
            Hu=(u1*c1u)/g;
            Pi=Q*rho*g*Hu;
            
            res1=horzcat('u1= ',num2str(u1),' m/s');
            res2=horzcat('u2= ',num2str(u2),' m/s');
            res3=horzcat('Q= ',num2str(Q*10^3),' l/s');
            res4=horzcat('beta1= ',num2str(beta1*180/pi),' °');
            res5=horzcat('beta2= ',num2str(beta2*180/pi),' °');
            res6=horzcat('alpha1= ',num2str(alpha1*180/pi),' °');
            res7=horzcat('Hu= ',num2str(Hu),' m');
            res8=horzcat('Pi= ',num2str(Pi/10^3),' kW');
            
            figresultados({res1,'',res2,'',res3,'',res4,'',res5,'',res6,'',res7,'',res8},8)
        end
       
    end

    function gohome(~,~)
        close(gcf);
        run('App_Turbinas_R.m');
    end

    function gotrian(~,~)
        msgbox('Herramienta no disponible','MFITEC','custom',imread('data/imag/herramienta.png'));
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

end