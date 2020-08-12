%% Example plot for 3d polygon
close all;
clear;

points_x = [0,1,0,0];
points_y = [0,0,1,0];
points_z = [0,0,0,1];

space = alphaShape(points_x', points_y', points_z', Inf);

space_plot = plot(space);
space_plot.FaceColor = [0.5,0.5,1];
space_plot.EdgeColor = [0,0,1];
space_plot.LineWidth = 2;
alpha(space_plot, 0.5);
axis equal;
hold on;

xb = [min(points_x), max(points_x)];
xb = xb + [-0.1, 0.1]*(xb(2)-xb(1));

yb = [min(points_y), max(points_y)];
yb = yb + [-0.1, 0.1]*(yb(2)-yb(1));

zb = [min(points_z), max(points_z)];
zb = zb + [-0.1, 0.1]*(zb(2)-zb(1));

x1 = [0     0     0     0]-0.01;
y1 = [yb(1) yb(1) yb(2) yb(2)];
z1 = [zb(2) zb(1) zb(1) zb(2)];

con1 = patch(x1,y1,z1,[0.5,0.5,0.5]);
alpha(con1, 0.2);

x2 = [xb(1) xb(1) xb(2) xb(2)];
y2 = [0     0     0     0]-0.01;
z2 = [zb(2) zb(1) zb(1) zb(2)];

con2 = patch(x2,y2,z2,[0.5,0.5,0.5]);
alpha(con2, 0.2);

x3 = [xb(1) xb(1) xb(2) xb(2)];
y3 = [yb(2) yb(1) yb(1) yb(2)];
z3 = [0     0     0     0]-0.01;

con3 = patch(x3,y3,z3,[0.5,0.5,0.5]);
alpha(con3, 0.2);

x4 = [1.01-yb(1)-zb(2), xb(1),         xb(1), 1.01-yb(2)-zb(1),        xb(2),         xb(2)        ];
y4 = [yb(1),         1.01-xb(1)-zb(2), yb(2),         yb(2),         1.01-xb(2)-zb(1), yb(1)        ];
z4 = [zb(2),         zb(2),                 1.01-xb(1)-yb(2), zb(1), zb(1),         1.01-xb(2)-yb(1)];

con4 = patch(x4,y4,z4,[0.5,0.5,0.5]);
alpha(con4, 0.2);

xlim(xb)
ylim(yb)
zlim(zb)

view(60,30)
quiver3(0,0,0,1/sqrt(11),1/sqrt(11),3/sqrt(11),'Color','r')

saveas(gcf, '../images/slides_ex2_3d','png');
