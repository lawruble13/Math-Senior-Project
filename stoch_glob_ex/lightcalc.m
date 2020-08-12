function [ave, std_dev, m, M, B] = lightcalc(numlights, lightcentres, X, Y)
    B = zeros(size(X));

    for i=1:numlights
        b = brightness(lightcentres(i,1)-X,lightcentres(i,2)-Y);
        B = B + b;
    end
    ave = mean(B,'all');
    std_dev = std(B,1,'all');
    m = min(B,[],'all');
    M = max(B,[],'all');
    
end
