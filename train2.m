function [Model2] = train2(X,Y)
    %% convert X,Y to something extract_feat understands
    % extract_feat returns an array, that is the features for every image.
    N = size(X,1);
    reshaped = reshape(X(1,:), [32, 32, 3]);
    extracted = extract_feat2(reshaped);
    K = size(extracted, 1);
    features = zeros(N,K);
    for i = 1:size(X,1)
        reshaped = reshape(X(i,:), [32, 32, 3]);
        features(i,:) = extract_feat2(reshaped);
    end
    %% determine centroids of 10 clusters
    counts = zeros(1,10);
    L = size(features,2);
    numerator = zeros(10, L);
    N = size(features,1);
    centroids = zeros(10, L);
    for i = 1:10
        counts(i) = sum(Y == i-1);
        for j = 1:N
            if (Y(j) == i-1)
                numerator(i,:) = numerator(i,:) + features(j,:);
            end
        end
        centroids(i,:) = numerator(i,:)/counts(i);
    end
    
    %% initialize weights as len(features)
    weights = zeros(1,10);
    for i = 1:10
        weights(i) = size(features,1);
    end
    
    
    %% Make Model
    Model2.centroids = centroids; % 10 * L, where L = #features
    Model2.features = features;
    Model2.Y = Y;
    Model2.weights = weights;
    
    %% Save Model in Model.mat
    save('Model2.mat', 'Model2');
    
end