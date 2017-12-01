function [choice, CurrentOpinion] = DecisionFunction (AVGofOpinions,InitialOpinion, OpinionGoal, CurrentOpinion, maxtime, time)

timeleft = maxtime - time;

DesiredRate = ((OpinionGoal - CurrentOpinion)/timeleft);

CurrentOpinion = InitialOpinion + DesiredRate*time;

ActualOpinion = AVGofOpinions;

if (ActualOpinion <= CurrentOpinion)
    choice = 1;
    
elseif(CurrentOpinion < ActualOpinion)
    choice = 0;
end %%Ending above if statement

end %% Ending Overall Function