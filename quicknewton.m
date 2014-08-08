%% Quick Newton
clear all
format short
n=12;
f = inline('[x(1)-1 ; x(1)*x(2)-1]');
%f = inline('[x(1)^3+x(2)-1 ; x(2)^3-x(1)+1]');
Df = inline('[1, 0 ; x(2), x(1)]');
%Df = inline('[3*x(1)^2, 1; -1, 3*x(2)^2]');
x=[0;0];
for i = 1:n
    Dx = -Df(x)\f(x); %find the increment
    increment=Dx;
    x=x+Dx;   % add to previous guess
    guess=x;
    zero=f(x);    % see if f(x) is really zero
    result(i,:)=[increment' guess' zero'];
end
result