clear

% define the symbolic variables
syms x a b

% define the points
x0 = a;
x1 = (a+b)/2;
x2 = b;

% define the polynomials
L0 = (x-x1)*(x-x2)/((x0-x1)*(x0-x2));
L1 = (x-x0)*(x-x2)/((x1-x0)*(x1-x2));
L2 = (x-x0)*(x-x1)/((x2-x0)*(x2-x1));

% integrate to get the quadrature weights
a0 = int(L0,x,a,b);
a1 = int(L1,x,a,b);
a2 = int(L2,x,a,b);
