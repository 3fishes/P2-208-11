function [summed,avg] = plotter(mainCell)
global lengthy
global widthy
summed = 0;
x = lengthy;
for i=1:widthy
    for j = 1:lengthy
        z(i,j) = mainCell{i,j}.convinced;
        summed = summed + z(i,j);
    end
end

%% plotting
surf(z);
avg = summed /(lengthy*widthy);
end