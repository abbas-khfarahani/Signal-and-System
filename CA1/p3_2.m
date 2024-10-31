ts = 1e-9;
T = 1e-5;
tau = 1e-6;
R = 450;
speed = 3e8;

t = 0:ts:T;
signal = zeros(1,length(t));

td = (R*2)/speed;
td = round(td, 9);


t1=(td/T)*length(t);
t1 = round(t1,0);
for a = t1:(tau/ts)+t1
    signal(1,a) = 0.5;
end

plot(t, signal, LineWidth=3);