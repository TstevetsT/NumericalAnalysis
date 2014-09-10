clear

% Simulation parameters
tend = 4;
N = 500;
dt = tend / N;
alpha = 0.1;

g = 10;

% implementation of algorithm
t = 0;
x = 0;
y = 0;
vx = 1;
vy = 10;
for k = 1:N
    t(k+1) = t(k) + dt;
    x(k+1) = x(k) + dt * vx(k);
    y(k+1) = y(k) + dt * vy(k);
    vx(k+1) = vx(k) - sign(vx(k))*alpha * dt * sqrt(vx(k)^2+vy(k)^2);
    vy(k+1) = vy(k) - g * dt - sign(vy(k))*alpha * dt * sqrt(vx(k)^2+vy(k)^2);
end

% exact solution
xe = t*vx(1) + x(1);
ye = t*vy(1) + y(1) - (1/2)*g*t.^2;

plot(x,y,xe,ye);
legend('approximate solution', 'exact solution')