function [Agents] = scatter (Agents)
    agentnum = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    
    for i = 1:numel(fieldnames(A))
        
        while (grid(j,k).discovered == 1)
        j = round(rand()*rows);
        k = round(rand()*cols);
        
            if (grid(j,k).discovered == 0)
            A.(agentnum(i)).location_row = j;
            A.(agentnum(i)).location_col = k;
            end% End of If statement
            
        end% End of while loop
        
    end % End of for loop  
end% End of Function