% 1. Verify Sampling Theorem

clear;
clc;
close all;

%SignalGeneration(Continuous)
f=10;       %Frequencyofmessagesignal
T=1/f;      %Period

fs=10*f;                 %Sampling frequency(fs>2f)
t=0:1/(100*f):2*T;      %Time vector (high resolution)
x=cos(2*pi*f*t);        %Original Signal

%Sampling
Ts=1/fs;            %Sampling period
ns=0:Ts:2*T;        %Sampling instants
xs=cos(2*pi*f*ns);  %Sampled signal
    
%Discrete Train of Pulses
pulse_discrete=ones(size(ns));  %impulsesatsamplingpoints

%Reconstruction using SincInterpolation
xr=zeros(size(t));
for i=1:length(ns)
xr=xr+xs(i)*sinc(fs*(t -ns(i)));
end

% Plotting
figure;
subplot(4,1,1);
plot(t,x);
title('OriginalSignal');
subplot(4,1,2);
stem(ns,pulse_discrete,'k','filled');
title('DiscreteTrainofPulses');
subplot(4,1,3);
stem(ns,xs,'r','filled'); 
title('SampledSignal');
subplot(4,1,4);
plot(t,xr);
title('ReconstructedSignal')
