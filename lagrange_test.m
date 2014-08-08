clear

% Test to make sure we can 
% interpolate a polynomial without error
f = @(x) x.^3 + x - 1;
x = linspace(-1,1,4); % interpolation points
y = f(x);

% evaluation points
z = linspace(-1,1,1001);

% construct Lagrange weights
w = Lagrange_weights(x);

% evaluate interpolant
Pn = Lagrange_eval_barycentric(z,x,y,w);

% check the error
disp(max(Pn-f(z)));

plot(z,Pn,z,f(z),x,y,'*');
legend('interpolant','exact','interpolation points')
pause

clear

for n = 0:20
    % interpolate a more interesting function
    f = @(x) log(sin(x).^2+0.1);
    x = linspace(-1,1,n+1); % interpolation points
    y = f(x);
    
    % evaluation points
    z = linspace(-1,1,1001);
    
    % construct Lagrange weights
    w = Lagrange_weights(x);
    
    % evaluate interpolant
    Pn = Lagrange_eval_barycentric(z,x,y,w);
    
    % check the error
    disp(max(abs(Pn-f(z))));
    
    plot(z,Pn,z,f(z),x,y,'*');
    legend('interpolant','exact','interpolation points')
    pause
end






clear

n = 10000;
% interpolate a more interesting function
f = @(x) log(sin(x).^2+0.1);
x = linspace(-1,1,n+1); % interpolation points
y = f(x);

% evaluation points
z = linspace(-1,1,1001);

% construct Lagrange weights
w = Lagrange_weights(x);

% evaluate interpolant
tic
Pn = Lagrange_eval_barycentric(z,x,y,w);
toc

tic
Pn = Lagrange_eval_naive(z,x,y,w);
toc




















