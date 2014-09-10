function I = composite_trap(f,a,b,r)

h = (b-a)/r;
I = 0;

for k = 1:r
    tk = a + k*h;
    tkm1 = a + (k-1)*h;
    I = I + (h/2)*(f(tk) + f(tkm1));
end