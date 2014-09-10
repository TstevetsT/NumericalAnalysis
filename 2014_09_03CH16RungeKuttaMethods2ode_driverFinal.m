clear

[t45,y45] = ode45(@pred_prey,[0,100],[80;30]);
subplot(2,1,1)
plot(t45,y45(:,1),'*-',t45,y45(:,2),'*-')

N = 192;
[t,y] = rk4(@pred_prey,[0,100],[80;30], N);
subplot(2,1,2)
plot(t,y(:,1),'*-',t,y(:,2),'*-')