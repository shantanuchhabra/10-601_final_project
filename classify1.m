function [t] = classify1(Model2, X)
    dist_trueval = Model2.dist_trueval;
    N = size(X,1);
    reshaped = reshape(X(1,:), [32, 32, 3]);
    extracted = extract_feat1(reshaped);
    K = size(extracted, 1);
    xTest = zeros(N,K);
    t = zeros(N,1);
    zerovec = zeros(1,K);
    for i = 1:N
        reshaped = reshape(X(i,:), [32, 32, 3]);
        xTest(i,:) = extract_feat1(reshaped);
    end
    for i = 1:N
        ts_ex = xTest(i,:);
        fromOrigin = euclidean(ts_ex, zerovec);
        k = 5000;
        t(i) = nearestNeighbor(fromOrigin, ts_ex, dist_trueval, k);
    end
end