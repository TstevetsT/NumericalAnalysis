function f = pred_prey(t,y)

a =  0.25;
b = -0.01;
c = -1;
d =  0.01;

f = zeros(2,1);

% dy1/dt
f(1) = a*y(1) + b*y(1)*y(2);

% dy2/dt
f(2) = c*y(2) + d*y(1)*y(2);