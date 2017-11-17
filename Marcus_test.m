close all
clear all
clc

%% Randomize data
global lengthy;
global widthy;
lengthy = 5;
widthy = 5;
node = struct;
z = zeros(widthy,lengthy);
for i = 1: lengthy
    for j = 1 : widthy
        node.stub = rand;
        node.opin = rand;
        maincell(i,j) = node;
    end
end
z(:,:) = maincell(:,:).stub;