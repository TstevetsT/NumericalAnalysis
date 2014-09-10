clear

% time step size
dt = 0.0001;

% Simulation parameters
alpha = 0;
x(1)  = 0;
y(1)  = 0;
vx(1) = 10;
vy(1) = 10;
t(1)  =  0;
g     = 10;

% Implement the numerical algorithm
k = 1;
while(y(k) >= 0)
  t(k+1)  = t(k) + dt;

  x(k+1)  = x(k) + dt*vx(k);

  y(k+1)  = y(k) + dt*vy(k);

  vx(k+1) = vx(k) - dt*     alpha*sqrt(vx(k)^2+vy(k)^2);

  vy(k+1) = vy(k) - dt*(g + alpha*sqrt(vx(k)^2+vy(k)^2));

  k = k + 1;
end

T = linspace(t(1),t(end),1001);
plot(t,x,'.-',t,y,'.-',...
     T,x(1)+T*vx(1),'k--',...
     T,y(1)+T*vy(1)-(1/2)*g*T.^2,'r--',...
     'LineWidth',2)
