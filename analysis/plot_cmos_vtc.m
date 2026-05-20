% Voltage Transfer Characteristic of a CMOS Inverter
% Data from EEE 202(H) hardware experiment

Vin  = [0 0.5 1.0 1.5 2.0 2.5 2.6 2.7 2.8 2.9 3.0 3.1 3.2 3.3 3.4 3.5 4.0 4.5 5.0];
Vout = [4.82 4.82 4.82 4.82 4.82 4.82 4.82 4.82 4.81 4.70 2.90 0 0 0 0 0 0 0 0];

% Shape-preserving interpolation of the measured curve
xq = linspace(0, 5, 2001);
yq = pchip(Vin, Vout, xq);

% Switching voltage V_M: the point where Vout = Vin (unity-gain line).
% Locate the sign change of (Vout - Vin) and interpolate for sub-grid precision.
d = yq - xq;
k = find(d(1:end-1) .* d(2:end) <= 0, 1, 'first');
VM = xq(k) - d(k) * (xq(k+1) - xq(k)) / (d(k+1) - d(k));

figure;
plot(Vin, Vout, 'o', 'LineWidth', 1.2); hold on;
plot(xq, yq, 'LineWidth', 1.5);
plot([0 5], [0 5], '--', 'LineWidth', 1.2);
plot(VM, VM, 's', 'LineWidth', 1.5, 'MarkerSize', 9);
grid on;
axis([0 5 0 5]);
axis square;
xlabel('V_{in} (V)');
ylabel('V_{out} (V)');
title('Voltage Transfer Characteristic of CMOS Inverter');
legend('Experimental Data', 'Interpolated Curve', 'V_{out} = V_{in}', ...
       'Switching Voltage V_M', 'Location', 'best');
text(VM + 0.1, VM, sprintf('V_M = %.3f V', VM));
