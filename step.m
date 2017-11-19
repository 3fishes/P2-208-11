function [next] = step(current)
global rows
global cols

%Breaking it up to cases
for i=1:rows
    if i==1
        %Top Edge
        for j = 1:cols  
            if j==1
                %Top Left Corner
                
            elseif j==cols
                %Top Right Corner
                
            else
                %Top Edge, middle
                
            end
        end
    elseif i==rows
        %Bottom Edge
        for j = 1:cols 
            if j==1
                %Bottom Left Corner

            elseif j==cols
                %Bottom Right Corner

            else
                %Bottom Edge, middle

            end
        end
    else
        %Middle Rows
        for j = 1:cols 
            if j==1
                %Left Edge

            elseif j==cols
                %Right Edge

            else
                %Middle Middle

            end
        end
    end
end
