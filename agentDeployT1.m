function [Agents] = agentDeployT1(Agents)
global rows;
global cols;
global agentnums;
nums = 1:numel(fieldnames(Agents));

for i = 1:nums
    for p = nums
        loc(p,1) =  A.(agentnum(p)).location_row;
        loc(p,2) =  A.(agentnum(p)).location_col; 
    end
    min(i) = 100;
    row(i) = -1;
    col(i) = -1;
    counter = 0;
    for j = 1:rows
        for k = 1:cols
            currentloc(1) = j;
            currentloc(2) = k;
            if ~any(isequal(currentloc, loc(:)))
                counter = counter + 1;
                if A.(agentnums(i)).grid(j,k).opin < min
                   min = A.(agentnums(i)).grid(j,k).opin;
                   row(i) = j;
                   col(i) = k;
                end
            else
               disp("START")
               disp(currentloc)
               disp(loc(:))
               disp("END")
            end
        end
    end
    fprintf(counter);
end

end