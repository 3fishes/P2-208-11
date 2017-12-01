function [choice, CurrentOpinion] = DecisionFunction (InitialOpinion, OpinionGoal, CurrentOpinion, maxtime, time)

timeleft = maxtime - time;

if(timeleft == maxtime)
DesiredRate = ((OpinionGoal - InitialOpinion)/timeleft);

elseif(timeleft < maxtime)
DesiredRate = ((OpinionGoal - CurrentOpinion)/timeleft);
end %%Ending above if statement

CurrentOpinion = InitialOpinion + DesiredRate*time;

ActualOpinion = AVGofOpinions;

if (ActualOpinion <= CurrentOpinion)
    choice = 1;
    
elseif(CurrentOpinion < ActualOpinion)
    choice = 0;
end %%Ending above if statement

end %% Ending Overall Function