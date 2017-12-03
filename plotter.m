function [summed,avg] = plotter(maingrid, A)
    global rows
    global cols
    global agentnum
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
    hold on;
    for i= 1:numel(fieldnames(A))
        row = A.(agentnum(i)).location_row;
        col = A.(agentnum(i)).location_col;
        plot3(col, row, 100, 'ro');
    end
    axis([1 cols 1 rows 0 100]);
    hold off;
    avg = summed /(rows*cols);
    %colorbar;
    %view(2);
    waitforbuttonpress;
end