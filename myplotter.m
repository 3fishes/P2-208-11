function z = myplotter(struct)
dims = size(struct);
for i = 1:dims(1)
    for j = 1:dims(2)
        z(i,j) = struct(i,j);
    end
end
figure(1)
surf(z);
waitforbuttonpress;
end