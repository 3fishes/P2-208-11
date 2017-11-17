clear all;
close all;
clc;
tic;
%% Variale initializing
global rows
global cols

%% ARENA DIMENSIONS
rows = 5;  %width of the arena
cols = 7; %length of the arena

mainCell = cell(rows,cols); %Preallocate for speed
z = zeros(rows,cols);
%% filling cells
for i=1:rows
    for j = 1:cols
    struct.convinced = rand*100;
    struct.A = rand;
    struct.B = rand;
    struct.C = rand;
    mainCell{i,j} = struct;
    clear struct;
    end
end
summed = 0;
%% plotting
surf(z);
avg = summed /(cols*rows);
[summed, avg] = plotter(mainCell);

%% ALGORITHMS 
% - FINDING GROUP LOW




toc;