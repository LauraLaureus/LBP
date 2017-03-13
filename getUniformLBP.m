function lpb = getUniformLBP(kernel)

lbpRasterizedKernel = zeros(1,8);

%TODO operar sobre el primer pixel.

for i=1:4 %numero de veces que vamos a rotar
    kernelR = kernel(1,2:3); %tomamos la primera fila. 
    for j=1:2
        %operar con kernelR(j) y dejar el resultado en
        %lbpRasterizedKernel(i*j)
    end
    kernel = imrotate(kernel,90);
end

%crear lbp
%computar lbp
%devolver lbp
end