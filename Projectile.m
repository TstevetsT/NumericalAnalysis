%% Projectile
%% Housekeeping and Constant Assignment
clear 
close all
clc  
 
%% Constants and class discussion 7/7/2014
% forces acting- gravity and drag
% dx/dt=sqrt(x);
% dy/dt=sqrt(y);
% d^2x/dt=0-alpha*sqrt(dxdt^2+dydt^2);
% d^2y/dt=-g - alpha*sqrt(dxdt^2+dydt^2);
% For alpha=0 then it can be solved directly
% sqrt(x)=int(d^2x/dt,t) = int(0,t) = Csub0 = sqrt(x)^0
% sqrt(y)=int(d^2y/dt,t) = int(g,t) = -g*t+Csub1 = -g*t+sqrt(y)^0
% x = sqrt(x)^0 * t + Csub2 = sqrt(x)^0*t+xsub0
% y = -1/2 * g * t^2 + sqrt(y)^0*t + Csub3= -1/2*g*t^2+ sqrt(y)^2 ...
% defining derivatives
% df/dt=lim((f(t+deltat)-f(t))/deltat),deltat->0)
% on computer we will let deltat be small but not zero
% df/dt ~ (f(t+deltat)-f(t))/deltat)
% dx/dt ~ (x(t+deltat)-x(t))/deltat) = sqrt(x)*t
% df/dt ~ (f(t+deltat)-f(t))/deltat)

% Solve for solution at (t + deltat)
% x(t+deltat = x(t) + deltat*sqrt(x)*t
% d^2x/dt=dsqrt(x)/dt= (sqrt(x)*(t+deltat) - sqrt(y)*(t)) / deltat

%% 7/8/2014 projectile class program
% edit <filename>   %opens an m file
% simulation parameters
tend = 10;  %ending time
N = 20;  %number of steps
dt = tend / N;  %step interval
alpha = 0;

g = 10;

%implementation of algorithm
t=0;
x=0;
y=0;
vx=1;
vy=50;
for k = 1:N
    t(k+1) = t(k) + dt;
    x(k+1) = x(k) +dt * vx(k);
    y(k+1) = y(k) +dt * vy(k);
    vx(k+1) = vx(k) - alpha * dt * sqrt(vx(k)^2+vy(k)^2);
    vy(k+1) = vy(k) -g *dt - alpha * dt * sqrt(vx(k)^2 +vy(k)^2);
end
xe = t*vx(1)+x(1);
ye = t*vy(1)+y(1)-(1/2)*g*t.^2;
plot(x,y,xe,ye)
legend('approximate solution','exact solution')

