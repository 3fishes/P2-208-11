close all;
clear all;
clc
iterations = 1000; % fix this for simulation phases

global rows;  % rows in node matrix
global cols;  %cols in node matrix
rows = 5;
cols = 5;
node = struct;
%% POPULATING NODES WITH RANDOM VALUES
for i = 1: rows
    for j = 1 : cols
        node.stub = 0.3+.7*rand;
        node.opin = rand*100;
        node.agents = rand(1,3);
        maincell(i,j) = node;
    end
end
t = 1;

%% ITERATING THROUGH
while(t<iterations) %fix number of refresh numbers
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
z = myplotter(next); %send to plot
blk = size(next); % acess size of array
for h = 1:blk(1)
    for k = 1:blk(2)
        maincell(h,k).opin = next(h,k); %populate maincell.opin with new results
    end
end
t = t +1; %increment time
end % iterations
        
