clear

% Test to make sure we can 
% interpolate a polynomial without error
f = @(x) x.^2 + x - 1;
x = linspace(-1,1,3); % interpolation points
y = f(x);

% evaluation points
z = linspace(-1,1,1001);

% construct Lagrange weights
w = Lagrange_weights(x);

% evaluate interpolant
Pn = Lagrange_eval_naive(z,x,y,w);

% check the error
disp(max(Pn-f(z)));