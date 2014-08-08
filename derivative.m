clear
% define function values
x0=1.2;
i=-20:0.5:0;
% h=10.^i;  %vectorized version of for loop (does the same thing)
for k = 1:length(i)
    h(k)=10^i(k);
end

%derivative approximation
df = (sin(x0+h)-sin(x0))./h;
err = abs(df-cos(x0));
loglog(h,err,h,(h/2)*abs(-sin(x0)),'r--')
legend('actual error','predicted error')
% result is due to roundoff errors