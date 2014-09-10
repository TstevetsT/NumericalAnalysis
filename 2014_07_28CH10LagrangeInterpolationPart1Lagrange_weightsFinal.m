function w = Lagrange_weights(x)

m = length(x); % really m = n+1 in our formulas

% chooses the w(k) we are working on
for k = 1:m
    w(k) = 1;
    % computes the given w(k)
    for j=1:m
        if j ~= k
            w(k) = w(k) * (x(k)-x(j));
        end
    end
end