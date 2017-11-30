function [summed,avg] = plotter(maingrid)
    global rows
    global cols
    summed = 0;
    z = zeros(rows,cols); %Preallocate for speed
    for i=1:rows
        for j = 1:cols
            z(i,j) = maingrid(i,j).opin;
            summed = summed + z(i,j);
        end
    end
    %% plotting
    surf(z);
    axis([1 cols 1 rows 0 100]);
    avg = summed /(rows*cols);
    %colorbar;
    %view(2);
    waitforbuttonpress;
end