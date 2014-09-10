function [c,a,b,n] = bisection_3(f,a,b,fa,fb,atol)
% number of iterations
n = ceil(log2(b-a)-log2(2*atol));

% do the correct number of iterations
for i = 1:n
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

% this will be more accurate because this guarantees the root is no more than
% atol/2 away from c (could be atol away from a or b)
c = (a+b)/2;
