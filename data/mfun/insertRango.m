function X = insertRango(var,dresp)
% Permite seleccionar un rango a graficar.
% Argumentos de entrada:
%          var   -  Nombre y unidades de la variable independiente
%          dresp -  Rango asignado por defecto
% Ejemplo:
%          >>insertRango('Q (l/s)',1:100);
%
% $ Por: Jorge De Los Santos $
% $ Rev. 1.0 $ 02/12/13 $

cad=horzcat('Inserte el rango para ',var);
conf.Interpreter='tex';
A=inputdlg({cad},'MFITEC',1,{dresp},conf);
if ~isempty(A)
    X=str2num(A{1});
else
    X=NaN;
end
end