clear

% number of points to use in approximation
N = 5;

D = zeros(N-1,N+1);

for k = 1:N-1
    D(k,k  ) =  1;
    D(k,k+1) = -2;
    D(k,k+2) =  1;
end