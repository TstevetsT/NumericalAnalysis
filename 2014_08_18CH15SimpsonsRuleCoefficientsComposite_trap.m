function [I] = composite_trap(f,a,b,num_interval)
h = (b-a)/num_interval;

t0 = a;
I  = 0;
for i = 1:num_interval
  % trapezoidal rule
  I = I + (h/2)*(f(t0)+f(t0+h));

  % advance the interval
  t0 = t0+h;
end
