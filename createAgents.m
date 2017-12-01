function Agents = createAgents(nums,avg)
%Max of 26 agents
agentnum = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
Agents = struct;
% Loop through for each agent
for i=1:nums
   node.location_row = 1 + round(rand()*(rows-1)); % current location of agent
   node.location_col = 1 + round(rand()*(cols-1)); % current location of agent
   for j = rows:-1:1
       for k = cols:-1:1
        grid(j,k).agents = rand(1,nums);  
        grid(j,k).convinced = avg;%
        grid(j,k).discovered = 0;
       end%cols
   end %rows
   node.grid = grid;
   Agents.(agentnum(i)) = node; 
end
end