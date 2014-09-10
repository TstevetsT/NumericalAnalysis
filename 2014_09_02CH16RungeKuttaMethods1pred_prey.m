function f = pred_prey(t,y)

f = zeros(2,1);

a = 0.25;
b = -0.01;
c = -1;
d = 0.01;
y1 = y(1);
y2 = y(2);

f1 = a*y1 + b*y1*y2;
f2 = c*y2 + d*y1*y2;


% must return a column vector
f = [f1;f2];
