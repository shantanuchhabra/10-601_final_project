function [Model] = train(X,Y)
 %% convert X,Y to something extract_feat understands
 % extract_feat returns an array, that is the features for every image.
 N = size(X,1);
 reshaped = reshape(X(1,:), [32, 32, 3]);
 extracted = extract_feat(reshaped);
 K = size(extracted, 1);
 features = zeros(N,K);
 for i = 1:size(X,1)
     reshaped = reshape(X(i,:), [32, 32, 3]);
     features(i,:) = extract_feat(reshaped);
 end
[M, V] = likelihood(features, Y);
p = prior(Y);
   
 %% Make Model a struct with M, V, and p.
    Model.M = M;
    Model.V = V;
    Model.p = p;
 
   save('Model.mat', 'Model');
end