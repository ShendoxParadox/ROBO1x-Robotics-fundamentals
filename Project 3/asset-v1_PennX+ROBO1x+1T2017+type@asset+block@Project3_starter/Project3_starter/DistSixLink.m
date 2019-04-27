function out = DistSixLink (x1, x2)
% Compute the distance between two sets of six link coordinates
% Note we assume all angular coordinates are between 0 and 360
% Use sum of the absolute value of angle difference (L1 norm) as the
% distance.
% Note this is angle difference.
% i.e. DistSixLink([0, 0, 0, 0, 0, 0], [360, 360, 360, 360, 360, 360]) = 0

x1(x1 == 0) = 360;
x2(x2 == 0) = 360;

out = sum(abs(x1 - x2));






end
