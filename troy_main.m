clear all;
close all;
clc;

%% Declare variables
global rows
global cols
rows = 5;
cols = 5;

%% Go!
%maingrid = zeros(rows,cols); %Preallocate for speed
for i = 1: rows
    for j = 1 : cols
        node.stub = 0.3+.7*rand;
        node.opin = rand*100;
        node.agents = rand(1,3);
        maingrid(i,j) = node;
    end
end
Marcus_test(maingrid, 1,1)