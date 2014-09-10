function [t,y,h] = rk4(f,tspan,y0,N)
% FUNCTION Classic RK4 scheme
% [t,y] = rk4(odefun,tspan,y0,N)
% inputs:
%   odefun  :: function handle to the RHS function
%   tspan   :: [t_initial,t_final]
%   y0      :: initial condition
%   N       :: number of time steps
%
%  outputs:
%   t       :: solution time points (column vector of size N+1)
%   y       :: solution vector (matrix of size (N+1) X length(y0));
%   h       :: time step used

% Get the initial and final times
t0 = tspan(1);
tf = tspan(2);

% compute the time step
h = (tf-t0)/N;

% create the time array and the storage
t = linspace(t0,tf,N+1)';
y = zeros(N+1,length(y0));
y(1,:) = y0;

% compute the updates
for k = 1:N
  Y1 = y(k,:)';
  Y2 = y(k,:) + (h/2)*f(t(k)    ,Y1)';
  Y3 = y(k,:) + (h/2)*f(t(k)+h/2,Y2)';
  Y4 = y(k,:) +  h   *f(t(k)+h/2,Y3)';
  y(k+1,:) = y(k,:) + (h/6) * (     f(t(k)    ,Y1) + 2*f(t(k)+h/2,Y2) ...
                                + 2*f(t(k)+h/2,Y3) +   f(t(k)+h  ,Y4))';
end
