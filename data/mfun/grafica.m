function grafica(x,y,xlab,ylab,encab)
% Grafica trazada a partir de los vectores x & y
% Argumentos de entrada:
%          x      -  Vector de la variable indepediente
%          y      -  Vector de la variable dependiente
%          xlab   -  Etiqueta del eje horizontal
%          ylab   -  Etiqueta del eje vertical
%          encab  -  Título del gráfico
% Ejemplo:
%          >>x=1:1/100:2*pi;
%          >>y=sin(x);
%          >>grafica(x,y,'Eje x','Eje y','Gráfica 1');
% 
% $ Por: Jorge De Los Santos $
% $ Rev. 1.1 $ 12/12/13 $
% 
if any(isnan(x)) | any(isnan(y))
    errordlg('No se han introducido datos','MFITEC - Error');
else
    cfondo=[0.8 0.85 0.9];
    fg=figure('MenuBar','none','NumberTitle','off','Name','MFITEC - Gráfica','position',[100 100 760 500],...
        'color',cfondo,'resize','off');
    centerfig(fg);
    
    %% Axes y Panel
    ax=axes('parent',fg,'units','pixels','position',[70 50 450 400]);
    pp=uipanel(fg,'units','pixels','position',[550 50 190 400],'backgroundcolor',cfondo*0.9);
    cpanel=get(pp,'backgroundcolor');
    
    %% Modificadores
    uicontrol(pp,'style','text','String','Color de linea','Position',[20 370 150 20],'backgroundcolor',cpanel,'fontweight','bold');
    scolor=uicontrol(pp,'style','popupmenu','String',{'Azul','Rojo','Amarillo','Blanco','Negro','Verde','Magenta','Naranja','Rosa','Gris'},...
        'Position',[20 350 150 20],'callback',@selcolor);
    
    uicontrol(pp,'style','text','String','Grosor de linea','Position',[20 320 150 20],'backgroundcolor',cpanel,'fontweight','bold');
    sgrosor=uicontrol(pp,'style','popupmenu','String',{'1','2','3','4','5','6','7','8','9','10'},'Position',[20 300 150 20],...
        'callback',@selgrosor);
    
    uicontrol(pp,'style','text','String','Estilo de linea','Position',[20 270 150 20],'backgroundcolor',cpanel,'fontweight','bold');
    sestilo=uicontrol(pp,'style','popupmenu','String',{'Continua','Semicontinua','Puntos','Guion Punto'},'Position',[20 250 150 20],...
        'callback',@selestilo);
    
    uicontrol(pp,'style','text','String','Color de fondo','Position',[20 220 150 20],'backgroundcolor',cpanel,'fontweight','bold');
    scfond=uicontrol(pp,'style','popupmenu','String',{'Azul','Rojo','Amarillo','Blanco','Negro','Verde','Magenta','Naranja','Rosa','Gris'},...
        'Position',[20 200 150 20],'callback',@selfondo);
    
    uicontrol(pp,'style','checkbox','str','Mostrar rejilla','position',[50 165 100 20],...
        'backgroundcolor',cpanel,'callback',@rejilla);
    
    glab=uicontrol(pp,'style','pushbutton','String','Modificar etiquetas','position',[20 115 150 25],...
        'fontweight','bold','fontsize',9,'callback',@modlab,'backgroundcolor',[0.8 0.8 0.95]);
    
    gtab=uicontrol(pp,'style','pushbutton','String','Exportar datos','position',[20 90 150 25],...
        'fontweight','bold','fontsize',9,'callback',{@gtabla,xlab,ylab},'backgroundcolor',[0.8 0.8 0.95]);
    
    gimp=uicontrol(pp,'style','pushbutton','String','Importar datos','position',[20 65 150 25],...
        'fontweight','bold','fontsize',9,'callback',@importar,'backgroundcolor',[0.8 0.8 0.95]);
    
    gimag=uicontrol(pp,'style','pushbutton','String','Guardar gráfica','position',[20 40 150 25],...
        'fontweight','bold','fontsize',9,'callback',@gimagen,'backgroundcolor',[0.8 0.8 0.95]);
    
    gnva=uicontrol(pp,'style','pushbutton','String','Nueva Gráfica','position',[20 15 150 25],...
        'fontweight','bold','fontsize',9,'callback',@nueva,'backgroundcolor',[0.8 0.8 0.95]);
    
    
    %% Gráfica
    hp=plot(x,y,'linewidth',2);grid;
    xlabel(xlab);
    ylabel(ylab);
    title(encab);
    datacursormode('on');
    
