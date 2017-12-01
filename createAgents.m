function Agents = createAgents(nums,avg)
%Max of 26 agents
agentnum = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
Agents = struct;
% Loop through for each agent
for i=1:nums
   node.location_row = round(rand()*rows); % current location of agent
   node.location_col = round(rand()*cols); % current location of agent
   for j = rows:-1:1
       for k = cols:-1:1
        grid(j,k).agents = rand(1,nums);  
        grid(j,k).convinced = avg;%  
       end%cols
   end %rows
   node.grid = grid;
   Agents.(agentnum(i)) = node; 
end
end