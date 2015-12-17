function [p] = prior(yTrain)
    listOfParams = unique(yTrain);
    denom = length(yTrain);
    [a, b] = histc(yTrain, listOfParams); 
    p = a/denom;
end