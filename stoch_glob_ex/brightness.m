function brightness = brightness(dx,dy)
%BRIGHTNESS Model the brightness of a light
    brightness = exp(-(dx.^2+dy.^2)/(2*(2)^2))/(2*pi);
end

