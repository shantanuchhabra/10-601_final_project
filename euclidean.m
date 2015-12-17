function [d] = euclidean(p1, p2)
    d = sqrt(sum((p1 - p2) .^ 2));
end