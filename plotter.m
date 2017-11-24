function [summed,avg] = plotter(mainCell)
global rows
global cols
summed = 0;
for i=1:rows
    for j = 1:cols
        z(i,j) = mainCell(i,j).opin;
        summed = summed + z(i,j);
    end
end
%% plotting
surf(z);
axis([1 cols 1 rows 0 100]);
avg = summed /(rows*cols);
waitforbuttonpress;
end