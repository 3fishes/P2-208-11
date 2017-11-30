clear all;
close all;
clc;

%% Declare variables
global rows
global cols
rows = 5;
cols = 5;

%% Initialize Main Grid, Randomly (For now)
for i = 1: rows
    for j = 1 : cols
        node.stub = 0.3+.7*rand;
        node.opin = rand*100;
        node.agents = rand(1,3);
        maingrid(i,j) = node;
    end
end

%% Create Agents
A = createAgents(3;

%% Simulate!
plotter(maingrid);
for i = 1:1000
    maingrid = RecalcOpinions(maingrid, 1,1, 1);
end