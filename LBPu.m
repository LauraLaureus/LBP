function lbp = LBPu(im)

lbp = zeros(size(im));

zeroPadding = zeros(size(im,1)+1,size(im,2)+1);
zeroPadding(2:size(im,1)+1,2:size(im,2)+1) = im; 

%Error de dimensionMismatch
for i = 2:size(zeroPadding,1)-1
    for j = 2:size(zeroPadding,2)-1
        lbp(i-1,j-1) = uniformBinaryPattern(zeroPadding(i-1:i+1,j-1:j+1));
    end
end

end

function [label] = uniformBinaryPattern(neighbourhood)

neighbourhoodRoad = zeros(9);
neighbourhoodRoad(1) = neighbourhood(1);
neighbourhoodRoad(9) = neighbourhood(1);

for r = 1:4
    neighbourhoodRoad(r*2:r*2+1) = neighbourhood(1,2:3);
    neighbourhood = imrotate(neighbourhood,90);
end

centerPixel = neighbourhood(2,2);

for n = 1:9
    if(neighbourhoodRoad(n) < centerPixel)
        neighbourhoodRoad(n) = 0;
    else
        neighbourhoodRoad(n) = 1;
    end
end

t=0;
%transitions
for i = 2:9
    if(neighbourhoodRoad(i-1) ~= neighbourhoodRoad(i-1))
        t = t+1;
    end
end

if t <= 2 
    label = binaryVectorToDecimal(neighbourhoodRoad);
else
    label = 59;
end

end
