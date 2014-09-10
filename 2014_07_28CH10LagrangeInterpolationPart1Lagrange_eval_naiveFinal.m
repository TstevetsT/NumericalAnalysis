function Pn = Lagrange_eval_naive(z,x,y,w)

m = length(x);

% compute the sum in the interpolation
for k = 1:m
    
    % computes the Lk for this point
    Lk = 1;
    % computes the given w(k)
    for j=1:m
        if j ~= k
            Lk = Lk * (z-x(j));
        end
    end
    Lk = Lk / w(k); 
end