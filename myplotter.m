function myplotter(struct)
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
<<<<<<< HEAD
=======
%colorbar;
%view(2);
>>>>>>> de4a64898711f9f1ae8e04af3785d8810fc5e019
h = waitforbuttonpress;

end
