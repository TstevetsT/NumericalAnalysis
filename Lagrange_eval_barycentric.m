function Pn = Lagrange_eval_barycentric(z,x,y,w)

m = length(x);

% looping through all the evaluation points
for j = 1:length(z)
    numer = 0;
    denom = 0;
    
    % compute the numerator and denominator sums
    for k = 1:m
        
        % check to see if z is one of my interpolation points
        if abs(z(j) - x(k)) < eps
            numer = y(k);
            denom = 1;
            break;
        end
        
        % compute the actual sums
        numer = numer + y(k)*w(k)/(z(j)-x(k));
        denom = denom +      w(k)/(z(j)-x(k));
    end
    Pn(j) = numer ./ denom;
end