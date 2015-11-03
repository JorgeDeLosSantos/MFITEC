function tr_8

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

ec1=uicontrol(pp,'style','text','String','c1','position',[10 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dc1=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
uc1=uicontrol(pp,'style','text','String','m/s','position',[150 140 30 20],'backgroundcolor',cfondo);

ec2=uicontrol(pp,'style','text','String','c2','position',[10 100 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dc2=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
uc2=uicontrol(pp,'style','text','String','m/s','position',[150 100 30 20],'backgroundcolor',cfondo);

eb1=uicontrol(pp,'style','text','String','b1','position',[10 60 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
db1=uicontrol(pp,'style','edit','String','','position',[50 60 100 20]);
ub1=uicontrol(pp,'style','text','String','m','position',[150 60 30 20],'backgroundcolor',cfondo);


% 2da Col

ealpha1=uicontrol(pp,'style','text','String','alpha1','position',[210 220 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dalpha1=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
ualpha1=uicontrol(pp,'style','text','String','°','position',[350 220 30 20],'backgroundcolor',cfondo);

en=uicontrol(pp,'style','text','String','n','position',[210 180 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dn=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
un=uicontrol(pp,'style','text','String','rpm','position',[350 180 30 20],'backgroundcolor',cfondo);

eeta_h=uicontrol(pp,'style','text','String','eta_h','position',[210 140 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
deta_h=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
ueta_h=uicontrol(pp,'style','text','String','','position',[350 140 30 20],'backgroundcolor',cfondo);

ePrm=uicontrol(pp,'style','text','String','Prm','position',[210 100 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dPrm=uicontrol(pp,'style','edit','String','','position',[250 100 100 20]);
uPrm=uicontrol(pp,'style','text','String','kW','position',[350 100 30 20],'backgroundcolor',cfondo);

ezE=uicontrol(pp,'style','text','String','zE','position',[210 60 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dzE=uicontrol(pp,'style','edit','String','','position',[250 60 100 20]);
uzE=uicontrol(pp,'style','text','String','m','position',[350 60 30 20],'backgroundcolor',cfondo);

evE=uicontrol(pp,'style','text','String','vE','position',[210 20 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dvE=uicontrol(pp,'style','edit','String','','position',[250 20 100 20]);
uvE=uicontrol(pp,'style','text','String','m/s','position',[350 20 30 20],'backgroundcolor',cfondo);

% Calcular PB
boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[60 10 80 25],...
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
            c1=str2double(get(dc1,'String'));
            c2=str2double(get(dc2,'String'));
            b1=str2double(get(db1,'String'));
            alpha1=str2double(get(dalpha1,'String'))*pi/180;
            n=str2double(get(dn,'String'));
            eta_h=str2double(get(deta_h,'String'));
            Prm=str2double(get(dPrm,'String'))*10^3;
            zE=str2double(get(dzE,'String'));
            vE=str2double(get(dvE,'String'));
            
            u1=(pi*D1*n)/60;
            u2=(pi*D2*n)/60;
            c1u=c1*cos(alpha1);
            c1m=c1*sin(alpha1);
            w1u=u1-c1u;
            w1=sqrt(w1u^2+c1m^2);
            beta1=acos(w1u/w1);
            c2m=c2;
            w2=sqrt(c2^2+u2^2);
            beta2=acos(u2/w2);
            Hu=(u1*c1u)/g;
            H=Hu/eta_h;
            Q=pi*b1*D1*c1m;
            Pi=Q*rho*g*Hu;
            Pa=Pi-Prm;
            PE=rho*g*(H-zE-(vE^2/(2*g)));
            
            res1=horzcat('u1= ',num2str(u1),' m/s');
            res2=horzcat('u2= ',num2str(u2),' m/s');
            res3=horzcat('beta1= ',num2str(beta1*180/pi),' m/s');
            res4=horzcat('beta2= ',num2str(beta2*180/pi),' m/s');
            res5=horzcat('w1= ',num2str(w1),' m/s');
            res6=horzcat('w2= ',num2str(w2),' m/s');
            res7=horzcat('H= ',num2str(H),' m');
            res8=horzcat('Q= ',num2str(Q*10^3),' l/s');
            res9=horzcat('Pi= ',num2str(Pi/10^3),' kW');
            res10=horzcat('Pa= ',num2str(Pa/10^3),' kW');
            res11=horzcat('PE= ',num2str(PE/10^3),' kPa');
            
            figresultados({res1,'',res2,'',res3,'',res4,'',res5,'',res6,'',res7,'',res8,'',res9,'',res10,'',res11},11);
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