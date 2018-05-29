% lorentz_3D.m
% Atractor de Lorentz 3D
N = 10000;
X = zeros(1,N); Y = zeros(1,N); Z = zeros(1,N);
X(1)=0; Y(1)=1; Z(1)=2; delta=0.005;

for n=1:N-1
    X(n+1) = X(n) + delta * 10*(Y(n)-X(n));
    Y(n+1) = Y(n) + delta * (28*X(n) - Y(n) - X(n)*Z(n));
    Z(n+1) = Z(n) + delta * (X(n)*Y(n) - (8/3)*Z(n));
end

figure; plot3(X,Y,Z); grid on;
title('Atractor de Lorentz 3D');

S1 = [X; Y; Z];

% Variaciones de Z(1)
Z(1)=2.001; X(1)=0; Y(1)=1;
for n=1:N-1
    X(n+1) = X(n) + delta * 10*(Y(n)-X(n));
    Y(n+1) = Y(n) + delta * (28*X(n) - Y(n) - X(n)*Z(n));
    Z(n+1) = Z(n) + delta * (X(n)*Y(n) - (8/3)*Z(n));
end
S2 = [X; Y; Z];

Z(1)=2.000001; X(1)=0; Y(1)=1;
for n=1:N-1
    X(n+1) = X(n) + delta * 10*(Y(n)-X(n));
    Y(n+1) = Y(n) + delta * (28*X(n) - Y(n) - X(n)*Z(n));
    Z(n+1) = Z(n) + delta * (X(n)*Y(n) - (8/3)*Z(n));
end
S3 = [X; Y; Z];

% Para visualizar con traza(S1,S2,S3)
