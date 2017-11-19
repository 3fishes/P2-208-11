function plotter2(mainCell)
global rows
global cols
summed = 0;
for i=1:rows
    for j = 1:cols
        z(i,j) = mainCell(i,j).opin;
    end
end
surf(z);
waitforbuttonpress;
end