clear

% Set up the ODE
a  = 1;
b  = 1;
A  = [0,1;-b.^2,-a.^2];
f  = @(t,y) A*y(:);

% initial condition and final time
y0 = [1;1];
tf = 100;

% cheat on exact solution by using ode45
opts = odeset('RelTol',1e-3);
[te,ye] = ode45(f,[0,tf],y0,opts);

% Set up the and do forward Euler
N = 400;
t = linspace(0,tf,N+1);
h = t(2)-t(1);

[t,y] = rk4(f,[t(1),t(end)],y0,N);

% plot the solution
subplot(1,2,1)
plot(te,ye(:,1),t,y(:,1))
axis tight

subplot(1,2,2)
% plot the RK stability region
fe = @(z) 1+z+(1/2)*z.^2 + (1/6)*z.^3 + (1/24)*z.^4;
RK_stability(fe,-3,1,-3.2,3.2);
hold on

% plot the eigenvalues of the system
e = eig(A);
plot(e*h,'k.','MarkerSize',25)
hold off

% make the plot axis equal and tight
axis image

% print the magnitude of h*lam
disp(abs(fe(e*h)))
