function [c,n] = bisection(f,a,b,atol)

% checking the sanity of the arguments
if f(a)*f(b) > 0
    c = nan;
    return
end

n = 0;

% Complete following until tolerance met
while abs(b-a) > atol
    n = n + 1;
    
    % computed midpoint
    c = (b+a)/2;
    
    % update the bracket
    if f(a)*f(c) < 0
        b = c;
    elseif f(b)*f(c) < 0
        a = c;
    else
        return;
    end
end