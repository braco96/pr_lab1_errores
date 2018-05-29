% derivada_error.m
% Estudio del error relativo en la derivada numérica de f(x)=sin(x) en x=1

h = 10.^(0:-0.5:-15);
x = 1;
f = @(x) sin(x);
df_approx = (f(x+h) - f(x-h))./(2*h);
error_rel = abs((df_approx - cos(1))/cos(1));

figure;
loglog(h,error_rel,'bo-'); grid on;
xlabel('h'); ylabel('Error relativo');
title('Error relativo de la derivada numérica');

% Cotas teóricas
eps_m = eps;
error_trunc = h.^2;  % O(h^2)
error_round = eps_m./h; % O(eps/h)
cota_global = error_trunc + error_round;

hold on; loglog(h, cota_global, 'r:'); hold off;
legend('Error relativo','Cota teórica');

% Extensión: derivada en [0,2*pi]
xv = 0:0.01:2*pi; h_opt = 1e-3;
df_est = (sin(xv+h_opt) - sin(xv-h_opt))./(2*h_opt);
df_real = cos(xv);

figure; plot(xv, df_real,'b', xv, df_est,'r--');
legend('cos(x)','Derivada estimada');
title('Comparación entre derivada exacta y numérica');

figure; plot(xv, abs(df_real - df_est));
title('Error absoluto en [0, 2π]');
xlabel('x'); ylabel('|Error|');
