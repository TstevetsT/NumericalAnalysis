%% 5a lagrange test script developed in class w/ 
% slight changes
clear

i=1;
for n = [4,8,16,32];
    nout(i)=n;
    % interpolate a more interesting function
    f = @(x) log(sin(x).^2+0.1);
    x = linspace(-1,1,n/2+1); % interpolation points
    y = f(x);
    
    % evaluation points
    z = linspace(-1,1,1001);
    
    % construct Lagrange weights
    w = lagrange_weights(x);
    
    % evaluate interpolant
    tic
    Pn = Lagrange_eval_barycentric(z,x,y,w);
    eltime(i)=toc;
    
    % check the error
    error(i)=max(abs(Pn-f(z)));  
    
    figure(1)
    subplot(4,2,i*2-1)
    plot(z,Pn,z,f(z),x,y,'*');
    title(['5a Equal Grid n=' num2str(n) ' Error=' num2str(error(i))],...
        'FontSize',6)
    %xlabel('x');
    %ylabel('y');
    axis([-1 1 -2.5 .5])
    %legend('interpolant','exact','interpolation points')
    % pause
    i=i+1;
end
%nRuntimeError=[nout' eltime' error']

%% 5b lagrange test script developed in class w/ 
% slight changes for problem 5b
clear

j=1;
for n = [4,8,16,32];
    nout(j)=n;
    % interpolate a more interesting function
    f = @(x) log(sin(x).^2+0.1);
    for i=1:n ; % build interpolation points
        x(i)=cos((2*i+1)*pi/(2*(n+1)));
    end
    y = f(x);
    
    % evaluation points
    z = linspace(-1,1,1001);
    
    % construct Lagrange weights
    w = lagrange_weights(x);
    
    % evaluate interpolant
    tic
    Pn = Lagrange_eval_barycentric(z,x,y,w);
    eltime(j)=toc;
    
    % check the error
    error(j)=max(abs(Pn-f(z)));  
    
    figure(1)
    subplot(4,2,j*2)
    plot(z,Pn,z,f(z),x,y,'*');
    title(['5b Chebyshev n=' num2str(n) ' Error=' num2str(error(j))],...
        'FontSize',6)
    %xlabel('x');
    %ylabel('y');
    axis([-1 1 -2.5 .5])
    %legend('interpolant','exact','interpolation points')
    % pause
    j=j+1;
end
%nRuntimeError=[nout' eltime' error']

%% 5d lagrange test script developed in class w/ 
%  changes for problem 5d
clear
clc

j=1;
a=0;
b=1;
for n=[100,150,200,250];
    nout(j)=n;
    % interpolate a more interesting function
    f = @(x) exp(3.*x).*sin(200.*x.^2)./(1+20.*x.^2);
    for i=1:n ; % build interpolation points
        x(i)=(a+b)./2+(b-a)./2.*cos((2*i+1)*pi/(2*(n+1)));
    end
    y = f(x);
    
    % evaluation points
    z = linspace(0,1,1001);
    
    % construct Lagrange weights
    w = lagrange_weights(x);
    
    % evaluate interpolant
    tic
    Pn = Lagrange_eval_barycentric(z,x,y,w);
    eltime(j)=toc;
    
    % check the error
    format longe
    error(j)=max(abs(Pn-f(z)));  
    
    figure(2)
    subplot(4,1,j)
    plot(z,Pn,z,f(z),x,y,'*');
    title(['5d Chebyshev Interval. Error=' num2str(error(j))],...
       'FontSize',8)
    %xlabel('x');
    %ylabel('y');
    axis([0 1 -1.2 1.2])
    %legend('interpolant','exact','interpolation points')
    % pause
    j=j+1;
end
%nRuntimeError=[nout' eltime' error']

%% 5d part 2 lagrange test script developed in class w/ 
%  changes for problem 5d part 2
clear
clc

a=.009;
b=1;
n=190;
    % interpolate a more interesting function
    f = @(x) exp(3.*x).*sin(200.*x.^2)./(1+20.*x.^2);
    for i=1:n ; % build interpolation points
        x(i)=(a+b)./2+(b-a)./2.*cos((2*i+1)*pi/(2*(n+1)));
    end
    y = f(x);
    
    % evaluation points
    z = linspace(0.009,1,100000);
    
    % construct Lagrange weights
    w = lagrange_weights(x);
    
    % evaluate interpolant
    tic
    Pn = Lagrange_eval_barycentric(z,x,y,w);
    eltime=toc;
    
    % check the error
    format longe
    error=max(abs(Pn-f(z)))
    
    
%% 5e lagrange test script developed in class w/ 
%  changes for problem 5e
clear
clc

j=1;
for n=31500;    
    f = @(x) exp(3.*x).*sin(200.*x.^2)./(1+20.*x.^2);
    x = linspace(0,1,n/2+1); % interpolation points
    y = f(x);
    z = linspace(0,1,1000);
    Pn = spline(x,y,z);
    error=max(abs(Pn-f(z)))
    j=j+1;
end
%plot(z,Pn,z,f(z),x,y,'*');
%error
