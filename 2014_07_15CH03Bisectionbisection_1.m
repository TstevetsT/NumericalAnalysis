function [c,a,b,n] = bisection_1(f,a,b,atol)

% number of iterations
n = 0;

% until we meet the tolerance loop
while(b-a > atol)
  % increase iteration count
  n = n+1;

  % compute mid point
  c = (b+a)/2;

  % if f(a) and f(c) have oposite signs replace b
  % else replace a
  if f(a)*f(c) <= 0
    b  = c;
  else
    a  = c;
  end
end
