function [Agents] = agentDeploy(Agents)
global rows;
global cols;
i = 1:numel(fieldnames(Agents));
ag = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
i = i(randperm(length(i)));
taken = zeros(length(i),2);
for j = 1:length(i)
    %disp(ag(i(j)));
    curragents = Agents.(ag(i(j)));
    for k=rows:-1:1
        for l=cols:-1:1
            temp(k,l) = curragents.grid(k,l).convinced;
        end
    end
    sorted = sort(temp(:));
    ctr =1;
    cont =1;
    while cont == 1
        logi = 0;
        low = find(temp == sorted(ctr),ctr);
        [lowsx,lowsy] = ind2sub([rows,cols],low(end));
        for h = 1:length(taken)
            if (taken(h,:)== [lowsx,lowsy])
                logi = 1;
            end
        end
        if logi == 1
            cont = 1;
        else
            cont =0;
            taken(j,:) = [lowsx,lowsy];
        end
        ctr = ctr+1;
    end
    Agents.(ag(i(j))).location_row = lowsx;
    Agents.(ag(i(j))).location_col = lowsy;
end
    
end %func