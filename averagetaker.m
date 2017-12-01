function [avg] = averagetaker(maingrid)
global cols; %this is the average thing
global rows;
summed = 0;
for i = 1:rows
    for j = 1:cols
        summed = summed + maingrid(i,j).opin;
    end
end
avg = summed/(cols*rows);
end
