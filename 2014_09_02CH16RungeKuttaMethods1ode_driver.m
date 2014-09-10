clear

[t,y] = ode45(@pred_prey,[0,100],[80;30]);
plot(t,y(:,1),'*-',t,y(:,2),'*-')