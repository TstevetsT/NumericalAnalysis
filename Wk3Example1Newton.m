%% Newton Example Wk3Ex1
%% Housekeeping and Constant Assignment
clear 
close all
clc 

x1 = linspace(-1,1,101);
plot(x1,sqrt(1-x1.^2)
%Create ananomous function
f=@(x)[x(1)^2-1;...   comment comment 
       x(1)^2-2*x(1)+1-x(2)];

%Jacobian Matrix as a function
J = @(x) [2*x(1),2*x(2);...
          2*x(1)-2,-1]

% Pass roots into function to test
f([0;1])
J([0;1])

x = [1;2];

% define tolerence
tol = 1e-6;
% initialize p
p = [inf;inf]; % so it is always bigger than tol

plot(x(1),x(2),'b*');

while norm(p) > tol
      % p=-inv(J(x))*f(x);  % create a new 
      % be careful with inv command b/c it
      %   is numerically unstable and result
      %   in roundoff errors instead use
      p= - J(x)   \ f(x); 
      %   Gaussian elimination^
      x=x+p;               % Update solution
      plot(x(1)-[0,p(1)],x(2)-[0,p(2)],'b*-');
      pause
end
hold off
 
