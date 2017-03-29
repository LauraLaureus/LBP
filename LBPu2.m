function lbp = LBPu(im)

lbp = zeros(size(im));

zeroPadding = zeros(size(im,1)+1,size(im,2)+1);
zeroPadding(2:size(im,1)+1,2:size(im,2)+1) = im; 

table = getTable();

%Error de dimensionMismatch
for i = 2:size(zeroPadding,1)-1
    for j = 2:size(zeroPadding,2)-1
        slice = zeroPadding(i-1:i+1,j-1:j+1);
        lbp(i-1,j-1) = uniformBinaryPattern(slice,table);
    end
end

end

function [label] = uniformBinaryPattern(neighbourhood,table)

neighbourhoodRoad = zeros(1,9);
neighbourhoodRoad(1) = neighbourhood(1);
neighbourhoodRoad(9) = neighbourhood(1);

i = 2;
for r = 1:4
    neighbourhoodRoad(i:i+1) = neighbourhood(1,2:3);
    neighbourhood = imrotate(neighbourhood,90);
    i = i+2;
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
    if(neighbourhoodRoad(i-1) ~= neighbourhoodRoad(i))
        t = t+1;
    end
end

label = 0;
if t <= 2
    label = table(binaryVectorToDecimal(neighbourhoodRoad(1:8))+1);
else
    label = 59;
end

end


function [table] = getTable()
table = zeros(1, 256);
nextLabel = 1;
    for k = 0:255
        bits = bitand(k, 2.^(7:-1:0))>0;
        if nnz(diff(bits([1:end, 1]))) <= 2 %nnz elementos distintos de 0
            table(k+1) = nextLabel;
            nextLabel = nextLabel + 1;
        else
            table(k+1) = 0;
        end
    end 
end
