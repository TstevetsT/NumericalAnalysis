clear

% Create the matrix that results from Taylor expansion
A = sym([1,1,1;0,1,2;0,1,4]);

% Set up the RHS vector which is the values we want 
% the coefficients in front of the function and its
% derivatives to be
syms h
b = [0;1/h;0];

% find the finite difference coefficients
a = A \ b;

% display the coefficients
disp(a)
