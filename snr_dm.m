clc;
clear;
 
% ----- Fixed Inputs (change as needed) -----
a = 1;        % Amplitude
fm = 100;     % (modulating) frequency in Hz
fs = 1000;    % Sampling frequency in Hz
 
% ----- Calculations -----
ts = 1/fs;                          % Sampling interval
delta = 2 * pi * a * fm * ts;       % Step size (no slope overload)
 
P_signal = (a^2) / 2;               % Signal power
sigma_q = (delta^2) / 3;            % Quantization noise
 
% Standard DM SNR approximation
SNR = (3/2) * (fs/fm)^2;            % More accepted formula
SNR_dB = 10 * log10(SNR);
 
% ----- Output -----
fprintf('\nDelta Modulation SNR\n');
fprintf('Amplitude (a): %.2f\n', a);
fprintf('Message frequency (fm): %.2f Hz\n', fm);
fprintf('Sampling frequency (fs): %.2f Hz\n', fs);
fprintf('Step size (delta): %.5f\n', delta);
fprintf('SNR (linear): %.2f\n', SNR);
fprintf('SNR (dB): %.2f dB\n', SNR_dB);