function [Model1] = train1(X,Y)
 %% convert X,Y to something extract_feat understands
 % extract_feat returns an array, that is the features for every image.
 N = size(X,1);
 reshaped = reshape(X(1,:), [32, 32, 3]);
 extracted = extract_feat1(reshaped);
 K = size(extracted,1);
 features = zeros(N,K);
 for i = 1:N
     reshaped = reshape(X(i,:), [32, 32, 3]);
     features(i,:) = extract_feat1(reshaped);
 end
 %% Make model using distances from origin
 % features : N * K
 
 zerovec = zeros(1,K);
 cols = K+2;
 dist_trueval_feats = zeros(N, cols);
 for i = 1:N
     dist_trueval_feats(i,1) = sqrt(sum((features(i,:) - zerovec) .^ 2));
     dist_trueval_feats(i,2) = Y(i);
     dist_trueval_feats(i,3:cols) = features(i,:);
 end
 [~, ordering] = sort(dist_trueval_feats(:,1));
 dist_trueval_feats = dist_trueval_feats(ordering,:);
 Model1.dist_trueval = dist_trueval_feats;
 
 save('Model1.mat', 'Model1');
end