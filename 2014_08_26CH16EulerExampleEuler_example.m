clear

% set up forcing function and exact solution
f = @(t,y) -y + t/10;
y_exact = @(t)  (11/10)*exp(-t) + (t-1)/10;

% simulation parameters
tf = 10;
N = 1000;
h = tf/N;

% run the simulation
t = 0;
y_FE = 1; % forward Euler solution
y_BE = 1; % backward Euler solution
for k = 1:N
  t(k+1) = k*h;

  % Forward Euler
  y_FE(k+1) = y_FE(k) + h*f(t(k),y_FE(k));

  % Backward Euler: Notice that we cannot use f(t,y)
  y_BE(k+1) = 1/(1+h)*y_BE(k) + (1/10)*(h/(1+h))*t(k+1);
end

% plot the solution
T = linspace(0,tf,1000); % fine grid for exact solution
plot(t,y_FE,t,y_BE,T,y_exact(T));

xlabel('time')
ylabel('solution')
legend('Forward Euler','Backward Euler','Exact Solution')
title(['number of steps is ',num2str(N)])

