function [M, V] = likelihood(xTrain, yTrain)
    classes = unique(yTrain);
    numClasses = length(classes);
    for i=1:size(xTrain, 2)
        for k=1:numClasses
            denom = sum(yTrain == classes(k));
            num = 0;
            for j=1:length(yTrain)
                if (yTrain(j) == classes(k))
                    num = num + xTrain(j, i);
                end
            end
            M(i, k) = num/denom;
            mean = M(i, k);
            num = sum((yTrain == classes(k)) .* ((xTrain(:,i) - mean).^2));
            V(i, k) = num/denom;
        end
    end
end
