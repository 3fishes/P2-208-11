function [maingrid] = RecalcOpinions(maingrid,A,plot)
global rows;  % rows in node matrix
global cols;  % cols in node matrix
agentnum = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
next = zeros(rows, cols);
%% Extract Agent Locations
% ARRAY INDEX 1 = ROW, INDEX 2 = COL
for i = 1:numel(fieldnames(A))
   loc(i,1) =  A.(agentnum(i)).location_row;
   loc(i,2) =  A.(agentnum(i)).location_col; 
end
%% ITERATING THROUGH
% For Non-Agent Places
for plcrows = 1 : rows
    summed = 0;
    for plccols = 1: cols
        %% Deal with boundary cases
        currentloc(1) = plcrows;
        currentloc(2) = plccols;
        if any(isequal(currentloc, loc(:)))
            next(plcrows,plccols) = maingrid(plcrows,plccols).opin;
        else
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
                commonfact = 1-(sum(abs(maingrid(plcrows,plccols).agents-maingrid(i(u),plccols).agents)))/3;
                % complicated algorithm
                val = commonfact*maingrid(plcrows,plccols).stub*((maingrid(plcrows,plccols).opin + maingrid(i(u),plccols).opin)/2 - maingrid(plcrows,plccols).opin);
                % collect the sum effect of each node on the central node
                % divide by length of i because edge cases only have one
                % effecting node vs regular case has 2
                summed = (summed + val)/length(i);
            end %u
            for v = 1:length(j) %cols
                commonfact = 1-(sum(abs(maingrid(plcrows,plccols).agents-maingrid(plcrows,j(v)).agents)))/3;
                val = commonfact*maingrid(plcrows,plccols).stub*((maingrid(plcrows,plccols).opin + maingrid(plcrows,j(v)).opin)/2 - maingrid(plcrows,plccols).opin);
                summed = (summed + val)/length(j);
            end %v
            next(plcrows,plccols) = summed+maingrid(plcrows,plccols).opin;
        end
    end %plccols
end %plcrows

%Recalc the agents' talkees
for i = 1:numel(fieldnames(A))
    row = A.(agentnum(i)).location_row;
    col = A.(agentnum(i)).location_col;
    stub = maingrid(row,col).agents(i);
    next(row,col) = stub*((100+maingrid(row,col).opin)/2 - maingrid(row,col).opin)+maingrid(row,col).opin;
end

blk = size(next); % acess size of array
for h = 1:blk(1)
    for k = 1:blk(2)
        maingrid(h,k).opin = next(h,k); %populate maincell.opin with new results
    end
end
if plot
    plotter(maingrid, A); %send to plot
end
end % func
