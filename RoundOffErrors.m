x=1e8

format long

x=x+rand*124798123

%incorrect answer due to roundoff error
errans=single(sqrt(single(x+1)))-single(sqrt(x))

goodans=single(1/single(single(sqrt(single(x+1)))+single(sqrt(x))))

actualans=1/(sqrt(x+1)+sqrt(x))