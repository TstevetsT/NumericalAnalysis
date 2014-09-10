function [t,y] = rk4(f,tspan,y0,N)

% get initial and final time
t0 = tspan(1);
tf = tspan(end);
h = (tf-t0)/N;

% allocate storage for solutions
t = linspace(t0,tf,N+1)';
y = zeros(N+1,length(y0));
y(1,:) = y0;

for k = 1:N
    Y1 = y(k,:);
    Y2 = y(k,:) + (h/2)*f(t(k),Y1)';
    Y3 = y(k,:) + (h/2)*f(t(k)+h/2,Y2)';
    Y4 = y(k,:) + h*f(t(k)+h/2,Y3)';
    y(k+1,:) = y(k,:) + (h/6) * (f(t(k),Y1) + 2*f(t(k)+h/2,Y2)...
                             +2*f(t(k)+h/2,Y3) + f(t(k+1),Y4))';
end