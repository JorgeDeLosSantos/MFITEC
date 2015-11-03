function SetLayout(obj,varargin)
% Container.SetLayout
%
% Configura, de forma automática, la distribución de los 
% controles gráficos dentro de un objeto Container.
%
% LAYOUTS DISPONIBLES:
%
%         'vertical'
%         'horizontal'
%         'grid'
% 
% ARGUMENTOS VARIABLES (VARARGIN)
% Para el caso 'vertical' y 'horizontal' habrá de pasarse
% como argumento extra el espacio de separación en pixeles
% entre cada uno de los elementos, de lo contrario se tomará
% el valor de 5px por default.
% 
% Para el tipo 'grid' deben especificarse el espacio de separación,
% el número de filas y el número de columnas. Es 'estrictamente' 
% necesario el colocar todos los argumentos.
% 
% SINTAXIS:
%
%           obj.SetLayout('vertical');
%           obj.SetLayout('vertical',espaciado);
%           obj.SetLayout('grid',espaciado,filas,columnas);
%
% EJEMPLOS:
%
%           app1 = Frame('App 1');
%           app1.SetLayout('grid',10,2,2);
%           ............................
%           app2 = Frame('App 2');
%           app2.SetLayout('vertical',4);
%
%

layout = varargin{1}; % Fijo

if nargin == 5 && or(strcmp(layout,'grid'),strcmp(layout,'g'))
    border = varargin{2};
    rows_ = varargin{3};
    cols_ = varargin{4};
elseif nargin == 3
    border = varargin{2};
elseif nargin == 2 && isa(varargin{1},'struct')
    struct_layout = varargin{1};
    layout = struct_layout.name;
    border = struct_layout.border;
    if strcmp(layout,'grid')
        rows_ = struct_layout.rows;
        cols_ = struct_layout.cols;
    end
else
    border = 5;
end

hcs = findobj('parent',obj.hCont); % array of handles
ncs = length(hcs); % length of " " "

switch lower(layout)
    case {'vertical','v'}
        verticalSizer();
        obj.layout_ = struct('name','vertical',...
            'border',border);
    case {'horizontal','h'}
        horizontalSizer();
        obj.layout_ = struct('name','horizontal',...
            'border',border);
    case {'grid','g'}
        gridSizer();
        obj.layout_ = struct('name','grid',...
            'border',border,...
            'rows',rows_,...
            'cols',cols_);
    otherwise
        warning('Layout no definido');
        verticalSizer(); % Default layout
end

    function verticalSizer
        CW = obj.width_;
        CH = obj.height_;
        ANCHO = (CW-(2*border))/CW;
        ALTO = ((CH/ncs)-(border*((ncs+1)/2)))/CH;
        POSX = border/CW;
        POSY = border/CH;
        
        for i=1:ncs
            set(hcs(i),'units','normalized',...
                'Position',[POSX (i-1)*1/ncs+POSY ANCHO ALTO]);
        end
    end

    function horizontalSizer
        CW = obj.width_; % Container width
        CH = obj.height_; % Container height
        
        ANCHO = ((CW/ncs)-(border*((ncs+1)/2)))/CW;
        ALTO = (CH-(2*border))/CH;
        POSX = border/CW;
        POSY = border/CH;
        
        for i=1:ncs
            set(hcs(i),'units','normalized',...
                'Position',[((i-1)*1/ncs)+POSX POSY ANCHO ALTO]);
        end
    end

    function gridSizer
        k=1;
        for i=1:cols_
            for j=1:rows_
                try
                    set(hcs(k),'units','normalized',...
                        'Position',[(i-1)*(1/cols_) (j-1)*(1/rows_) 1/cols_ 1/rows_]);
                    k = k + 1;
                catch
                    % pass
                end
            end
        end
    end
end