% Set initial seed
rng(1)

% 1. Study of random processes
Ts = 0.01; t = 0:Ts:1; x1 = rand(1, length(t));

% 1.1. White noise (step = 0.01)
f1 = figure(1);
subplot(2, 2, 1);
plot(t, x1, 'LineWidth', 2, 'Color', '#e37f14');
grid on; title('White noise, step = 0.01');
xlabel('Time, (s)'); ylabel('Function y(t)');

% 1.2. White noise histogram 
subplot(2, 2, 2);
histogram(x1, t);
grid on; title('White noise histogram, step = 0.01');
xlabel('Value of y(t)'); ylabel('Frequency');

% 1.3 White noise (step = 0.001)
Ts = 0.001; t = 0:Ts:1; x2 = rand(1, length(t));
subplot(2, 2, 3);
plot(t, x2, 'LineWidth', 2, 'Color', '#e37f14');
grid on; title('White noise, step = 0.001');
xlabel('Time, (s)'); ylabel('Function y(t)');

% 1.4. White noise histogram
subplot(2, 2, 4);
histogram(x2, t, 'FaceColor', "#0072BD");
grid on; title('White noise histogram, step = 0.001');
xlabel('Value of y(t)'); ylabel('Frequency');
saveas(f1, "1_1-1_4-noise-histogram.png");

%1.5. Digital filter
f2 = figure(2);
Ts = 0.01;
om0 = 2*pi; dz = 0.005; A = 1; oms = om0 * Ts;
a(1) = 1+2*dz*oms+oms^2; a(2) = -2*(1+dz*oms); a(3) = 1; b(1) = A*2*oms^2; 
t=0:Ts:50; x1 = rand(1, length(t)); y1 = filter(b, a, x1);
subplot(2, 1, 1);
plot(t, y1, 'LineWidth', 2, 'Color', '#0072BD');
grid on; title('Filtering noise with a second-order filter, step = 0.01');
xlabel('Time, (s)'); ylabel('Function y(t)');

Ts = 0.001;
om0 = 2*pi; dz = 0.005; A = 1; oms = om0 * Ts;
a(1) = 1+2*dz*oms+oms^2; a(2) = -2*(1+dz*oms); a(3) = 1; b(1) = A*2*oms^2; 
t=0:Ts:50; x2 = rand(1, length(t)); y2 = filter(b, a, x2);
subplot(2, 1, 2);
plot(t, y2, 'LineWidth', 2, 'Color', '#77AC30');
grid on; title('Filtering noise with a second-order filter, step = 0.001');
xlabel('Time, (s)'); ylabel('Function y(t)');
saveas(f2, "1_5-1_6_white_noise_filter.png");









