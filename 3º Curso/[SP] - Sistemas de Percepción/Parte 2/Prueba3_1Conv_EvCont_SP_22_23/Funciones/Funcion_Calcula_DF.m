function FD = Funcion_Calcula_DF(bw,NumDF)
    
m=3;
n=12;

% This is an implementation of:
% "Shape-based image retrieval using generic Fourier descriptors", D.Zhang,
% G. Lu, 2002 % % by Frederik Kratzert 24. Aug 2015


% RELLENAMOS HUECOS
% bw = imfill(bw,'holes');

% CENTRAMOS IMAGEN EN SU CENTROIDE. IMAGEN CUADRADA
bw = funcion_centra_objeto(bw);

%check correct number of inputs
if nargin ~= 2
    error('Wrong number of input arguments');
end

%check if bw is logical
if ~islogical(bw)
    error('The input image must be of type ''logical''');
end

%check input values m,n
if mod(m,1) > 0 || mod(n,1) > 0 || m < 0 || n < 0
    error('Input arguments M and N must be an integer greater or equal to zero');
end

%get object informations
state = regionprops(bw,'Centroid','Extrema');

%error if image contains more than one object
if size(state.Centroid,1) > 1
    error('Image contains more than one object');
end

 sz = size(bw);
% %check if object is centered (with its Centroid) to the image center
% diff = sz/2 - state.Centroid;
% if sum(abs(diff) > 0.5) > 0
%     error('Object is not centered to the image center. See ''help gfd''');
% end

%get the maximal radius maxR
maxR = sqrt((state.Extrema(:,1)-state.Centroid(1)).^2 +...
    (state.Extrema(:,2)-state.Centroid(2)).^2);
maxR = max(maxR);


%meshgrid with origin centered to the image center
N = sz(1);
x = linspace(-N/2,N/2,N);
y = x;
[X,Y] = meshgrid(x,y);

%matrix containing radius of each cell to image center
radius = sqrt(X.^2+Y.^2)/maxR;

%matrix containing angluar of each cell to image center
theta = atan2(Y,X);
theta(theta < 0) = theta(theta <0) + 2*pi;

%Initialize variables
FR = zeros(m+1,n+1);
FI = zeros(m+1,n+1);
FD = zeros((m+1)*(n+1),1);

i = 1;
%loop over all radial frequencies
for rad = 0:m
    
    %loop over all angular frequencies
    for ang = 0:n
        
        %calculate FR and FI for (rad,ang)
        tempR = bw.*cos(2*pi*rad*radius+ang*theta);
        tempI = -1*bw.*sin(2*pi*rad*radius+ang*theta);        
        FR(rad+1,ang+1) = sum(tempR(:));
        FI(rad+1,ang+1) = sum(tempI(:));
        
        %calculate FD, where FD(end)=FD(0,0) --> rad == 0 & ang == 0
        if rad == 0 && ang == 0
            %normalized by circle area
            FD(i) = sqrt((FR(1,1)^2+FR(1,1)^2))/(pi*maxR^2);
            
        else
            %normalized by |FD(0,0)|;
            FD(i) = sqrt(((FR(rad+1,ang+1).^2+FI(rad+1,ang+1).^2)))/sqrt((FR(1,1)^2+FR(1,1)^2));
        end
        i = i+1;
    end
    
    FD = FD(1:NumDF);
    
end



end

function cm = funcion_centra_objeto(bw)

[f , c]= find(bw==1);
fmin = min(f); fmax = max(f);
cmin = min(c); cmax = max(c);

bwObj = bw(fmin:fmax,cmin:cmax);
[N , M] = size(bwObj);

stats = regionprops(bwObj,'Centroid');
% Asumimos que solo hay un objeto
centroides = cat(1,stats.Centroid);
x = round(centroides(1,1));
y = round(centroides(1,2));

DifF1 = length(1:y-1); DifF2 = length(y+1:N);
DifF = DifF1-DifF2;
if DifF<0 % Añadimos la diferencia arriba
    bwObj = [false(abs(DifF),M) ; bwObj];
elseif DifF>0
    bwObj = [bwObj ; false(DifF,M) ];
end

DifC1 = length(1:x-1); DifC2 = length(x+1:M);
DifC = DifC1-DifC2;
if DifC<0 % Añadimos la diferencia a la izda
    bwObj = [false(N+abs(DifF),abs(DifC)) bwObj];
elseif DifC>0
    bwObj = [bwObj false(N+abs(DifF),abs(DifC))];
end

[N , M] = size(bwObj);

% La hacemos cuadrada
Dif = N-M;
if Dif>0 % Hay más filas que columnas. Insertamos esas columnas
    NumColumnasIzda = floor(Dif/2);
    NumColumnasDcha = Dif-NumColumnasIzda;
    cm = [false(N,NumColumnasIzda)  bwObj  false(N,NumColumnasDcha)];
elseif Dif<0 % Hay más columnas. Insertamos filas
    NumFilasArriba = floor(abs(Dif)/2);
    NumFilasAbajo = abs(Dif)-NumFilasArriba;
    cm = [false(NumFilasArriba,M) ; bwObj ; false(NumFilasAbajo,M)];
else
    cm = bwObj;
end
    
Inc = min(floor(N/2),floor(M/2));

cm = padarray(cm,[Inc Inc]);

end


