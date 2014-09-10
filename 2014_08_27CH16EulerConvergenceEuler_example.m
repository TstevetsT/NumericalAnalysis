clear

% forcing function and exact solution
f = @(t,y) -y + (1/10)*t;
y_exact = @(t) (11/10)*exp(-t) +(1/10)*(t-1);

% simulation parameters
t0 = 0;
y0 = y_exact(t0);
tf = 1;

for j = 1:10
    N(j) = 2^j;
    h = (tf-t0)/N(j); % step size
    
    % compute updates
    y_FE = y0;
    y_BE = y0;
    t    = t0;
    for k = 1:N(j)
        % update time
        t(k+1) = t(k) + h;
        
        % Forward Euler
        y_FE(k+1) = y_FE(k) + h * f(t(k),y_FE(k));
        
        % Backward Euler
        y_BE(k+1) = (1/(1+h))*y_BE(k) + (h/(h+1))*(1/10)*t(k+1);
    end
    
    err_FE(j) = abs(y_FE(end) - y_exact(tf));
    err_BE(j) = abs(y_BE(end) - y_exact(tf));

end
    
loglog(N,err_FE,N,err_BE)
    
    
    



