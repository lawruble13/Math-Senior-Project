function out = intriangle(triangle,points)
%INTRIANGLE Summary of this function goes here
%   Detailed explanation goes here
    v0 = triangle(1,:);
    v1 = triangle(2,:)-v0;
    v2 = triangle(3,:)-v0;
    a = ((points(:,1)*v2(2) - points(:,2)*v2(1)) - (v0(1)*v2(2) - v0(2)*v2(1)))/(v1(1)*v2(2) - v1(2)*v2(1));
    b = -((points(:,1)*v1(2) - points(:,2)*v1(1)) - (v0(1)*v1(2) - v0(2)*v1(1)))/(v1(1)*v2(2) - v1(2)*v2(1));
    out = zeros(size(points,1),1);
    out = (a >= 0 & b >= 0 & a+b <= 1);
end

