% log_precision.m
% Evaluación de log(1+x) en distintas precisiones

n = 4:-0.25:-8;
x = 10.^n;
y = log(1+x);

xs = single(x);
y1 = log(1+xs);

error_rel = abs((y1 - y)./y);
figure; loglog(x, error_rel,'bo-'); grid on;
xlabel('x'); ylabel('Error relativo');
title('Error relativo de log(1+x) en simple precisión');

% Algoritmo compensado
s = 1 + xs;
y2 = xs;
idx = s ~= 1;
y2(idx) = xs(idx) .* log(s(idx)) ./ (s(idx)-1);
error_rel2 = abs((y2 - y)./y);

hold on; loglog(x, error_rel2,'r--'); hold off;
legend('Fórmula directa','Algoritmo corregido');
