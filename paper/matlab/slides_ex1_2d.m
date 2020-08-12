%% Example plot for 2d polygon
close all;
clear;

points_x = [0,         0,           1/sqrt(2), 1+sqrt(2), 1+sqrt(2), 1+1/sqrt(2), 1/sqrt(2)];
points_y = [1/sqrt(2), 1+1/sqrt(2), 1+sqrt(2), 1+sqrt(2), 1/sqrt(2), 0,           0];

space = polyshape(points_x, points_y);

space_plot = plot(space);
axis equal;
hold on;

xb = xlim;
yb = ylim;

x = linspace(xb(1),xb(2));

y1 = -x + 1/sqrt(2);
x1 = x((yb(1) <= y1) & (y1 <= yb(2)));
y1 = y1((yb(1) <= y1) & (y1 <= yb(2)));
plot(x1,y1, 'Color', [0.7,0.7,0.7]);

y2 = zeros(size(x));
x2 = x;
plot(x2,y2, 'Color', [0.7,0.7,0.7]);

y3 = linspace(yb(1),yb(2));
x3 = zeros(size(y3));
plot(x3,y3, 'Color', [0.7,0.7,0.7]);

y4 = x + 1 + 1/sqrt(2);
x4 = x((yb(1) <= y4) & (y4 <= yb(2)));
y4 = y4((yb(1) <= y4) & (y4 <= yb(2)));
plot(x4,y4, 'Color', [0.7,0.7,0.7]);

y5 = (1+sqrt(2))*ones(size(x));
x5 = x;
plot(x5,y5, 'Color', [0.7,0.7,0.7]);

y6 = linspace(yb(1),yb(2));
x6 = (1+sqrt(2))*ones(size(y6));
plot(x6,y6, 'Color', [0.7,0.7,0.7]);

y7 = x - (1 + 1/sqrt(2));
x7 = x((yb(1) <= y7) & (y7 <= yb(2)));
y7 = y7((yb(1) <= y7) & (y7 <= yb(2)));
plot(x7,y7, 'Color', [0.7,0.7,0.7]);

space_plot.EdgeColor = [0,0,1];
uistack(space_plot,'top');

quiver(0,0,1,2,'Color','r')

saveas(gcf, '../images/slides_ex1_2d','png');