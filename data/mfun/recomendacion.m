function recomendacion(tipo)
% Muestra una recomendación al iniciar el programa, dependiendo el tipo de
% problema seleccionado.
% 
% [SIN UTILIZAR...]
% 
% $ Por: Jorge De Los Santos $
% $ Rev. 1.1 $ 17/12/13 $
fondoc=randi([5,10],1,3)/10;
f=figure('MenuBar','none','NumberTitle','off','Name','MFITEC-Recomendación...','color',fondoc,...
    'pos',[200 300 300 120],'resize','off','CloseRequestFcn',@cerrar);
centerfig(f);

if tipo==1
    A=load('BC.mat');
    texto=A.R{randi([1,11])}{1};
elseif tipo==2
    A=load('TR.mat');
    texto=A.R{randi([1,6])}{1};
elseif tipo==3
    A=load('TA.mat');
    texto=A.R{randi([1,6])}{1};
end

matcolor(:,:,1)=randi([1,15],100,30);
matcolor(:,:,2)=randi([1,100],100,30);
matcolor(:,:,3)=randi([1,100],100,30);
matcolor=uint8(matcolor);
cfuente=randi([1,3],1,3)/10;

uicontrol('style','text','str',texto,'units','norm','pos',[0.18 0.04 0.81 0.92],...
    'HorizontalAlignment','center','FontName','Arial','FontWeight','b','FontSize',9,...
    'BackGroundColor',fondoc,'ForeGroundColor',cfuente);
uicontrol('style','push','str','','units','norm','pos',[0 0 0.15 1],...
    'BackGroundColor','k','cdata',matcolor,'callback',@mnsb);
N=uicontrol('style','checkbox','String','No mostrar recomendación','Position',[100 20 160 20],...
    'backgroundcolor',fondoc);

    function cerrar(~,~)
        K=get(N,'Value');
        if K==1
            save('data/mfun/mostrec.mat','K');
            delete(gcf);
        else
            delete(gcf);
        end
    end
    function mnsb(~,~)
       helpdlg('Bienvenido a MFITEC, consulte la sección de Ayuda.','MFITEC');
    end
end