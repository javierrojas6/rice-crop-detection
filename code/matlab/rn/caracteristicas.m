function [out] = caracteristicas(mask,img_RGN4)
out=[];m=1;
for i = 1 : size(mask,1)
    for j = 1 : size(mask,2)
        if mask(i,j)==255
            out = [out ;[img_RGN4(i,j,1), img_RGN4(i,j,2), img_RGN4(i,j,3), img_RGN4(i,j,4)]];
            m=m+1;
        end
    end 
end

end

