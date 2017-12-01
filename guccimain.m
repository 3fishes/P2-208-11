%% TENTATIVE MAIN FUNC BY JAKE AND MARCUS
clear all;
close all;
clc;

%% Declare variables
global rows
global cols
rows = 5;
cols = 5;
nums = 3;     % number of agents deployed
maxtime = 60; % number of iterations
inc = 10;     % minutes per iteration
Goal = 60;    % final avg opin goal
%% Initialize Main Grid, Randomly (For now)
for i = 1: rows
    for j = 1 : cols
        node.opin = rand*100;
        node.agents = rand(1,nums);
        node.stub = mean(node.agents);
        maingrid(i,j) = node;
    end
end
%% Initialise
InitialOpinion = averagetaker(maingrid);
CurrentOpinion = InitialOpinion;
Agents = createAgents(nums,InitialOpinion);

plotter(maingrid);
%% Simulate

for time = 0:inc:maxtime-1
    avg = averagetaker(maingrid);
    maingrid = RecalcOpinions(maingrid, 1,1, 1);
    choice = DecisionFunction(avg,InitialOpinion, Goal, CurrentOpinion, maxtime, time);
    if (choice == 1)
        Agents = scatter(Agents);
    elseif (choice == 0)
        Agents = agentDeploy(Agents);
    end %end if statement
end% end time loop


