function m = Funcion_Calcula_Hu(F)

% Cálculo de momentos Hu. El resultado es un vector columna con los 7
% momentos de Hu calculados sobre la imagen F.


if (ndims(F) ~= 2) | issparse(F) | ~isreal(F) | ~(isnumeric(F) | islogical(F))
    error(['F must be a 2-D, real, nonsparse, numeric or logical matrix']);
end

F = double(F);

[M, N] = size(F);
[x, y] = meshgrid(1:N, 1:M);

x = x(:);
y = y(:);
F = F(:);

m.m00 = sum(F);

if (m.m00 == 0)
    m.m00 = eps;
end

m.m10 = sum(x .* F);
m.m01 = sum(y .* F);
m.m11 = sum(x .* y .* F);
m.m20 = sum(x.^2 .* F);
m.m02 = sum(y.^2 .* F);
m.m30 = sum(x.^3 .* F);
m.m03 = sum(y.^3 .* F);
m.m12 = sum(x .* y.^2 .* F);
m.m21 = sum(x.^2 .* y .* F);



%DIP equations (11.3-14) through (11.3-16).
xbar = m.m10 / m.m00;
ybar = m.m01 / m.m00;

e.eta11 = (m.m11 - ybar*m.m10) / m.m00^2;
e.eta20 = (m.m20 - xbar*m.m10) / m.m00^2;
e.eta02 = (m.m02 - ybar*m.m01) / m.m00^2;
e.eta30 = (m.m30 - 3 * xbar * m.m20 + 2 * xbar^2 * m.m10) / m.m00^2.5;
e.eta03 = (m.m03 - 3 * ybar * m.m02 + 2 * ybar^2 * m.m01) / m.m00^2.5;
e.eta21 = (m.m21 - 2 * xbar * m.m11 - ybar * m.m20 + 2 * xbar^2 * m.m01) / m.m00^2.5;
e.eta12 = (m.m12 - 2 * ybar * m.m11 - xbar * m.m02 + 2 * ybar^2 * m.m10) / m.m00^2.5;



%DIP equations (11.3-17) throught (11.3-23).
phi(1) = e.eta20 + e.eta02;
phi(2) = ((e.eta20 - e.eta02)^2) + 4 * e.eta11^2;
phi(3) = (e.eta30 - 3 * e.eta12)^2 + (3 * e.eta21 - e.eta03)^2;
phi(4) = (e.eta30 - e.eta12)^2 + (e.eta21 - e.eta03)^2;
% phi(4) = (e.eta30 + e.eta12)^2 + (e.eta21 + e.eta03)^2;
phi(5) = (e.eta30 - 3 * e.eta12) * (e.eta30 + e.eta12) * ( (e.eta30 + e.eta12)^2 -  3 * (e.eta21 + e.eta03)^2 ) + (3 * e.eta21 - e.eta03) * (e.eta21 + e.eta03) * ( 3 * (e.eta30 + e.eta12)^2 -  (e.eta21 + e.eta03)^2 );
phi(6) = (e.eta20 - e.eta02) * ( (e.eta30 + e.eta12)^2 - (e.eta21 + e.eta03)^2 ) + 4 * e.eta11 * (e.eta30 + e.eta12) * (e.eta21 + e.eta03);
%phi(7) = ( 3 * e.eta21 - e.eta03) * (e.eta30 + e.eta12) * ( (e.eta30 + e.eta12)^2 - 3 * (e.eta21 + e.eta03)^2) + (3 * e.eta12 - e.eta30) * (e.eta21 + e.eta03) * (3 * (e.eta30 + e.eta12)^2 - (e.eta21 + e.eta03)^2 );
phi(7) = ( 3 * e.eta21 - e.eta30) * (e.eta30 + e.eta12) * ( (e.eta30 + e.eta12)^2 - 3 * (e.eta21 + e.eta03)^2) +(3 * e.eta21 - e.eta03) * (e.eta21 + e.eta03) * (3 * (e.eta30 + e.eta12)^2 - (e.eta21 + e.eta03)^2 );



for i=1:7
    phi(i) = phi(i);
end

for k=1:7
                
   if phi(k)==0
      phi(k)=1e-100;
   end

end
            
m=abs(log(abs(phi)));

m=m';