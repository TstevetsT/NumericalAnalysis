function S = simpson_plotting(f,a,b,N,tol,do_pause)
  % handling of the option pause argument
  if(nargin < 5)
    do_pause = false;
  end

  % set up initial intervals
  h = (b-a)/N;

  % Set up the summation storage and integation end points
  S = 0;
  t = a;

  % Plotting stuff
  x = linspace(a,b,1001);
  plot(x,f(x),'LineWidth',2);
  hold on

  % Draw all the initial intervals. These will be deleted when we actually
  % recurse on the interval to hand off the plotting to the called routine
  handles = zeros(N,4);
  for k = 1:N
    x0 = a+(k-1)*h;
    x1 = a+k*h;
    x = linspace(x0,x1,101);
    y = polyval(polyfit([x0,(x0+x1)/2,x1],[f(x0),f((x0+x1)/2),f(x1)],2),x);
    handles(k,1:2) = plot(x,y,'r-',[x0,x1],[f(x0),f(x1)],...
                       'r.','MarkerSize',50,'LineWidth',2);
    handles(k,3) = plot((x0+x1)/2,f((x0+x1)/2),'r.','MarkerSize',30,'LineWidth',2);
    handles(k,4) = plot([x0,x1],[0,0], 'rx','MarkerSize',15,'LineWidth',2);
  end
  if(do_pause)
    pause
  end

  for k = 1:N
    % remove the plot of the interval we are handling
    delete(handles(k,:));

    % call recursive simpson on each subinterval
    S = S + recursive_simpson(f,t,t+h,tol/N,do_pause);
    t = t + h;
  end
  hold off
end

function S = recursive_simpson(f,a,b,tol,do_pause)
  % some plotting stuff
  x = linspace(a,b,100);
  y = polyval(polyfit([a,(a+b)/2,b],[f(a),f((a+b)/2),f(b)],2),x);
  h1 = plot(x,y,'-',...
            [a,(a+b)/2,b],[f(a),f((a+b)/2),f(b)],'.',...
            'MarkerSize',50,'LineWidth',2,'Color',[0,0.8,0]);
  h2 = plot((a+b)/2,f((a+b)/2),'MarkerSize',30,'LineWidth',2,'Color',[0,0.8,0]);
  plot([a,b],[0,0],'rx','MarkerSize',15,'LineWidth',2);
  if(do_pause)
    pause
  end

  % set up the intervals
  h = b-a;

  % a to b using Simpson
  S1 = (h/6) * (f(a) + 4*f((a+b)/2) + f(b));

  % a to c and then c to b using Simpson
  c = (a+b)/2;
  S2 = (h/12) * (f(a) + 4*f((a+c)/2) + f(c))...
  + (h/12) * (f(c) + 4*f((c+b)/2) + f(b));


  if (1/15)*abs(S1-S2) < tol
    S = S2;
    delete(h1)
    delete(h2)
    % plot(x,y,'k-',[a,b],[f(a),f(b)],'.k','MarkerSize',50,'LineWidth',2);
    % plot((a+b)/2,f((a+b)/2),'.k','MarkerSize',30,'LineWidth',2);
    plot(x,y,'k-','LineWidth',2);
    plot([a,b],[0,0],'rx','MarkerSize',15,'LineWidth',2);
  else
    delete(h1)
    delete(h2)
    x = linspace(c,b,100);
    y = polyval(polyfit([c,(c+b)/2,b],[f(c),f((c+b)/2),f(b)],2),x);
    h1 = plot(x,y,'-',...
              [c,b],[f(c),f(b)],'.',...
              'MarkerSize',50,'LineWidth',2,'Color',[192,192,192]/255);
    h2 = plot((c+b)/2,f((c+b)/2),'.','MarkerSize',30,'LineWidth',2,'Color',[192,192,192]/255);
    S1 = recursive_simpson(f,a,c,tol/2,do_pause);
    delete(h1)
    delete(h2)
    S2 = recursive_simpson(f,c,b,tol/2,do_pause);
    S  = S1 + S2;
  end
end
