clear

% number of time points
N    = 100;
tend = 4;
dt   = tend / N;

% Simulation parameters
alpha = 1;
x(1)  = 0;
y(1)  = 0;
vx(1) = 10;
vy(1) = 10;
t(1)  =  0;
g     = 10;

% Implement the numerical algorithm
for k = 1:N
  t(k+1)  = t(k) + dt;

  x(k+1)  = x(k) + dt*vx(k);

  y(k+1)  = y(k) + dt*vy(k);

  vx(k+1) = vx(k) - dt*     alpha*sqrt(vx(k)^2+vy(k)^2);

  vy(k+1) = vy(k) - dt*(g + alpha*sqrt(vx(k)^2+vy(k)^2));
end

plot(t,x,'.-',t,y,'.-')
