function [summed,avg] = plotter(mainCell)
global rows
global cols
summed = 0;
for i=1:rows
    for j = 1:cols
        z(i,j) = mainCell{i,j}.convinced;
        summed = summed + z(i,j);
    end
end
%% plotting
surf(z);
avg = summed /(rows*cols);
end