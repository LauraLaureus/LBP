function [files] = ioLBP(path,destinyPath)
%Cargar todas las imágenes del directorio
files = dir(path);

%Para todas las imagenes del directorio
for img = 3:size(files,1)
    %pasar la imagen a gris
    lbpImg = LBPu(rgb2gray(imread([path,files(img).name])))
    
end


%pasarlo a la función LBPu.
%guardar la imagen en el sistema de ficheros. 
end