end % Fin selector

%% Funciones
    function selcolor(src,event)
        A=get(scolor,'value');
        M=[0 0 1;
            1 0 0;
            1 1 0;
            1 1 1;
            0 0 0;
            0 1 0;
            1 0 1;
            0.902 0.373 0;
            0.97 0.75 0.74;
            0.7 0.7 0.7];
        set(hp,'color',M(A,:));
    end
    function selgrosor(src,event)
        B=get(sgrosor,'value');
        set(hp,'linewidth',B);
    end

    function selestilo(src,event)
        C=get(sestilo,'value');
        switch C
            case 1
                set(hp,'LineStyle','-');
            case 2
                set(hp,'LineStyle','--');
            case 3
                set(hp,'LineStyle',':');
            case 4
                set(hp,'LineStyle','-.');
        end
    end

    function gtabla(src,event,xlab,ylab)
        vx=get(hp,'xdata');
        vy=get(hp,'ydata');
        tablaValores(vx,vy,xlab,ylab);
    end

    function importar(~,~)
        [filename, pathname] = uigetfile('*.txt', 'Seleccione un archivo de datos');
        if isequal(filename,0)
            return;
        else
            archivo=fullfile(pathname, filename);
            datos=importdata(archivo);
            set(hp,'xdata',datos(:,1),'ydata',datos(:,2));
        end
    end

    function gimagen(src,event)
        [filename, pathname] = uiputfile('*.png','Guardar gráfica como...');
        if isequal(filename,0) || isequal(pathname,0)
            return;
        else
            faux=figure('visible','off');
            aux=axes('parent',faux);
            copyobj(hp,aux);
            saveas(faux,fullfile(pathname,filename));
            delete(faux);
        end
    end

    function selfondo(src,event)
        D=get(scfond,'value');
        M=[0 0 1;
            1 0 0;
            1 1 0;
            1 1 1;
            0 0 0;
            0 1 0;
            1 0 1;
            0.902 0.373 0;
            0.97 0.75 0.74;
            0.7 0.7 0.7];
        set(ax,'color',M(D,:));
    end

    function modlab(~,~)
        conf.Interpreter='tex';
        prompt={'Etíqueta eje horizontal','Etiqueta eje vertical','Titulo'};
        name='MFITEC';
        numlines=1;
        defaultanswer={get(get(ax,'xlabel'),'str'),get(get(ax,'ylabel'),'str'),get(get(ax,'title'),'str')};
        val=inputdlg(prompt,name,numlines,defaultanswer,conf);
        if ~isempty(val)
            set(get(ax,'xlabel'),'str',val{1});
            set(get(ax,'ylabel'),'str',val{2});
            set(get(ax,'title'),'str',val{3});
        else
            return
        end
    end

    function rejilla(src,~)
        k=get(src,'value');
        if k==1
            grid('on');
        else
            grid('off');
        end
    end

    function nueva(~,~)
        conf.Interpreter='tex';
        prompt={'Vector de la variable independiente','Función','Etíqueta eje horizontal','Etiqueta eje vertical'};
        name='MFITEC-Valores para triángulos de velocidades';
        numlines=1;
        defaultanswer={'0:0.01:100','exp(-0.05*x)*sin(x)','x','f(x)'};
        val=inputdlg(prompt,name,numlines,defaultanswer,conf);
        if ~isempty(val)
            x=str2num(val{1});
            y=subs(val{2},'x',x);
            etx=val{3};
            ety=val{4};
            close(gcf);
            grafica(x,y,etx,ety,'');
        else
            warndlg('Operación cancelada','MFITEC');
            return;
        end
    end
end % Fin Función