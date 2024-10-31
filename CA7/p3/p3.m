clc;
clear all;
syms y(t)
dy = diff(y);
equation = diff(y,t,2) + 3*diff(y,t,1) + 2*y == 5*heaviside(t);
cond1 = y(0) == 1;
cond2 = dy(0) == 1;
conditions = [cond1 cond2];
ySol(t) = dsolve(equation,conditions);
ySol = simplify(ySol);
fprintf("The answer of the differential equation:\n%s\nis\ny(t) = %s\n", equation, ySol);
fplot(ySol, [0, 10]);
