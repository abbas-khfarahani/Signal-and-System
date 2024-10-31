ts = 1e-9;
T = 1e-5;
tau = 1e-6;

t = 0:ts:T;
signal = zeros(1,length(t));

for a = 1:(tau/ts)
    signal(1,a) = 1;
end



ts = 1e-9;
T = 1e-5;
tau = 1e-6;
R = 450;
speed = 3e8;

t = 0:ts:T;
ansSignal = zeros(1,length(t));

td = (R*2)/speed;
td = round(td, 9);


t1=(td/T)*length(t);
t1 = round(t1,0);
for a = t1:(tau/ts)+t1
    ansSignal(1,a) = 0.5;
end

sumVector = zeros(1,length(t));
invrAnsSignal = ansSignal';

for s = 1:length(signal)
    y = circshift(signal,s);
    sumd = y*invrAnsSignal;
    sumVector(1,s) = sumd; 
end

[Mr, Mc] = max(sumVector);

td1 = (Mc/length(signal))*T;
R0 = td1*speed/2;


% add noise
for a = 0.01:0.01:5
    temp = 1;
    meanError = zeros(1, length(a));
    ErrorVector = zeros(1,100);
    for n = 1:100
        
        ansSignal = ansSignal + a*randn(1, length(ansSignal));
        plot(t,ansSignal);
   


        
        sumVector = zeros(1,length(t));
        invrAnsSignal = ansSignal';
        
        for s = 1:length(signal)
            y = circshift(signal,s);
            sumd = y*invrAnsSignal;
            sumVector(1,s) = sumd; 
        end
        
        [Mr, Mc] = max(sumVector);
        
        td1 = (Mc/length(signal))*T;
        R1 = td1*speed/2;

        distanceError = R1-R0;
        ErrorVector(1,n) = distanceError;


    end
    Mean = mean(ErrorVector);
    meanError(1,temp) = Mean;
    temp = temp +1;
end

plot(meanError);
