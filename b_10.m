function b_10(subtipo)
% Bombas centrífugas (Tipo 10)
% $ Ref. sub1 197 || sub2 1919 $
% $ Rev. 1.0 $ 17/11/13 $

%% Constantes persistentes --------------------------------------------
persistent g rho
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));

%% Características generales ------------------------------------------
cfondo=[0.5 0.8 0.9];
etsize=8;

%% Interfaz -----------------------------------------------------------
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-B','position',[500,300,500,330],'color',cfondo);
centerfig(f);

%% Menú Superior
barraMenuBC(f);

%% Datos de entrada y boton calcular

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 410 300],'backgroundcolor',cfondo);

% 1ra Columna --------------------------------------------------------

eHra=uicontrol(pp,'style','text','String','Hra','position',[10 250 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dHra=uicontrol(pp,'style','edit','String','','position',[50 250 100 20]);
uHra=uicontrol(pp,'style','text','String','m','position',[150 250 30 20],'backgroundcolor',cfondo);

eHri=uicontrol(pp,'style','text','String','Hri','position',[10 220 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dHri=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
uHri=uicontrol(pp,'style','text','String','m','position',[150 220 30 20],'backgroundcolor',cfondo);

ezA=uicontrol(pp,'style','text','String','zA','position',[10 190 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dzA=uicontrol(pp,'style','edit','String','','position',[50 190 100 20]);
uzA=uicontrol(pp,'style','text','String','m','position',[150 190 30 20],'backgroundcolor',cfondo);

ezZ=uicontrol(pp,'style','text','String','zZ','position',[10 160 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dzZ=uicontrol(pp,'style','edit','String','','position',[50 160 100 20]);
uzZ=uicontrol(pp,'style','text','String','m','position',[150 160 30 20],'backgroundcolor',cfondo);

eD2=uicontrol(pp,'style','text','String','D2','position',[10 130 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dD2=uicontrol(pp,'style','edit','String','','position',[50 130 100 20]);
uD2=uicontrol(pp,'style','text','String','m','position',[150 130 30 20],'backgroundcolor',cfondo);

eb2=uicontrol(pp,'style','text','String','b2','position',[10 100 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
db2=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
ub2=uicontrol(pp,'style','text','String','m','position',[150 100 30 20],'backgroundcolor',cfondo);
% 2da Columna  -----------------------------------------------------

ebeta2=uicontrol(pp,'style','text','String','beta2','position',[210 250 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dbeta2=uicontrol(pp,'style','edit','String','','position',[250 250 100 20]);
ubeta2=uicontrol(pp,'style','text','String','°','position',[350 250 30 20],'backgroundcolor',cfondo);

en=uicontrol(pp,'style','text','String','n','position',[210 220 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dn=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
un=uicontrol(pp,'style','text','String','rpm','position',[350 220 30 20],'backgroundcolor',cfondo);


brendimientos=uicontrol(pp,'style','pushbutton','String','Rendimientos','position',[250 190 100 25],'backgroundcolor',[0.8 0.9 0.9],...
    'fontsize',8,'callback',@rendimientos);

if subtipo==1
    ezE=uicontrol(pp,'style','text','String','zE','position',[210 160 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dzE=uicontrol(pp,'style','edit','String','','position',[250 160 100 20]);
    uzE=uicontrol(pp,'style','text','String','m','position',[350 160 30 20],'backgroundcolor',cfondo);
    
    ezS=uicontrol(pp,'style','text','String','zS','position',[210 130 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dzS=uicontrol(pp,'style','edit','String','','position',[250 130 100 20]);
    uzS=uicontrol(pp,'style','text','String','m','position',[350 130 30 20],'backgroundcolor',cfondo);
    
    eda=uicontrol(pp,'style','text','String','da','position',[210 100 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dda=uicontrol(pp,'style','edit','String','','position',[250 100 100 20]);
    uda=uicontrol(pp,'style','text','String','m','position',[350 100 30 20],'backgroundcolor',cfondo);
       
    edi=uicontrol(pp,'style','text','String','di','position',[210 70 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    ddi=uicontrol(pp,'style','edit','String','','position',[250 70 100 20]);
    udi=uicontrol(pp,'style','text','String','m','position',[350 70 30 20],'backgroundcolor',cfondo);
end
% elseif subtipo==2   
%     eD1=uicontrol(pp,'style','text','String','D1','position',[210 160 30 20],'backgroundcolor',cfondo,...
%         'fontsize',etsize,'fontweight','bold');
%     dD1=uicontrol(pp,'style','edit','String','','position',[250 160 100 20]);
%     uD1=uicontrol(pp,'style','text','String','m','position',[350 160 30 20],'backgroundcolor',cfondo);
% end

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
    'callback',@gographics,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/grafica.png'));

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
        global eta_h eta_v eta_m
        Hra=str2double(get(dHra,'String'));
        Hri=str2double(get(dHri,'String'));
        zA=str2double(get(dzA,'String'));
        zZ=str2double(get(dzZ,'String'));
        D2=str2double(get(dD2,'String'));
        b2=str2double(get(db2,'String'));
        beta2=str2double(get(dbeta2,'String'))*pi/180; % To Radian
        n=str2double(get(dn,'String'));
        
        if subtipo==1
            zE=str2double(get(dzE,'String'));
            zS=str2double(get(dzS,'String'));
            da=str2double(get(dda,'String'));
            di=str2double(get(ddi,'String'));
            
            u2=(pi*D2*n)/60;
            syms vi
            c2m=(di^2/(4*D2*b2))*vi;
            c2u=u2-(c2m/tan(beta2));
            Hu=(u2*c2u)/g;
            % Igualando ecuaciones de altura útil
            vi=solve(Hu*eta_h==zZ-zA+Hra+Hri+(vi^2/(2*g)),vi);
            vi=double(vi(1));
            Q=(pi*di^2*vi)/4; % Caudal
            va=(4*Q)/(pi*da^2);
            
            PE=(zA-Hra-zE-(va^2/(2*g)))*(rho*g); % Presión Entrada Bomba
            PS=(Hri+zZ-zS)*(rho*g);  % Presión salida bomba
            H=subs(eta_h*Hu,'vi',vi);  % Altura útil numérica
            
            res1=horzcat('Q= ',num2str(Q*10^3),' l/s');
            res2=horzcat('PE= ',num2str(PE/10^3),' kPa');
            res3=horzcat('PS= ',num2str(PS/10^3),' kPa');
            res4=horzcat('H= ',num2str(H),' m');
            
            figresultados({res1,'',res2,'',res3,'',res4},4);
            
        elseif subtipo==2
            u2=(pi*D2*n)/60;
            
            H=(zZ-zA)+Hra+Hri;
            Hu=H/(eta_h);
            c2u=(Hu*g)/u2;
            c2m=(u2-c2u)*tan(beta2);
            Q=pi*b2*D2*c2m;
            Pa=(Q*rho*g*H)/(eta_v*eta_h*eta_m);
            
            res1=horzcat('Q= ',num2str(Q*10^3),' l/s');
            res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
            res3=horzcat('H= ',num2str(H),' m');
            
            figresultados({res1,'',res2,'',res3},3);
        end
    end

    function rendimientos(~,~)
        global eta_h eta_v eta_m
        conf.Interpreter='tex';
        Eta=inputdlg({'\eta_h','\eta_v','\eta_m'},'Rendimientos',1,{'1','1','1'},conf);
        eta_h=str2double(Eta(1));
        eta_v=str2double(Eta(2));
        eta_m=str2double(Eta(3));
    end

    function gohome(~,~)
        close(gcf);
        run('App_Bombas.m');
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