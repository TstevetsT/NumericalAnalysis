clear

% Simulation parameters
dt    = 1e-5;
alpha = 1;
g     = 10;

% Loop through a number of initial velocities
V0 = linspace(0,15,100);
range = zeros(size(V0));
for k = 1:length(V0)

  % Set up the initial conditions for this initial velocity
  x = 0;
  y = 0;
  vx = V0(k);
  vy = V0(k);
  t  =  0;

  % keep using the algorithm until the y values is negative
  while y >= 0
    t  = t + dt;
    x  = x + dt*vx;
    y  = y + dt*vy;
    V = sqrt(vx^2+vy^2);
    vx = vx - dt*     sign(vx)*alpha*V^2;
    vy = vy - dt*(g + sign(vy)*alpha*V^2);
  end

  % Store the distance that the projectile went
  range(k) = x;
end

% plot the range versus the initial velocity
plot(V0,range)
ylabel('range')
xlabel('initial velocity')
