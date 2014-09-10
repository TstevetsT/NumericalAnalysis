function [c,a,b,n] = bisection_2(f,a,b,fa,fb,atol)

% number of iterations
n = 0;

% until we meet the tolerance loop
while(b-a > atol)
  % increase iteration count
  n = n+1;

  % compute mid point
  c = (b+a)/2;
  fc = f(c);

  % if fa and fc have oposite signs replace b
  % else replace a
  if fa*fc <= 0
    b  = c;
    fb = fc;
  else
    a  = c;
    fa = fc;
  end
end
