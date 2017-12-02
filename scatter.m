function [Agents] = scatter (A, maingrid)

global rows
global cols
global agentnum

for i = 1:numel(fieldnames(A))
    
    j = 1 + round(rand()*(rows-1));
    k = 1 + round(rand()*(cols-1));
    
    while (A.(agentnum(i)).grid(j,k).discovered == 1)
        j = 1 + round(rand()*(rows-1));
        k = 1 + round(rand()*(cols-1));
    end% End of While loop
    
    A.(agentnum(i)).location_row = j;
    A.(agentnum(i)).location_col = k;
    A.(agentnum(i)).grid(j,k).discovered = 1;
    A.(agentnum(i)).grid(j,k).convinced = maingrid(j,k).opin;
end % End of for loop
Agents = A;
end% End of Function
