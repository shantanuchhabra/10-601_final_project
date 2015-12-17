function [t] = classify2(Model, X)
    N = size(X,1);
    reshaped = reshape(X(1,:), [32, 32, 3]);
    extracted = extract_feat2(reshaped);
    K = size(extracted, 1);
    xTest = zeros(N,K);
    for i = 1:size(X,1)
        reshaped = reshape(X(i,:), [32, 32, 3]);
        xTest(i,:) = extract_feat2(reshaped);
    end
    centroids = Model.centroids; % 10 * L, where L = #features
    oldcentroids = centroids;
    feats = Model.features;
    weights = Model.weights;
    numTsEx = size(xTest,1);
    numTrEx = size(feats,1);
    numFeats = size(feats,2);
    t = zeros(N,1);
    Y = Model.Y;
    for i = 1:numTsEx
        test = xTest(i,:);
        for iters = 1 : 1000
            label = findLabel(test, centroids);
            if (iters == 1) oldlabel = label; end
            if ~(oldlabel == label)
                centroids(oldlabel+1,:) = oldcentroids(oldlabel+1,:);
                weights(oldlabel+1) = weights(oldlabel+1) - 1;
            end
            centroids(label+1,:) = (weights(label+1) * centroids(label+1,:) + test)/(weights(label+1)+1);
            weights(label+1) = weights(label+1) + 1;
            oldlabel = label;
        end
        t(i) = label;
    end
end