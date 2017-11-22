function [z,h]= myplotter(struct)
global rows;
global cols;
dims = size(struct);
for i = 1:dims(1)
    for j = 1:dims(2)
        z(i,j) = struct(i,j);
    end
end
figure(1)
surf(z);
axis([1 cols 1 rows 0 100]);
%colorbar;
%view(2);
h = waitforbuttonpress;

end
