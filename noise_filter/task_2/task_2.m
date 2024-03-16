% Set initial seed
rng(1)

% 2. MAF Filter
R = 50; m = 0:1:R-1; s = 2*m.*(0.9.^m); 

% 2.1. Normal signal
f1 = figure(1);
subplot(2, 2, 1);
stem(m, s);
grid on; title('Original Signal');
xlabel('Time index n'); ylabel('Amplitude');

% 2.2 Noise signal
d = rand(1, length(m)) - 0.5;
subplot(2, 2, 2);
plot(m, d, 'LineWidth', 2, 'Color', '#e37f14');
grid on; title('Noise Signal');
xlabel('Time index n'); ylabel('Amplitude');

% 2.3 Normal & Noise signals together
subplot(2, 2, 3);
plot(m, s, 'LineWidth', 2, 'Color', '#0072BD'); hold on 
plot(m, d, 'LineWidth', 2, 'Color', '#e37f14'); hold off
grid on; title('Original and Noise Signal'); xlabel('Time index n');
legend('Original signal','Noise signal');    ylabel('Amplitude');

% 2.4. Sum of the signals x = s + d
x = s + d;  
subplot(2, 2, 4);
plot(m, s, 'LineWidth', 2, 'Color', '#0072BD'); hold on 
plot(m, x, 'LineWidth', 2, 'Color', 'red'); hold off
grid on; title('Original signal and its sum with the Noise signal'); 
xlabel('Time index n');  ylabel('Amplitude');
legend('Original signal','Sum (s + d)');   
saveas(f1, "2_1-2_4_original_signal.png");

%2.5 MAF Filter (M = 3)
f2 = figure(2);
M = 3; b = ones(M, 1) / M; y = filter(b, 1, x);
subplot(2, 2, 1);
plot(m, s, 'LineWidth', 2, 'Color', '#0072BD'); hold on 
plot(m, x, 'LineWidth', 2, 'Color', 'red');     hold on
plot(m, y, 'LineWidth', 2, 'Color', '#77AC30'); hold off
grid on; title('Moving Average Filter, M = 3'); 
xlabel('Time index n');  ylabel('Amplitude');
legend('Original signal','Sum (s + d)', 'Filtered signal');  

M = 5; b = ones(M, 1) / M; y = filter(b, 1, x);
subplot(2, 2, 3);
plot(m, s, 'LineWidth', 2, 'Color', '#0072BD'); hold on 
plot(m, x, 'LineWidth', 2, 'Color', 'red');     hold on
plot(m, y, 'LineWidth', 2, 'Color', '#77AC30'); hold off
grid on; title('Moving Average Filter, M = 5'); 
xlabel('Time index n');  ylabel('Amplitude');
legend('Original signal','Sum (s + d)', 'Filtered signal');  

M = 10; b = ones(M, 1) / M; y = filter(b, 1, x);
subplot(2, 2, [2 4]);
plot(m, s, 'LineWidth', 2, 'Color', '#0072BD'); hold on 
plot(m, x, 'LineWidth', 2, 'Color', 'red');     hold on
plot(m, y, 'LineWidth', 2, 'Color', '#77AC30'); hold off
grid on; title('Moving Average Filter, M = 10'); 
xlabel('Time index n');  ylabel('Amplitude');
legend('Original signal','Sum (s + d)', 'Filtered signal'); 
saveas(f2, "2_5-2_6_MAF.png");

% 2.6. Sawtooth
f3 = figure(3);
R = 1; m = 0:0.001:R; s = 2*sawtooth(3*pi*m+pi/6); 
d = rand(1, length(m)) - 0.5; x = s + d;

M = 20; b = ones(M, 1) / M; y = filter(b, 1, x);
subplot(2, 2, 1);
plot(m, x, 'LineWidth', 2, 'Color', '#EDB120'); hold on
plot(m, s, 'LineWidth', 2, 'Color', 'red');     hold on 
plot(m, y, 'LineWidth', 2, 'Color', '#77AC30'); hold off
grid on; title('Moving Average Filter, M = 20'); 
xlabel('Time index n');  ylabel('Amplitude');
legend('Sum (s + d)', 'Original signal', 'Filtered signal'); 

M = 50; b = ones(M, 1) / M; y = filter(b, 1, x);
subplot(2, 2, 3);
plot(m, x, 'LineWidth', 2, 'Color', '#EDB120'); hold on
plot(m, s, 'LineWidth', 2, 'Color', 'red');     hold on 
plot(m, y, 'LineWidth', 2, 'Color', '#77AC30'); hold off
grid on; title('Moving Average Filter, M = 50'); 
xlabel('Time index n');  ylabel('Amplitude');
legend('Sum (s + d)', 'Original signal', 'Filtered signal'); 

M = 100; b = ones(M, 1) / M; y = filter(b, 1, x);
subplot(2, 2, [2 4]);
plot(m, x, 'LineWidth', 2, 'Color', '#EDB120'); hold on
plot(m, s, 'LineWidth', 2, 'Color', 'red');     hold on 
plot(m, y, 'LineWidth', 2, 'Color', '#77AC30'); hold off
grid on; title('Moving Average Filter, M = 100'); 
xlabel('Time index n');  ylabel('Amplitude');
legend('Sum (s + d)', 'Original signal', 'Filtered signal'); 

saveas(f3, "2_7-2_8_MAF_Sawtooth.png");










