clear

% RHS
f = @(t,y,K) -K*(y-cos((t))) - sin(t);

% exact solution
y_exact = @(t) cos(t);

% initial condition and final time
y0 = cos(0);
tf = 10*pi;

% RHS parameter
K = 1000;

% Forward Euler stable choices
h_stable = 2/K;          % time step size that is just barely stable
N_stable = ceil(tf*K/2); % This N results in a barely stable time step size

% Set up the forward Euler method
N_FE = N_stable-10;
h_FE = tf/N_FE;
disp(h_stable-h_FE)
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

subplot(2,2,1)
% plot the two solution
semilogy(t_FE,abs(y_FE-y_exact(t_FE)),t_BE,abs(y_BE-y_exact(t_BE)))
axis tight
ylim([-1 1])
subplot(2,2,3)
% plot the two solution
plot(t_FE,y_FE,'-',t_BE,y_BE,'-','MarkerSize',10,'LineWidth',2)
axis tight
ylim([-1 1])

subplot(1,2,2)
% plot the RK stability region
fe = @(z) 1 + z; % remember z = lam*h
RK_stability(fe,-2,0,-1,1);
hold on

% plot the eigenvalues of the system
plot(-K*h_FE,0*1i,'k.','MarkerSize',25)
hold off

% make the plot axis equal and tight
axis image
