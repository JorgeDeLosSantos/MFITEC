function App_BC
% App_BC
%
%
% Versión: 0.1.1   (03/01/2014)
% Copyright (c) 2014  -  Jorge De Los Santos
% Licencia: BSD License

App = figure('MenuBar','None','NumberTitle','off',...
    'Name','Bombas centrífugas','Resize','off',...
    'Position',[0 0 600 400],'Color','w');
centerfig();

label=load('VARS_BC.mat');
label.VARS_BC=flipud(label.VARS_BC);

p=uipanel(App,'units','pixels',...
    'Position',[70 10 520 380],...
    'BackgroundColor','w',...
    'Title','Datos disponibles');

k=1;
for i=1:7
    for j=1:8
        uicontrol(p,'style','checkbox','String',label.VARS_BC{k},...
            'pos',[i*70-60 (9-j)*40 65 40],'Background','w');
        k=k+1;
    end
end

INIT_POS=230;
uicontrol(App,'style','push',...
    'String','',...
    'Position',[0 INIT_POS 35 35],...
    'CData',imread('inicio.png'),...
    'BackgroundColor','k',...
    'Callback',@regresar);

uicontrol(App,'style','push',...
    'String','',...
    'Position',[0 INIT_POS-35 35 35],...
    'CData',imread('ayuda.png'),...
    'BackgroundColor','k',...
    'Callback',@ayuda);

uicontrol(App,'style','push',...
    'String','',...
    'Position',[0 INIT_POS-2*35 35 35],...
    'CData',imread('listo.png'),...
    'BackgroundColor',ones(1,3)*0.8,...
    'Callback',@verificar);

