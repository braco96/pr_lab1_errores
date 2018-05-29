% pi_arqimedes.m
% Aproximación de π según Arquímedes

a = zeros(1,15); b = zeros(1,15);
a(1)=2*sqrt(3); b(1)=3;

for k=1:14
    a(k+1) = (2*a(k)*b(k)) / (a(k)+b(k));
    b(k+1) = sqrt(a(k+1)*b(k));
end

figure; plot(a,'r-o'); hold on; plot(b,'b-*'); 
yline(pi,'k--'); legend('a_k','b_k','pi');
title('Aproximación de π por arriba y por abajo');

fprintf('π = %.8f, a(8)=%.8f, b(8)=%.8f\n',pi,a(8),b(8));

error_rel = abs((a - pi)/pi);
figure; semilogy(error_rel,'ro:');
title('Error relativo de a_k respecto a π');

% Promedio de sucesiones
c = (a + b)/2;
error_c = abs((c - pi)/pi);
figure; semilogy(error_rel,'r:', error_c,'b--');
legend('Error a_k','Error c_k');
title('Comparación de errores relativos');
