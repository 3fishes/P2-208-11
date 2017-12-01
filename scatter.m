function [Agents] = scatter (Agents)
    agentnum = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    
    for i = 1:numel(fieldnames(A))
        
        j = 1 + round(rand()*(rows-1));
        k = 1 + round(rand()*(cols-1));
        
        while (A.(agentnum(i).grid(j,k).discovered == 1)
        j = 1 + round(rand()*(rows-1));
        k = 1 + round(rand()*(cols-1));
        
            if (A.(agentnum(i).grid(j,k).discovered == 0)
            A.(agentnum(i)).location_row = j;
            A.(agentnum(i)).location_col = k;
            end% End of If statement
            
        end% End of while loop
        
    end % End of for loop  
end% End of Function