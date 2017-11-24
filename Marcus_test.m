function [maincell] = Marcus_test(maincell)
global rows;  % rows in node matrix
global cols;  % cols in node matrix
global cols;  %cols in node matrix

%% ITERATING THROUGH
    next = zeros(rows,cols); %initialize next
for plcrows = 1 : rows   %current node position
    summed = 0;
    for plccols = 1: cols
%%  deal with boundary cases
    i = [plcrows-1 plcrows+1];
    j = [plccols-1 plccols+1];
    i = i(i < rows);
    j = j(j < cols);
    i = i(i ~= 0);
    j = j(j ~= 0);
    % Below for loops act on above, below ,left and right nodes to find
    % their effect on central node
        for u = 1:length(i) %rows
            % find their agreement coefficient
            commonfact = 1-(sum(abs(maincell(plcrows,plccols).agents-maincell(i(u),plccols).agents)))/3;
            % complicated algorithm
            val = commonfact*maincell(plcrows,plccols).stub*((maincell(plcrows,plccols).opin + maincell(i(u),plccols).opin)/2 - maincell(plcrows,plccols).opin);
            % collect the sum effect of each node on the central node
            % divide by length of i because edge cases only have one
            % effecting node vs regular case has 2
         
            summed = (summed + val)/length(i);
        end %u
        for v = 1:length(j) %cols
             commonfact = 1-(sum(abs(maincell(plcrows,plccols).agents-maincell(plcrows,j(v)).agents)))/3;
             val = maincell(plcrows,plccols).stub*((maincell(plcrows,plccols).opin + maincell(plcrows,j(v)).opin)/2 - maincell(plcrows,plccols).opin);
             summed = (summed + val)/length(j);
        end %v
           next(plcrows,plccols) = summed+maincell(plcrows,plccols).opin;
    end %plccols
end %plcrows
myplotter(next); %send to plot
blk = size(next); % acess size of array
for h = 1:blk(1)
    for k = 1:blk(2)
        maincell(h,k).opin = next(h,k); %populate maincell.opin with new results
    end
end
close all
end % func
