function triangulos(u1,c1,alpha1,u2,c2,alpha2)
% Traza el diagrama de velocidades a la entrada y salida de una máquina
% hidráulica. Los ángulos alpha1 y alpha2 deben ser introducidos en
% radianes, y las velocidades en m/s.
% 
% $ Por: Jorge De Los Santos $
% $ Rev. 1.1 $ 01/10/13 $
%
if nargin<1
    % Ejecuta la función valores() si los argumentos de entrada son nulos
    % entonces se mostrará un "inputdlg" en donde podrán ingresarse 
    % valores de forma manual.
    valores();
elseif isempty([u1,u2,c1,c2,alpha1,alpha2])
    % Verifica que todos los datos sean proporcionados.
    errordlg('Los datos de entrada no han sido proporcionados','MFITEC');
else
    
    cfondo=[0.9 0.9 0.9]; % color de fondo de la interfaz.
    f=figure('NumberTitle','off','Name','MFITEC - Triángulos de velocidades','MenuBar','None',...
        'color',cfondo,'position',[200,200,800,500],'resize','off');
    centerfig(f);
    
    %% Menú
    uimenu(f,'label','Insertar valores','callback',@valores);
    
    % Axes de los gráficos a mostrar.
    axS=axes('parent',f,'units','pixels','position',[30 30 500 200]);
    axE=axes('parent',f,'units','pixels','position',[30 270 500 200]);
    pp=uipanel(f,'units','pixels','position',[580 30 200 440]);
    
    uicontrol('style','text','String',{'','','E','N','T','R','A','D','A'},...
        'position',[540 280 30 180],'backgroundcolor',cfondo,...
        'fontsize',10,'fontweight','bold');
    uicontrol('style','text','String',{'','','S','A','L','I','D','A'},....
        'position',[540 40 30 180],'backgroundcolor',cfondo,...
        'fontsize',10,'fontweight','bold');
    uicontrol(pp,'style','text','position',[0 220 198 2],...
        'backgroundcolor','k');
    
    % Datos a la entrada 
    uicontrol(pp,'style','pushbutton','String','<html>u<sub>1</sub></html>',...
        'position',[20 400 25 25]);
    du1=uicontrol(pp,'style','text','String','','position',[55 400 80 25],...
        'backgroundcolor',[0.8 0.8 1],'fontsize',13,'fontname','courier');
    uicontrol(pp,'style','text','String','','position',[55 400 80 2],...
        'backgroundcolor','r');
    uicontrol(pp,'style','text','String','m/s','position',[145 400 25 20]);
    
    uicontrol(pp,'style','pushbutton','String','<html>c<sub>1</sub></html>',...
        'position',[20 360 25 25]);
    dc1=uicontrol(pp,'style','text','String','','position',[55 360 80 25],...
        'backgroundcolor',[0.8 0.8 1],'fontsize',13,'fontname','courier');
    uicontrol(pp,'style','text','String','','position',[55 360 80 2],...
        'backgroundcolor','g');
    uicontrol(pp,'style','text','String','m/s','position',[145 360 25 20]);
    
    uicontrol(pp,'style','pushbutton','String','<html>w<sub>1</sub></html>',...
        'position',[20 320 25 25]);
    dw1=uicontrol(pp,'style','text','String','','position',[55 320 80 25],...
        'backgroundcolor',[0.8 0.8 1],'fontsize',13,'fontname','courier');
    uicontrol(pp,'style','text','String','','position',[55 320 80 2],...
        'backgroundcolor','b');
    uicontrol(pp,'style','text','String','m/s','position',[145 320 25 20]);
    
    uicontrol(pp,'style','pushbutton','String','<html>&alpha<sub>1</sub></html>',...
        'position',[20 280 25 25]);
    dalpha1=uicontrol(pp,'style','text','String','','position',[55 280 80 25],...
        'backgroundcolor',[0.8 0.8 1],'fontsize',13,'fontname','courier');
    uicontrol(pp,'style','text','String','','position',[55 280 80 2],...
        'backgroundcolor','y');
    uicontrol(pp,'style','text','String','°','position',[145 285 25 20],'fontsize',14);
    
    uicontrol(pp,'style','pushbutton','String','<html>&beta<sub>1</sub></html>',...
        'position',[20 240 25 25]);
    dbeta1=uicontrol(pp,'style','text','String','','position',[55 240 80 25],...
        'backgroundcolor',[0.8 0.8 1],'fontsize',13,'fontname','courier');
    uicontrol(pp,'style','text','String','','position',[55 240 80 2],...
        'backgroundcolor','m');
    uicontrol(pp,'style','text','String','°','position',[145 245 25 20],'fontsize',14);
    
    % Datos a la salida
    uicontrol(pp,'style','pushbutton','String','<html>u<sub>2</sub></html>',...
        'position',[20 180 25 25]);
    du2=uicontrol(pp,'style','text','String','','position',[55 180 80 25],...
        'backgroundcolor',[0.8 0.8 1],'fontsize',13,'fontname','courier');
    uicontrol(pp,'style','text','String','','position',[55 180 80 2],...
        'backgroundcolor','r');
    uicontrol(pp,'style','text','String','m/s','position',[145 180 25 20]);
    
    uicontrol(pp,'style','pushbutton','String','<html>c<sub>2</sub></html>',...
        'position',[20 140 25 25]);
    dc2=uicontrol(pp,'style','text','String','','position',[55 140 80 25],...
        'backgroundcolor',[0.8 0.8 1],'fontsize',13,'fontname','courier');
    uicontrol(pp,'style','text','String','','position',[55 140 80 2],...
        'backgroundcolor','g');
    uicontrol(pp,'style','text','String','m/s','position',[145 140 25 20]);
    
    uicontrol(pp,'style','pushbutton','String','<html>w<sub>2</sub></html>',...
        'position',[20 100 25 25]);
    dw2=uicontrol(pp,'style','text','String','','position',[55 100 80 25],...
        'backgroundcolor',[0.8 0.8 1],'fontsize',13,'fontname','courier');
    uicontrol(pp,'style','text','String','','position',[55 100 80 2],...
        'backgroundcolor','b');
    uicontrol(pp,'style','text','String','m/s','position',[145 100 25 20]);
    
    uicontrol(pp,'style','pushbutton','String','<html>&alpha<sub>2</sub></html>',...
        'position',[20 60 25 25]);
    dalpha2=uicontrol(pp,'style','text','String','','position',[55 60 80 25],...
        'backgroundcolor',[0.8 0.8 1],'fontsize',13,'fontname','courier');
    uicontrol(pp,'style','text','String','','position',[55 60 80 2],...
        'backgroundcolor','y');
    uicontrol(pp,'style','text','String','°','position',[145 65 25 20],'fontsize',14);
    
    uicontrol(pp,'style','pushbutton','String','<html>&beta<sub>2</sub></html>',...
        'position',[20 20 25 25]);
    dbeta2=uicontrol(pp,'style','text','String','','position',[55 20 80 25],...
        'backgroundcolor',[0.8 0.8 1],'fontsize',13,'fontname','courier');
    uicontrol(pp,'style','text','String','','position',[55 20 80 2],...
        'backgroundcolor','m');
    uicontrol(pp,'style','text','String','°','position',[145 25 25 20],'fontsize',14);
    
    
    %% Procedimiento de cálculo y trazo para la entrada.
    ux1=[0 u1];
    uy1=[0 0];
    cx1=[0 c1*cos(alpha1)];
    cy1=[0 c1*sin(alpha1)];
    wx1=[0 cx1-ux1]+u1;
    wy1=[0 cy1-uy1];
    w1=norm([cx1-ux1,cy1-uy1]);
    if norm([ux1,uy1])>(c1*cos(alpha1))
        beta1=asin((c1*sin(alpha1))/w1);
    else
        beta1=pi-asin(c1*sin(alpha1)/w1);
    end
    axes(axE);
    hold on
    h1=plot(ux1,uy1,'r',cx1,cy1,'g',wx1,wy1,'b');
    xlim([-1 max([ux1,cx1,wx1])+1]);
    ylim([-1 max([uy1,cy1,wy1])+1]);
    set(h1,'linewidth',2);
    if norm([ux1,uy1])>(c1*cos(alpha1))
        Max1=[0 0.1*c1*cos(alpha1) 0.1*c1*cos(alpha1)];
        May1=[0 0.1*c1*sin(alpha1) 0];
        Mbx1=[u1,u1-0.1*w1*cos(beta1),u1-0.1*w1*cos(beta1)];
        Mby1=[0,0,0.1*w1*sin(beta1)];
        patch(Max1,May1,'y','FaceAlpha',0.7,'EdgeColor','none');
        patch(Mbx1,Mby1,'m','FaceAlpha',0.7,'EdgeColor','none');
    else
        Max1=[0 0.1*c1*cos(alpha1) 0.1*c1*cos(alpha1)];
        May1=[0 0.1*c1*sin(alpha1) 0];
        Mbx1=[u1,u1-0.1*u1,u1-0.1*w1*cos(beta1)];
        Mby1=[0,0,0.1*w1*sin(beta1)];
        patch(Max1,May1,'y','FaceAlpha',0.7,'EdgeColor','none');
        patch(Mbx1,Mby1,'m','FaceAlpha',0.7,'EdgeColor','none');
    end
    %% Procedimiento de cálculo y trazo a la salida
    ux2=[0 u2];
    uy2=[0 0];
    cx2=[0 c2*cos(alpha2)];
    cy2=[0 c2*sin(alpha2)];
    wx2=[0 cx2-ux2]+u2;
    wy2=[0 cy2-uy2];
    w2=norm([cx2-ux2,cy2-uy2]);
    if norm([ux2,uy2])>(c2*cos(alpha2))
        beta2=asin((c2*sin(alpha2))/w2);
    else
        beta2=pi-asin(c2*sin(alpha2)/w2);
    end
    axes(axS);
    hold on
    h2=plot(ux2,uy2,'r',cx2,cy2,'g',wx2,wy2,'b');
    xlim([-1 max([ux2,cx2,wx2])+1]);
    ylim([-1 max([uy2,cy2,wy2])+1]);
    set(h2,'linewidth',2);
    if norm([ux2,uy2])>(c2*cos(alpha2))
        Max2=[0 0.1*c2*cos(alpha2) 0.1*c2*cos(alpha2)];
        May2=[0 0.1*c2*sin(alpha2) 0];
        Mbx2=[u2,u2-0.1*w2*cos(beta2),u2-0.1*w2*cos(beta2)];
        Mby2=[0,0,0.1*w2*sin(beta2)];
        patch(Max2,May2,'y','FaceAlpha',0.7,'EdgeColor','none');
        patch(Mbx2,Mby2,'m','FaceAlpha',0.7,'EdgeColor','none');
    else
        Max2=[0 0.1*c2*cos(alpha2) 0.1*c2*cos(alpha2)];
        May2=[0 0.1*c2*sin(alpha2) 0];
        Mbx2=[u2,u2-0.1*u2,u2-0.1*w2*cos(beta2)];
        Mby2=[0,0,0.1*w2*sin(beta2)];
        patch(Max2,May2,'y','FaceAlpha',0.7,'EdgeColor','none');
        patch(Mbx2,Mby2,'m','FaceAlpha',0.7,'EdgeColor','none');
    end
    
    
    %% Mostrar resultados en los campos asignados a cada magnitud
    % Todos los ángulos se muestran en grados sexagésimales mediante una
    % conversión previa a la salida.
    set(du1,'String',u1);
    set(dc1,'String',c1);
    set(dw1,'String',w1);
    set(dalpha1,'String',alpha1*180/pi);
    set(dbeta1,'String',beta1*180/pi);
    set(du2,'String',u2);
    set(dc2,'String',c2);
    set(dw2,'String',w2);
    set(dalpha2,'String',alpha2*180/pi);
    set(dbeta2,'String',beta2*180/pi);
end

    function valores(~,~)
        % Permite insertar los parámetros de entrada de forma manual.
        %
        conf.Interpreter='tex'; % Configurar intérprete de "TeX" MATLAB
        prompt={'u_1 (m/s)','c_1 (m/s)','\alpha_1 ( ° )','u_2 (m/s)','c_2 (m/s)','\alpha_2 ( ° )'};
        name='MFITEC-Valores para triángulos de velocidades';
        numlines=1;
        defaultanswer={'10','15','90','12','6','45'};
        val=inputdlg(prompt,name,numlines,defaultanswer,conf);
        u1=str2num(val{1});
        c1=str2num(val{2});
        alpha1=str2num(val{3})*pi/180;
        u2=str2num(val{4});
        c2=str2num(val{5});
        alpha2=str2num(val{6})*pi/180;
        close(gcf);
        triangulos(u1,c1,alpha1,u2,c2,alpha2);
    end
end


