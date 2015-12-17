function [answer] = nearestNeighbor(distFromOrigin, ts_ex, dist_trueval_feats, k)
    N = size(dist_trueval_feats,1);
    dim = size(dist_trueval_feats,2);
    gltIndex = greatestLessThan(dist_trueval_feats(:,1), distFromOrigin, 1, N);
    startIdx = max(1, floor(gltIndex - k/2));
    endIdx = min(N, floor(gltIndex + k/2));
    mindist = intmax('int32');
    answer = dist_trueval_feats(startIdx, 2);
    for i = startIdx : endIdx
        trained = dist_trueval_feats(i, 3:dim);
        dist = euclidean(ts_ex, trained);
        if (dist < mindist)
            mindist = dist;
            answer = dist_trueval_feats(i,2);
        end
    end
end