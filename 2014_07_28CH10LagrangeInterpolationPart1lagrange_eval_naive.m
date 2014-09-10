% LAGRANGE_EVAL_NAIVE
% A naive implementation of the Lagrange interpolation function
%
% INPUTS:
% z   evaluation points [array of size m]
% x   abscissae [array of size n]
% y   function values at x(j) [array of size n]
% w   weights as computed using the Lagrange_weights functions [array of size n]
%
% OUTPUTS:
% f   interpolation to the points [array of size m]
function [f] = lagrange_eval_naive(z,x,y,w)

% number of abscissae
n = length(x);

f = zeros(size(z));

% loop through the evaluation points
for k = 1:length(z)

  % loop through the abscissae
  for j = 1:n

    % compute Lagrange polynomials L_{j} at z(k)
    Lj = w(j);
    for i = 1:n
      if i ~= j
        Lj = Lj * (z(k)-x(i));
      end
    end

    % Add this into the cumulative functions sum
    f(k) = f(k) + y(j) * Lj;
  end
end
