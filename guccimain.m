%% TENTATIVE MAIN FUNC BY JAKE AND MARCUS
clear all;
close all;
clc;

%% Declare variables
global rows
global cols
global agentnum
agentnum = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
rows = 10;
cols = 10;
nums = 3;       % number of agents deployed
maxtime = 600; % amount of time in minutes
inc = 10;        % minutes per iteration
Goal = 90;      % final avg opin goal
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
fprintf("The initial opinion of the group was: %d\n",InitialOpinion);
CurrentOpinion = InitialOpinion;
Agents = createAgents(nums,InitialOpinion);
plotter(maingrid, Agents);
%% Simulate
for time = 0:inc:maxtime-1
    avg = averagetaker(maingrid);
    choice = DecisionFunction(avg,InitialOpinion, Goal, CurrentOpinion, maxtime, time);
    if (choice == 1)
        Agents = scatter(Agents, maingrid);
    elseif (choice == 0)
        Agents = agentDeploy(Agents);
    end% End of If statement
        
    maingrid = RecalcOpinions(maingrid, Agents, 1);
end %End of time
fo = averagetaker(maingrid);
fprintf("The final opinion of the group is: %d\n",fo);