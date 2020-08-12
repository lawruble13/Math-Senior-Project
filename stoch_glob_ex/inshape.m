function out = inshape(triangles,points)
%INSHAPE Summary of this function goes here
%   Detailed explanation goes here
    out = intriangle(triangles(:,:,1),points);
    for i=2:size(triangles, 3)
        out = out | intriangle(triangles(:,:,i),points);
    end
end

