function [c d] = rounder(x,n)
% This function takes input array x and rounds to n places and outputs 
%  original array c and rounded array d
% 
% test data
%x=[224324.214214 -234112.234213 0.0000124213 -0.000002142142 3.323223]
%n=5
c=x;
long=length(x);
for i=1:1:long
    count=0;
    neg=0;
    if x(i)<0
        x(i)=abs(x(i));
        neg=1;
    end
    if    x(i) < 1
        while x(i) < 1
            x(i)=x(i)*10;
            count=count-1;
        end
    elseif x(i)>=10
        while x(i)>=10
            x(i)=x(i)/10;
            count=count+1;
        end
    end
    d(i)=round(x(i)*10^n)/10^n;
    d(i)=d(i)*10^count;
    if neg==1
        d(i)=d(i)*-1;  
    end
end
end
