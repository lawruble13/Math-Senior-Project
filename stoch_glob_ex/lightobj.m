function v = lightobj(numlights,lightcentres, X, Y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [mu, sigma, m, M] = lightcalc(numlights, lightcentres, X, Y);
    mindist = Inf;
    for i=1:numlights
        for j = i+1:numlights
            dist = norm(lightcentres(i,:)-lightcentres(j,:));
            if dist < mindist
                mindist = dist;
            end
        end
    end
    if mindist < 0.05
        tooclose = 1;
    else
        tooclose = 0;
    end
    v = 1000 * sigma - 100 * mu - 100 * m + 1000000*tooclose;
    
    
end

