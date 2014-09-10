% LAGRANGE_WEIGHTS
% Lagrange interpolation weights:
%       w_{j} = 1 / \prod_{i=0, i \ne j}^{n}(x_{j}-x_{i})
%
% INPUTS:
% x   abscissae [array of size n]
%
% OUTPUTS:
% w   interpolation weights [array of size n]
function [w] = lagrange_weights(x)

% number of abscissae
n = length(x);

% storage of the weights
w = ones(n,1);

% loop through abscissae
for j = 1:n

  % compute the product
  for i = 1:n
    if i ~= j
      w(j) = w(j) * (x(j)-x(i));
    end
  end

  % invert the product so we store the correct quantity
  w(j) = 1 / w(j);
end
