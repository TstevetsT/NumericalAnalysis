clear

y0    = [80;30];
tspan = [0;100];

% Use matlab ODE45 routine
% Second argument is the time span argument
[t,y] = ode45(@pred_prey,tspan,y0);
subplot(2,1,1);
plot(t,y(:,1),t,y(:,2))

% Use the classic RK4 scheme
[t,y] = rk4(@pred_prey,tspan,y0,10000);
subplot(2,1,2)
plot(t,y(:,1),t,y(:,2))



% Check of the error for a known problem
y_exact = @(t)   sin(t) + cos(t);

% y_prime = @(t,y) cos(t) - sin(t);
y_prime = @(t,y) 2*cos(t) - y;

% set up the simulation parameters
y0      = y_exact(0);
tspan = [0,10];
for k = 1:10
  % number of simulation points
  N = 2^k;

  % run the code and store the time step
  [t,y,h(k)] = rk4(y_prime,tspan,y0,N);

  % calculate the final error
  err(k) = abs(y_exact(tspan(2))-y(end,1));

  % If you want to plot the solution as it runs
  % plot(t,y);
  % axis tight
  % drawnow
end

% Calculate and display the error
p = (log(err(1:end-1))-log(err(2:end)))./(log(h(1:end-1))-log(h(2:end)));
format shortg
disp([h(2:end);p]')

