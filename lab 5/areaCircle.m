function area = areaCircle(r)

r(r<0) = NaN;
area = pi * r.^2;

area(isnan(area)) = -1;

end