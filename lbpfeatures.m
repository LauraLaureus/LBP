function x = lbpfeatures(patch)

histogramImg = zeros(1,6195);

index = 1;
for h = 1:8:size(patch,1)-8
    for v =1:8:size(patch,2)-8
        hist = histogram(patch(h:h+15,v:v+15),59);
        histogramImg(index:index+58) = hist.Values;
        index = index + 59;
    end
end

nomHistogram = softmax(histogramImg);
sum(nomHistogram);

end