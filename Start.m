clear all
close all
clc
tic;
%% Variale initializing
global widthy
global lengthy
widthy = 5;
lengthy = 7;

mainCell = cell(widthy,lengthy); %Preallocate for speed
z = zeros(widthy,lengthy);
%% filling cells
for i=1:widthy
    for j = 1:lengthy
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
avg = summed /(lengthy*widthy);
[summed, avg] = plotter(mainCell);

%% ALGORITHMS 
% - FINDING GROUP LOW
radius_influence = 1; %



toc;