ts = 1e-9;
T = 1e-5;
tau = 1e-6;

t = 0:ts:T;
signal = zeros(1,length(t));

for a = 1:(tau/ts)
    signal(1,a) = 1;
end

plot(t, signal, LineWidth=3);