crearMenu();

    function crearMenu
        menu_herramientas=uimenu(App,'Label','Herramientas');
        uimenu(menu_herramientas,'Label','Conversor de unidades');
        uimenu(menu_herramientas,'Label','Tablas');
        uimenu(menu_herramientas,'Label','Diagrama de Moody');
        uimenu(menu_herramientas,'Label','Configurar densidad');
        
        menu_ayuda=uimenu(App,'Label','Ayuda');
        uimenu(menu_ayuda,'Label','Ayuda');
        uimenu(menu_ayuda,'Label','Acerca de...');
        
    end

    function verificar(~,~)
        % Datos totales
        totdatos=get(findobj('style','checkbox'),'value');
        ndd=nnz(cell2mat(totdatos));
        efi=cell2mat(get(findobj('str','eta_m','-or','str','eta_h','-or','str','eta_v','-or','str','eta'),'value'));
        
        % Datos necesarios en cada tipo/subtipo
        % T1
        p1s1=cell2mat(get(findobj('str','H','-or','str','eta_h','-or','str','D2','-or','str','b2','-or','str','beta2','-or','str','n',...
            '-or','str','Hrext'),'value'));
        p1s2=cell2mat(get(findobj('str','Pa','-or','str','eta','-or','str','D2','-or','str','b2','-or','str','beta2','-or','str','n'),'value'));
        
        % T2
        p2s1=cell2mat(get(findobj('str','D1','-or','str','D2','-or','str','b1','-or','str','b2','-or','str','Q','-or','str','H',...
            '-or','str','n'),'value'));
        
        % T3
        p3s1=cell2mat(get(findobj('str','c1','-or','str','c2','-or','str','alpha1','-or','str','alpha2','-or','str','D1','-or','str','D2',...
            '-or','str','n'),'value'));
        
        % T4
        p4s1=cell2mat(get(findobj('str','di','-or','str','da','-or','str','La','-or','str','Li','-or','str','zZ','-or','str','zA',...
            '-or','str','Q','-or','str','eta','-or','str','Eps','-or','str','Ka','-or','str','Ki'),'value'));
        p4s2=cell2mat(get(findobj('str','di','-or','str','da','-or','str','La','-or','str','Li','-or','str','zZ','-or','str','zA',...
            '-or','str','Q','-or','str','eta','-or','str','Eps'),'value'));
        p4s3=cell2mat(get(findobj('str','di','-or','str','da','-or','str','La','-or','str','Li','-or','str','zZ','-or','str','zA',...
            '-or','str','Q','-or','str','eta_h','-or','str','Eps','-or','str','Ka','-or','str','Ki','-or','str','eta_v','-or',...
            'str','eta_m'),'value'));
        
        % T5
        p5s1=cell2mat(get(findobj('str','D1','-or','str','D2','-or','str','b1','-or','str','b2','-or','str','beta1','-or','str','beta2',...
            '-or','str','n'),'value'));
        p5s2=cell2mat(get(findobj('str','D1','-or','str','D2','-or','str','b1','-or','str','b2','-or','str','beta1','-or','str','beta2',...
            '-or','str','n','-or','str','ME'),'value'));
        p5s3=cell2mat(get(findobj('str','D1','-or','str','D2','-or','str','b1','-or','str','b2','-or','str','beta1','-or','str','beta2',...
            '-or','str','n','-or','str','eta'),'value'));
        p5s4=cell2mat(get(findobj('str','D1','-or','str','D2','-or','str','b1','-or','str','b2','-or','str','beta1','-or','str','beta2',...
            '-or','str','Q','-or','str','eta'),'value'));
        p5s5=cell2mat(get(findobj('str','D1','-or','str','D2','-or','str','A1','-or','str','A2','-or','str','beta1','-or','str','beta2',...
            '-or','str','n','-or','str','eta'),'value'));
        
        % T6
        p6s1=cell2mat(get(findobj('str','D1','-or','str','D2','-or','str','b1','-or','str','b2','-or','str','beta1','-or','str','beta2',...
            '-or','str','n','-or','str','zS','-or','str','zE','-or','str','zA','-or','str','da','-or','str','di'),'value'));
        
        % T7
        p7s1=cell2mat(get(findobj('str','Q','-or','str','PS','-or','str','PE','-or','str','zS','-or','str','zE','-or','str','eta'),'value'));
        p7s2=cell2mat(get(findobj('str','Q','-or','str','MS','-or','str','ME','-or','str','zS','-or','str','zE','-or','str','da',...
            '-or','str','di'),'value'));
        p7s3=cell2mat(get(findobj('str','Q','-or','str','PS','-or','str','PE','-or','str','zS','-or','str','zE','-or','str','eta',...
            '-or','str','da','-or','str','di'),'value'));
        p7s4=cell2mat(get(findobj('str','Q','-or','str','PS','-or','str','PE','-or','str','eta'),'value'));
        p7s5=cell2mat(get(findobj('str','Q','-or','str','da','-or','str','zA','-or','str','zE','-or','str','zS','-or','str','Pa',...
            '-or','str','eta'),'value'));
        % T8
        p8s1=cell2mat(get(findobj('str','zZ','-or','str','zA','-or','str','c1m','-or','str','c2m','-or','str','beta2','-or','str','vi',...
            '-or','str','eta'),'value'));
        
        % T9
        p9s1=cell2mat(get(findobj('str','D2','-or','str','n','-or','str','beta2','-or','str','c2m'),'value'));
        p9s2=cell2mat(get(findobj('str','D2','-or','str','n','-or','str','beta2','-or','str','c2m','-or','str','eta_h'),'value'));
        p9s3=cell2mat(get(findobj('str','D2','-or','str','u2','-or','str','beta2','-or','str','c2m'),'value'));
        p9s4=cell2mat(get(findobj('str','D2','-or','str','u2','-or','str','beta2','-or','str','c2m','-or','str','eta_h'),'value'));
        
        
        % T10
        p10s1=cell2mat(get(findobj('str','Hra','-or','str','Hri','-or','str','zA','-or','str','zZ','-or','str','D2','-or','str','b2',...
            '-or','str','beta2','-or','str','n','-or','str','zE','-or','str','zS','-or','str','da','-or','str','di'),'value'));
        p10s2=cell2mat(get(findobj('str','Hra','-or','str','Hri','-or','str','zA','-or','str','zZ','-or','str','D2','-or','str','b2',...
            '-or','str','beta2','-or','str','n'),'value'));
        
        % T11
        p11s1=cell2mat(get(findobj('str','zZ','-or','str','zA','-or','str','Q','-or','str','Hrext','-or','str','eta'),'value'));
        p11s2=cell2mat(get(findobj('str','zZ','-or','str','zA','-or','str','Q','-or','str','Hrext','-or','str','Pa'),'value'));
        p11s3=cell2mat(get(findobj('str','zZ','-or','str','zA','-or','str','Q','-or','str','Hra','-or','str','Hri','-or','str','eta'),'value'));
        p11s4=cell2mat(get(findobj('str','zZ','-or','str','zA','-or','str','Q','-or','str','Hra','-or','str','Hri','-or','str','Pa'),'value'));
        
        % T12
        p12s1=cell2mat(get(findobj('str','zZ','-or','str','zA','-or','str','Kta','-or','str','Kti','-or','str','da','-or','str','di',...
            '-or','str','Q','-or','str','eta'),'value'));
        p12s2=cell2mat(get(findobj('str','zZ','-or','str','zA','-or','str','Kta','-or','str','Kti','-or','str','da','-or','str','di',...
            '-or','str','Q','-or','str','Pa'),'value'));
        
        % T13
        p13s1=cell2mat(get(findobj('str','n','-or','str','D1','-or','str','beta1','-or','str','c1m'),'value'));
        p13s2=cell2mat(get(findobj('str','u1','-or','str','D1','-or','str','beta1','-or','str','c1m'),'value'));
        
        % T14
        p14s1=cell2mat(get(findobj('str','PA','-or','str','PSV','-or','str','Hra','-or','str','Q','-or','str','H','-or','str','n',...
            '-or','str','NPSH'),'value'));
        p14s2=cell2mat(get(findobj('str','PA','-or','str','PSV','-or','str','Hra','-or','str','zE','-or','str','zA'),'value'));
        p14s3=cell2mat(get(findobj('str','PA','-or','str','PSV','-or','str','Hra','-or','str','Q','-or','str','H','-or','str','n',...
            '-or','str','zA','-or','str','zE'),'value'));
        p14s4=cell2mat(get(findobj('str','PA','-or','str','PSV','-or','str','zE','-or','str','zA','-or','str','Ka','-or','str','La',...
            '-or','str','da','-or','str','Eps','-or','str','Q'),'value'));
        
        % T15
        p15s1=cell2mat(get(findobj('str','ns','-or','str','Q','-or','str','H'),'value'));
        p15s2=cell2mat(get(findobj('str','ns','-or','str','Q','-or','str','n'),'value'));
        p15s3=cell2mat(get(findobj('str','ns','-or','str','H','-or','str','n'),'value'));
        p15s4=cell2mat(get(findobj('str','ns','-or','str','P','-or','str','n'),'value'));
        p15s5=cell2mat(get(findobj('str','ns','-or','str','P','-or','str','H'),'value'));
        p15s6=cell2mat(get(findobj('str','n','-or','str','Q','-or','str','H'),'value'));
        p15s7=cell2mat(get(findobj('str','n','-or','str','P','-or','str','H'),'value'));
        
        
        % Selector 
        if all(p1s1==1) & ndd==nnz(p1s1)
            close(gcf);
            run('b_1(1).m');
        elseif all(p1s2==1) & ndd==nnz(p1s2)
            close(gcf);
            run('b_1(2).m');
        elseif all(p2s1==1) & ndd==nnz(p2s1)
            close(gcf);
            run('b_2.m');
        elseif all(p3s1==1) & ndd==nnz(p3s1)
            close(gcf);
            run('b_3.m');
        elseif all(p4s1==1) & ndd==nnz(p4s1)
            close(gcf);
            run('b_4(1).m');
        elseif all(p4s2==1) & ndd==nnz(p4s2)
            close(gcf);
            run('b_4(2).m');
        elseif all(p4s3==1) & ndd==nnz(p4s3)
            close(gcf);
            run('b_4(3).m');
        elseif all(p5s1==1) & ndd==nnz(p5s1)
            close(gcf);
            run('b_5(1).m');
        elseif all(p5s2==1) | and(all(p5s2==1),any(efi==1)) % PR
            close(gcf);
            run('b_5(2).m');
        elseif all(p5s3==1) | and(all(p5s3==1),any(efi==1)) % PR
            close(gcf);
            run('b_5(3).m');
        elseif all(p5s4==1) & ndd==nnz(p5s4)
            close(gcf);
            run('b_5(4).m');
        elseif all(p5s5==1) & ndd==nnz(p5s5)
            close(gcf);
            run('b_5(5).m');
        elseif all(p6s1==1) | and(all(p6s1==1),any(efi==1)) % PR
            close(gcf);
            run('b_6.m');
        elseif all(p7s1==1) & ndd==nnz(p7s1)
            close(gcf);
            run('b_7(1).m');
        elseif all(p7s2==1) & ndd==nnz(p7s2)
            close(gcf);
            run('b_7(2).m');
        elseif all(p7s3==1) & ndd==nnz(p7s3)
            close(gcf);
            run('b_7(3).m');
        elseif all(p7s4==1) & ndd==nnz(p7s4)
            close(gcf);
            run('b_7(4).m');
        elseif all(p7s5==1) & ndd==nnz(p7s5)
            close(gcf);
            run('b_7(5).m');
        elseif all(p8s1==1) & ndd==nnz(p8s1)
            close(gcf);
            run('b_8.m');
        elseif all(p9s1==1) & ndd==nnz(p9s1)
            close(gcf);
            run('b_9(1).m');
        elseif all(p9s2==1) & ndd==nnz(p9s2)
            close(gcf);
            run('b_9(2).m');
        elseif all(p9s3==1) & ndd==nnz(p9s3)
            close(gcf);
            run('b_9(3).m');
        elseif all(p9s4==1) & ndd==nnz(p9s4)
            close(gcf);
            run('b_9(4).m');
        elseif all(p10s1==1) & ndd==nnz(p10s1)
            close(gcf);
            run('b_10(1).m');
        elseif all(p10s2==1) | and(all(p10s2==1),any(efi==1)) % efi
            close(gcf);
            run('b_10(2).m');
        elseif all(p11s1==1) & ndd==nnz(p11s1)
            close(gcf);
            run('b_11(1).m');
        elseif all(p11s2==1) & ndd==nnz(p11s2)
            close(gcf);
            run('b_11(2).m');
        elseif all(p11s3==1) & ndd==nnz(p11s3)
            close(gcf);
            run('b_11(3).m');
        elseif all(p11s4==1) & ndd==nnz(p11s4)
            close(gcf);
            run('b_11(4).m');
        elseif all(p12s1==1) & ndd==nnz(p12s1)
            close(gcf);
            run('b_12(1).m');
        elseif all(p12s2==1) & ndd==nnz(p12s2)
            close(gcf);
            run('b_12(2).m');
        elseif all(p13s1==1) & ndd==nnz(p13s1)
            close(gcf);
            run('b_13(1).m');
        elseif all(p13s2==1) & ndd==nnz(p13s2)
            close(gcf);
            run('b_13(2).m');
        elseif all(p14s1==1) & ndd==nnz(p14s1)
            close(gcf);
            run('b_14(1).m');
        elseif all(p14s2==1) & ndd==nnz(p14s2)
            close(gcf);
            run('b_14(2).m');
        elseif all(p14s3==1) & ndd==nnz(p14s3)
            close(gcf);
            run('b_14(3).m');
        elseif all(p14s4==1) & ndd==nnz(p14s4)
            close(gcf);
            run('b_14(4).m');
        elseif all(p15s1==1) & ndd==nnz(p15s1)
            close(gcf);
            run('b_15(1).m');
        elseif all(p15s2==1) & ndd==nnz(p15s2)
            close(gcf);
            run('b_15(2).m');
        elseif all(p15s3==1) & ndd==nnz(p15s3)
            close(gcf);
            run('b_15(3).m');
        elseif all(p15s4==1) & ndd==nnz(p15s4)
            close(gcf);
            run('b_15(4).m');
        elseif all(p15s5==1) & ndd==nnz(p15s5)
            close(gcf);
            run('b_15(5).m');
        elseif all(p15s6==1) & ndd==nnz(p15s6)
            close(gcf);
            run('b_15(6).m');
        elseif all(p15s7==1) & ndd==nnz(p15s7)
            close(gcf);
            run('b_15(7).m');
        else
            warndlg('Datos no suficientes, verifique nuevamente...','MFITEC');
        end
    end


    function ayuda(~,~)
    end

    function regresar(~,~)
    end
end