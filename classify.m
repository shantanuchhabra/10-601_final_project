function [t] = classify(Model, X)

M = Model.M;
V = Model.V;
p = Model.p;

N = size(X,1);
 reshaped = reshape(X(1,:), [32, 32, 3]);
 extracted = extract_feat(reshaped);
 K = size(extracted, 1);
 xTest = zeros(N,K);
 for i = 1:size(X,1)
     reshaped = reshape(X(i,:), [32, 32, 3]);
     xTest(i,:) = extract_feat(reshaped);
 end

classes = length(p); 
resultsTable = zeros(size(xTest,1), 1);  

for k = 1 : classes
    mu(k, :) = M(:, k);
    sig(k, :) = sqrt(V(:, k));
end  
for j = 1 : size(xTest, 1) 
  pxi = log(normpdf(ones(classes, 1)*xTest(j, :), mu, sig)); 
  P(j,:) = log(p) + sum(pxi,2);
  [~, argMax] = max(P(j, :)); 
  resultsTable(j) = argMax -1;
end    

t = resultsTable;

end