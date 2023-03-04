function image_diff = funcion_imabsdiff(img1,img2)
    
    image_diff = zeros(size(img1));
    
    if size(img1) ~= size(img2)
        
        display('Matrices de diferente dimension');

    else
        

        image_diff = uint8(abs(double(img1) - double(img2)));

%         [M, N, C] = size(image_diff);
%         
%         for channel = 1 : C
%             for i = 1 : M
%                 for j = 1 : N
%                     val1 = img1(i,j,channel);
%                     val2 = img2(i,j,channel);
%                     
%                     new_val = abs(double(val1) - double(val2));
% 
%                     image_diff(i,j,channel) = new_val;
%                 end
%             end
%         end

    end

end