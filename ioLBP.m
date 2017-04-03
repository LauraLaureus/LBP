function [files] = ioLBP(path,destinyPath)
%Cargar todas las imágenes del directorio
files = dir(path);


%Para todas las imagenes del directorio
for img = 3:size(files,1)
    %pasar la imagen a gris y  a la función LBPu.
    lbpImg = LBPu(rgb2gray(imread([path,files(img).name])));
    imwrite(uint8(lbpImg),[destinyPath,'-LBP-',files(img).name]);
end

%guardar la imagen en el sistema de ficheros. 
end

%%Ejemplos de llamada
%ioLBP('.\data\train\background\','.\data\train-LBP\pedestrians');
%ioLBP('.\data\train\pedestrians\','.\data\train-LBP\pedestrians');
