function [label] = findLabel(test_ex, centroids)
    mindist = intmax('int32');
    label = 0;
    for i = 1:10
        centroid = centroids(i,:);
        dist = euclidean(centroid, test_ex);
        if (dist <= mindist) 
            mindist = dist;
            label = i-1;
        end
    end
end