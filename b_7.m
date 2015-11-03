function b_7(subtipo)
% Bombas centrífugas
% $ Ref. sub1 1921 / sub2 19.20 / sub3 19.31 $
% $ Rev. 1.0 $ 12/11/13 $
% 
%% Constantes persistentes
persistent g rho
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));
%% Características generales
cfondo=[0.5 0.8 0.9];
etsize=8;
%% Interfaz
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-B','position',[500,300,500,280],'color',cfondo);
centerfig(f);

%% Menú
barraMenuBC(f);

%% Datos de entrada y boton calcular

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 410 250],'backgroundcolor',cfondo);

% 1ra col ----------------------------------------------

eQ=uicontrol(pp,'style','text','String','Q','position',[10 200 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dQ=uicontrol(pp,'style','edit','String','','position',[50 200 100 20]);
uQ=uicontrol(pp,'style','text','String','m^3/s','position',[150 200 30 20],'backgroundcolor',cfondo);

if subtipo==1 | subtipo==3 | subtipo==4
    ePS=uicontrol(pp,'style','text','String','PS','position',[10 160 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dPS=uicontrol(pp,'style','edit','String','','position',[50 160 100 20]);
    uPS=uicontrol(pp,'style','text','String','kPa','position',[150 160 30 20],'backgroundcolor',cfondo);
    
    ePE=uicontrol(pp,'style','text','String','PE','position',[10 120 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dPE=uicontrol(pp,'style','edit','String','','position',[50 120 100 20]);
    uPE=uicontrol(pp,'style','text','String','kPa','position',[150 120 30 20],'backgroundcolor',cfondo);
elseif subtipo==2
    eMS=uicontrol(pp,'style','text','String','MS','position',[10 160 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dMS=uicontrol(pp,'style','edit','String','','position',[50 160 100 20]);
    uMS=uicontrol(pp,'style','text','String','mca','position',[150 160 30 20],'backgroundcolor',cfondo);
    
    eME=uicontrol(pp,'style','text','String','ME','position',[10 120 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dME=uicontrol(pp,'style','edit','String','','position',[50 120 100 20]);
    uME=uicontrol(pp,'style','text','String','mca','position',[150 120 30 20],'backgroundcolor',cfondo);
elseif subtipo==5
    eda=uicontrol(pp,'style','text','String','da','position',[10 160 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dda=uicontrol(pp,'style','edit','String','','position',[50 160 100 20]);
    uda=uicontrol(pp,'style','text','String','m','position',[150 160 30 20],'backgroundcolor',cfondo);
    
    ezA=uicontrol(pp,'style','text','String','zA','position',[10 120 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dzA=uicontrol(pp,'style','edit','String','','position',[50 120 100 20]);
    uzA=uicontrol(pp,'style','text','String','m','position',[150 120 30 20],'backgroundcolor',cfondo);
end

if subtipo==2 | subtipo==3
    eda=uicontrol(pp,'style','text','String','da','position',[10 80 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dda=uicontrol(pp,'style','edit','String','','position',[50 80 100 20]);
    uda=uicontrol(pp,'style','text','String','m','position',[150 80 30 20],'backgroundcolor',cfondo);
elseif subtipo==5
    ePa=uicontrol(pp,'style','text','String','Pa','position',[10 80 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dPa=uicontrol(pp,'style','edit','String','','position',[50 80 100 20]);
    uPa=uicontrol(pp,'style','text','String','kW','position',[150 80 30 20],'backgroundcolor',cfondo);
end
% 2da Col ------------------------------------------

ezE=uicontrol(pp,'style','text','String','zE','position',[210 200 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dzE=uicontrol(pp,'style','edit','String','','position',[250 200 100 20]);
uzE=uicontrol(pp,'style','text','String','m','position',[350 200 30 20],'backgroundcolor',cfondo);

ezS=uicontrol(pp,'style','text','String','zS','position',[210 160 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dzS=uicontrol(pp,'style','edit','String','','position',[250 160 100 20]);
uzS=uicontrol(pp,'style','text','String','m','position',[350 160 30 20],'backgroundcolor',cfondo);

eeta=uicontrol(pp,'style','text','String','eta','position',[210 120 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
deta=uicontrol(pp,'style','edit','String','','position',[250 120 100 20]);
ueta=uicontrol(pp,'style','text','String','','position',[350 120 30 20],'backgroundcolor',cfondo);

if subtipo==2 | subtipo==3
    edi=uicontrol(pp,'style','text','String','di','position',[210 120 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    ddi=uicontrol(pp,'style','edit','String','','position',[250 120 100 20]);
    udi=uicontrol(pp,'style','text','String','m','position',[350 120 30 20],'backgroundcolor',cfondo);
end

% Botón calcular
uicontrol(pp,'style','pushbutton','String','Calcular','position',[150 20 80 25],...
    'callback',{@calcular,subtipo},'fontsize',10,'fontweight','bold');

% Condición para subtipo 4
if subtipo==4
    set(dzE,'visible','off');
    set(dzS,'visible','off');
    set(uzS,'visible','off');
    set(uzE,'visible','off');
    set(ezS,'visible','off');
    set(ezE,'visible','off');
end

%% Menú Botones
posb=230;

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
        Q=str2double(get(dQ,'String'));
        eta=str2double(get(deta,'String'));
        if subtipo==1
            PS=str2double(get(dPS,'String'))*10^3;
            PE=str2double(get(dPE,'String'))*10^3;
            zS=str2double(get(dzS,'String'));
            zE=str2double(get(dzE,'String'));
            
            H=((PS-PE)/(rho*g))+(zS-zE);
            Pa=(Q*rho*g*H)/eta;
            
            res1=horzcat('H= ',num2str(H),' m');
            res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
            
            figresultados({res1,'',res2},2);
            
        elseif subtipo==2
            MS=str2double(get(dMS,'String'));
            ME=str2double(get(dME,'String'));
            zS=str2double(get(dzS,'String'));
            zE=str2double(get(dzE,'String'));
            da=str2double(get(dda,'String'));
            di=str2double(get(ddi,'String'));
            
            va=(4*Q)/(pi*da^2);
            vi=(4*Q)/(pi*di^2);
            
            H=(MS-ME)+(zS-zE)+((vi^2-va^2)/(2*g));
            Pa=(Q*rho*g*H);
            
            res1=horzcat('H= ',num2str(H),' m');
            res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
            figresultados({res1,'',res2},2);
            
        elseif subtipo==3
            PS=str2double(get(dPS,'String'))*10^3;
            PE=str2double(get(dPE,'String'))*10^3;
            zS=str2double(get(dzS,'String'));
            zE=str2double(get(dzE,'String'));
            da=str2double(get(dda,'String'));
            di=str2double(get(ddi,'String'));
            
            va=(4*Q)/(pi*da^2);
            vi=(4*Q)/(pi*di^2);
            
            H=((PS-PE)/(rho*g))+(zS-zE)+((vi^2-va^2)/(2*g));
            Pa=(Q*rho*g*H);
            
            res1=horzcat('H= ',num2str(H),' m');
            res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
            figresultados({res1,'',res2},2);
            
        elseif subtipo==4
            PS=str2double(get(dPS,'String'))*10^3;
            PE=str2double(get(dPE,'String'))*10^3;
            
            H=((PS-PE)/(rho*g));
            Pa=(Q*rho*g*H)/eta;
            
            res1=horzcat('H= ',num2str(H),' m');
            res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
            figresultados({res1,'',res2},2);
            
        elseif subtipo==5
            da=str2double(get(dda,'String'));
            Pa=str2double(get(dPa,'String'))*10^3;
            zA=str2double(get(dzA,'String'));
            zS=str2double(get(dzS,'String'));
            zE=str2double(get(dzE,'String'));
            
            va=(4*Q)/(pi*da^2);
            ME=(zE-zA)-(va^2/(2*g));
            H=(Pa*eta)/(rho*g*Q);
            MS=H+ME-(zS-zE);
            
            res1=horzcat('H= ',num2str(H),' m');
            res2=horzcat('MS= ',num2str(MS),' mca');
            res3=horzcat('ME= ',num2str(ME),' mca');
            figresultados({res1,'',res2,'',res3},3);
            
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
        Q=str2double(get(dQ,'String'));
        eta=str2double(get(deta,'String'));
        if subtipo==1
            eta=[0.1:0.01:1];
            PS=str2double(get(dPS,'String'))*10^3;
            PE=str2double(get(dPE,'String'))*10^3;
            zS=str2double(get(dzS,'String'));
            zE=str2double(get(dzE,'String'));
            
            H=((PS-PE)/(rho*g))+(zS-zE);
            Pa=(Q*rho*g*H)./eta;
            grafica(eta*100,Pa/10^3,'eta','Pa','');
            
        elseif subtipo==2
            Q=[0.01:0.01:1];
            MS=str2double(get(dMS,'String'));
            ME=str2double(get(dME,'String'));
            zS=str2double(get(dzS,'String'));
            zE=str2double(get(dzE,'String'));
            da=str2double(get(dda,'String'));
            di=str2double(get(ddi,'String'));
            va=(4*Q)/(pi*da^2);
            vi=(4*Q)/(pi*di^2);
            H=(MS-ME)+(zS-zE)+((vi.^2-va.^2)/(2*g));
            Pa=(Q.*rho*g.*H);
            grafica(Q*10^3,Pa/10^3,'Q (l/s)','P_a (kW)','Q vs P_a');
            
        elseif subtipo==3
            PS=str2double(get(dPS,'String'))*10^3;
            PE=str2double(get(dPE,'String'))*10^3;
            zS=str2double(get(dzS,'String'));
            zE=str2double(get(dzE,'String'));
            da=str2double(get(dda,'String'));
            di=str2double(get(ddi,'String'));
            Q=[0.01:0.01:1];
            
            va=(4*Q)/(pi*da^2);
            vi=(4*Q)/(pi*di^2);
            
            H=((PS-PE)/(rho*g))+(zS-zE)+((vi.^2-va.^2)/(2*g));
            Pa=(Q.*rho*g.*H);
            grafica(Q*10^3,Pa/10^3,'Q (l/s)','P_a (kW)','');
            
        elseif subtipo==4
            PS=str2double(get(dPS,'String'))*10^3;
            PE=str2double(get(dPE,'String'))*10^3;
            Q=[0.01:0.01:1];
            
            H=((PS-PE)/(rho*g));
            i=1;
            for eta=0.1:0.1:1
                Pa(i,:)=(Q*rho*g*H)/eta;
                i=i+1;
            end
            grafica(Q*10^3,Pa/10^3,'Q (l/s)','P_a (kW)','');
        elseif subtipo==5
            da=str2double(get(dda,'String'));
            Pa=str2double(get(dPa,'String'))*10^3;
            zA=str2double(get(dzA,'String'));
            zS=str2double(get(dzS,'String'));
            zE=str2double(get(dzE,'String'));
            eta=sym('eta');
            
            va=(4*Q)/(pi*da^2);
            ME=(zE-zA)-(va^2/(2*g));
            H=(Pa*eta)/(rho*g*Q);
            MS=H+ME-(zS-zE);
            figure();
            ezplot(MS,[0 1]);
            
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