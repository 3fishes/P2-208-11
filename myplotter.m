function myplotter(struct)
    global rows;
    global cols;
    dims = size(struct);
    z = zeros(rows,cols); %Preallocate for speed
    for i = 1:dims(1)
        for j = 1:dims(2)
            z(i,j) = struct(i,j);
        end
    end
    figure(1)
    surf(z);
    axis([1 cols 1 rows 0 100]);
    waitforbuttonpress;
end
