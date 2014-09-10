%% Euler Example
clear

%forcing function and exact solution
f= @(t,y) -y+(1/10)*t;
y_exact = @(t) (11/10)*exp(-t) +(1/10)*(t-1);

%% simulation parameters
t0=0;
y0=y_exact(t0)/
tf = 1;
N= 10;
h= (tf-t0)/N;  %step size

%Compute updates
y_FE = y0;
y_BE = y0;
t    = t0;
for k=1:N
    %update time
    t(k+1) = t(k) + h;
    
    %fwd euler
    y_FE(k+1)=y_FE(k) + h * f(t(k),y_FE(k);
    
    %backward euler
    y_BE(k+1) = (1/(1+h))*y_BE(k) + (h/(h+1))
end

T= linspace(t0,tf,1000);
plot(t
    
    
    
    %double # of points then two curves approach each other