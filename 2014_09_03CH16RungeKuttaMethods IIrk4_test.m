clear

y_exact = @(t) sin(t) + cos(t);
% dydt = @(t,y) cos(t) - sin(t);
dydt = @(t,y) 2*cos(t) - y;

tspan = [0,10];
y0 = y_exact(tspan(1));

for k = 1:10
    N(k) = 2^k;
    [t,y] = rk4(dydt,tspan,y0,N(k));
    err(k) = abs(y_exact(tspan(end)) - y(end,:));
end
h = (tspan(end)-tspan(1))./N;

loglog(h,err,'*-')

p = (log(err(2:end))-log(err(1:end-1)))./...
    (log(h(2:end))-log(h(1:end-1)));