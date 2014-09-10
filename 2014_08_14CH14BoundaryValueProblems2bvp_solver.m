clear

for j = 1:10
    % number of points to use in approximation
    N = 2*2^j;
    
    D = zeros(N-1,N+1);
    
    for k = 1:N-1
        D(k,k  ) =  1;
        D(k,k+1) = -2;
        D(k,k+2) =  1;
    end
    
    % forcing function
    f = @(x) exp(-x.^2).*(4*x.^2-2);
    
    % create the grid
    x = linspace(0,1,N+1)';
    h(j) = x(2)-x(1);
    
    % set the boundary conditions
    a = 0;
    b = 1;
    
    % exact solution
    qexact = exp(-x.^2) + (b - exp(-1) - a + 1).*x + (a-1);
    
    % create solution vector
    q = zeros(N+1,1);
    q(1) = a;
    q(N+1) = b; % q(end) = b;
    
    % Create RHS vector
    b = h(j)^2*f(x(2:end-1)) - D*q;
    q(2:end-1) = D(:,2:end-1) \ b;
    
    % subplot(2,1,1)
    % plot(x,q,'b*-',x,qexact,'r*-')
    
    % subplot(2,1,2)
    % plot(x,q-qexact,'r*-')
    % pause
    
    err(j) = norm(q-qexact)*sqrt(h(j));
end

loglog(h,err,'*-')
xlabel('h')
ylabel('error')

p = (log(err(2:end))-log(err(1:end-1)))./(log(h(2:end))-log(h(1:end-1)));




