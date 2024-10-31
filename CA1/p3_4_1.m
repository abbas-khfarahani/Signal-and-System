ts = 1e-9;
T = 1e-5;
tau = 1e-6;
R = 450;
speed = 3e8;

t = 0:ts:T;
signal = zeros(1, length(t));
ansSignal = zeros(1, length(t));

% Vectorized signal creation
signal(1:tau/ts) = 1;

% Calculating td and adjusting ansSignal in a vectorized way
td = round((R*2)/speed, 9);
t1 = round((td/T) * length(t), 0);
ansSignal(t1:(tau/ts)+t1) = 0.5;

% Vectorized cross-correlation using xcorr
sumVector = xcorr(signal, ansSignal, 'none');

% Finding maximum correlation
[~, Mc] = max(sumVector);
td1 = (Mc/length(signal))*T;
R0 = td1*speed/2;

% Initialize noise addition parameters
noiseLevels = 0.01:0.01:5;
meanError = zeros(size(noiseLevels));
ErrorVector = zeros(1,100);

for i = 1:length(noiseLevels)
    a = noiseLevels(i);
    for n = 1:100
        % Add noise and calculate distance error in a vectorized manner
        noisySignal = ansSignal + a*randn(size(ansSignal));
        sumVector = xcorr(signal, noisySignal, 'none');
        [~, Mc] = max(sumVector);
        td1 = (Mc/length(signal))*T;
        R1 = td1*speed/2;
        ErrorVector(n) = R1 - R0;
    end
    meanError(i) = mean(ErrorVector);
end

% Plotting the mean error
plot(noiseLevels, meanError);
xlabel('Noise Level');
ylabel('Mean Error');
