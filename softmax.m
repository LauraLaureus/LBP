function [soft] = softmax(array)

soft = zeros(size(array));

for i = 1:size(array)
    soft(i) = exp(array(i));
end

denominator = sum(soft);


for i = 1:size(array)
    soft(i) = soft(i)/denominator;
end


end