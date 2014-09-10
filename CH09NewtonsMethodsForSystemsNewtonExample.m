clear

x1 = linspace(-1,1,101);
plot(x1,sqrt(1-x1.^2),'r')
hold on
plot(x1,-sqrt(1-x1.^2),'r')

x1 = linspace(-2,2,101);
plot(x1,x1.^2-2*x1+1,'k')
axis equal
axis([-2 2 -2 2])

f = @(x) [x(1).^2 + x(2).^2-1;x(1).^2-2*x(1)+1-x(2)];

J = @(x) [2*x(1),2*x(2);2*x(1)-2,-1];

x = [2;1];

p = [inf;inf];

tol = 1e-6;

plot(x(1),x(2),'*')
hold on
pause

while norm(p) > tol
  % p = -inv(J(x))*f(x);
  p = -J(x)\f(x);
  x = x + p;

  plot(x(1)-[0,p(1)],x(2)-[0,p(2)],'-*')
  pause
end
hold off
