clear

% straight line test
f = @(x) 2 * x + 1;
a = 0;
b = 1;
Ie = b^2+b - (a^2+a);
for r = 1:10
    I = composite_trap(f,a,b,r);
    disp([r abs(Ie-I)]);
end

% sinh(x)^2 test
clear
f = @(x) sinh(x).^2;
a = 0;
b = 1;
Ie = (sinh(2*b)/4 - (b/2)) - (sinh(2*a)/4-a/2);
for i = 1:8
    r = 2^(i-1);
    h(i) = (b-a)/r;
    I = composite_trap(f,a,b,r);
    err(i) = abs(Ie-I);
end
loglog(h,err,'*-')
axis tight

p = (log(err(2:end))-log(err(1:end-1)))./...
    (log(h(2:end))-log(h(1:end-1)));







