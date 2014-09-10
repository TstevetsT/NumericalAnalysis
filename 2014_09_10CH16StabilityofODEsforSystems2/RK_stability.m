function RK_stability(f,xmin,xmax,ymin,ymax)
[x,y] = meshgrid(linspace(xmin,xmax,1001),linspace(ymin,ymax,1001));
F = abs(f(x+1i*y)) <= 1;
tf = ishold;
if ~tf
  cla
  hold on
end
image([xmin,xmax],[ymin,ymax],F)
plot([xmin,xmax],[0,0],'k','LineWidth',2)
plot([0,0],[ymin,ymax],'k','LineWidth',2)
if ~tf
  hold off
end
colormap([1,1,1;1,0.5,0])
