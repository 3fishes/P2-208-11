global rows
global cols
rows = 5;
cols = 5;
for i = 1: rows
    for j = 1 : cols
        node.stub = 0.3+.7*rand;
        node.opin = rand*100;
        node.agents = rand(1,3);
        maincell(i,j) = node;
    end
end
Marcus_test(maincell, 1,1)