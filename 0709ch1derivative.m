clear

% define function values
x0 = 1.2;

% define grid spacing
i = -20:0.5:10;
% h = 10.^i;
for k = 1:length(i)
    h(k) = 10^i(k);
end

% derivative approximation
df = (sin(x0+h)-sin(x0)) ./ h;
err = abs(df - cos(x0));
loglog(h,err,h,(h/2)*abs(-sin(x0)),'r--')
