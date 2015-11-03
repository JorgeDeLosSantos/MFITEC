function controlTipos
figure('MenuBar','none','NumberTitle','off',...
    'Name','CtrlVars','Resize','off',...
    'Position',[200 200 500 300]);
centerfig();

pmfi=uipanel(gcf,'Units','Pixels',...
    'Position',[5 260 490 35]);

ptipo=uipanel(gcf,'Units','Pixels',...
    'Position',[5 5 180 250]);

pvars=uipanel(gcf,'Units','Pixels',...
    'Position',[190 5 305 250]);

% Seleccionar MFI
uicontrol(pmfi,'style','text',...
    'String','Seleccione una opci�n',...
    'Position',[90 10 130 15],...
    'FontWeight','b');
hMFI=uicontrol(pmfi,'style','popupmenu',...
    'String',{'Bombas centr�fugas','Turbinas de reacci�n',...
    'Turbinas de acci�n'},...
    'Position',[240 8 150 20],...
    'Callback',@selecciona);

% Tipos
uicontrol(ptipo,'style','text',...
    'String','TIPO',...
    'Position',[5 230 170 15],...
    'FontWeight','b');
hTipo=uicontrol(ptipo,'style','listbox',...
    'String','',...
    'Position',[10 125 160 100],...
    'BackgroundColor','w',...
    'Callback',@tipo);

% Sub tipos
uicontrol(ptipo,'style','text',...
    'String','SUB-TIPO',...
    'Position',[5 100 170 15],...
    'FontWeight','b');
hSubtipo=uicontrol(ptipo,'style','listbox',...
    'String','',...
    'Position',[10 10 160 85],...
    'BackgroundColor','w',...
    'Callback',@subtipo);


% Entrada
uicontrol(pvars,'style','text',...
    'String','Entrada',...
    'Position',[5 225 140 15],...
    'FontWeight','b');
hEnt=uicontrol(pvars,'style','listbox',...
    'String','',...
    'Position',[10 10 130 210],...
    'BackgroundColor','w');

% Salida
uicontrol(pvars,'style','text',...
    'String','Salida',...
    'Position',[150 225 140 15],...
    'FontWeight','b');
hSal=uicontrol(pvars,'style','listbox',...
    'String','',...
    'Position',[155 10 130 210],...
    'BackgroundColor','w');

    function selecciona(src,~)
        np=[15 8 6];
        set(hTipo,'Value',1);
        k=get(src,'Value');
        TIPO_str=cell(1,np(k));
        for i=1:np(k)
            TIPO_str{i}=['Tipo ',num2str(i)];
        end
        set(hTipo,'String',TIPO_str);
    end

    function tipo(src,~)
        set(hSubtipo,'Value',1);
        kmfi=get(hMFI,'Value');
        ktipo=get(src,'Value');
        SUBT(1).str={{'S1','S2'},...
            {'S1'},...
            {'S1'},...
            {'S1','S2','S3'},...
            {'S1','S2','S3','S4','S5'},...
            {'S1'},...
            {'S1','S2','S3','S4','S5'},...
            {'S1'},...
            {'S1','S2','S3','S4'},...
            {'S1','S2'},...
            {'S1','S2','S3','S4'},...
            {'S1','S2'},...
            {'S1','S2'},...
            {'S1','S2','S3','S4'},...
            {'S1','S2','S3','S4','S5','S6','S7'}};
        SUBT(2).str={{'S1'},...
            {'S1','S2','S3','S4','S5'},...
            {'S1','S2','S3','S4','S5'},...
            {'S1'},...
            {'S1','S2','S3','S4','S5','S6','S7'},...
            {'S1','S2','S3'},...
            {'NULL'},...
            {'S1'}};
        SUBT(3).str={{'S1'},...
            {'S1'},...
            {'S1'},...
            {'S1'},...
            {'S1'},...
            {'S1'}};
        set(hSubtipo,'String',SUBT(kmfi).str{ktipo});
    end

    function subtipo(src,~)
        kmfi=get(hMFI,'Value');
        ktipo=get(hTipo,'Value');
        ksubt=get(src,'Value');
        VARS(1).ent={{{'n','D2','b2','beta2','H','eta_h','Hrext'},{'n','D2','b2','beta2','Pa','eta'}},...
            {{'H','n','D2','b2','D1','b1','Q','eta'}},...
            {{'c1','c2','D1','D2','alpha1','alpha2','n'}},...
            {{'Q','eta','Eps','zA','da','La','Ka','zZ','di','Li','Ki'},{'Q','eta','Eps','zA','da','La','zZ','di','Li'},'S3'},...
            {{'D1','D2','b1','b2','beta1','beta2','n','eta'},'S2','S3','S4','S5'},...
            {'S1'},...
            {'S1','S2','S3','S4','S5'},...
            {'S1'},...
            {'S1','S2','S3','S4'},...
            {'S1','S2'},...
            {'S1','S2','S3','S4'},...
            {'S1','S2'},...
            {'S1','S2'},...
            {'S1','S2','S3','S4'},...
            {'S1','S2','S3','S4','S5','S6','S7'}};
        VARS(2).ent={{'S1'},...
            {'S1','S2','S3','S4','S5'},...
            {'S1','S2','S3','S4','S5'},...
            {'S1'},...
            {'S1','S2','S3','S4','S5','S6','S7'},...
            {'S1','S2','S3'},...
            {'NULL'},...
            {'S1'}};
        VARS(3).ent={{'S1'},...
            {'S1'},...
            {'S1'},...
            {'S1'},...
            {'S1'},...
            {'S1'}};
        
        set(hEnt,'String',VARS(kmfi).ent{ktipo}{ksubt});
    end

end