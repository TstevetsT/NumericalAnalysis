% First we will test that we can interpolate a few simple polynomials
clear

f = @(x) 1+x-x.^2;
x = linspace(-1,1,3);    % These are the abscissae
z = linspace(-1,1,1001); % These are the evaluation points

w = lagrange_weights(x);
g = lagrange_eval_naive(z,x,f(x),w);

disp(max(abs(g-f(z))))
plot(z,g-f(z))
title('error in interpolating 2nd order polynomial');

% Higher order polynomial
clear

f = @(x) 1+x-x.^2+x.^10;
x = linspace(-1,1,11);    % These are the abscissae
z = linspace(-1,1,1001); % These are the evaluation points

w = lagrange_weights(x);
g = lagrange_eval_naive(z,x,f(x),w);

disp(max(abs(g-f(z))))
plot(z,g-f(z),'--')
title('error in interpolating 10th order polynomial');

% Interpolate a known function with increasing numbers of points
clear

f = @(x) sin(x);
z = linspace(-pi,pi,1001); % These are the evaluation points

for n = 0:20
  x = linspace(-pi,pi,n+1);

  w = lagrange_weights(x);
  g = lagrange_eval_naive(z,x,f(x),w);

  disp(max(abs(g-f(z))))
  plot(z,f(z),z,g,x,f(x),'*');
  legend('sin(x)','interpolant');
  axis tight
  pause
end

% Interpolate a known function with an equally spaced grid and lots of points
clear

f = @(x) sin(x);
z = linspace(-pi,pi,1001); % These are the evaluation points

n = 75;
x = linspace(-pi,pi,n+1);

w = lagrange_weights(x);
g = lagrange_eval_naive(z,x,f(x),w);

disp(max(abs(g-f(z))))
plot(z,f(z),z,g,x,f(x),'*');
legend('sin(x)','interpolant');
axis tight

