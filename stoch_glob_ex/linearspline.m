function val = linearspline(points,coeffs,x)
%LINEARSPLINE Summary of this function goes here
%   Detailed explanation goes here
    val = 0;
    for i=1:length(points)
        val = val + coeffs(i) * norm(x-points{i},'fro');
    end
end

