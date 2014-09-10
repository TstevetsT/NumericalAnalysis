clear

% RHS
f = @(t,y,K) -K*(y-cos((t))) - sin(t);

% exact solution
y_exact = @(t) cos(t);

% initial condition and final time
y0 = cos(0);
tf = 2*pi;

% RHS parameter
K = 1000;

% Forward Euler
N_FE = 10000;
h_FE = tf/N_FE;
y_FE = y0;
t_FE = 0;
for k = 1:N_FE
  y_FE(k+1) = y_FE(k) + h_FE*f(t_FE(k),y_FE(k),K);
  t_FE(k+1) = t_FE(k) + h_FE;
end

% Backward Euler
N_BE = 100;
h_BE = tf/N_BE;
y_BE = y0;
t_BE = 0;
for k = 1:N_BE
  t_BE(k+1) = t_BE(k) + h_BE;
  y_BE(k+1) = (y_BE(k) + h_BE*(K*cos(t_BE(k+1))-sin(t_BE(k+1))))/(1+K*h_BE);
end

% plot the two solution
plot(t_FE,y_FE,'x-',t_BE,y_BE,'o-','MarkerSize',10,'LineWidth',2)
axis tight
ylim([-1 1])
