g = zeros(7,6);
i = 6; j = 5;
jj = j;
[i_max, j_max] = size(g);
c = 1;

%% for horizontal stepping
%g(i, (j+1):end) = 1:1:(j_max - j);
%g(i, (j-1):-1:1) = 1:1:(j-1);



%% constructing g matrix
for f = 1:(j_max - (jj-1))
g((i+1):end,j) = c:1:(c-1)+(i_max - i);


c = c+1;

j = j+1;
end
c = 1;
j = jj;
for f = 1:(jj)
    
    g((i+1):end,j) = c:1:(c-1)+(i_max - i);
    
    c = c+1;
    
    j = j - 1;
end
c = 1;
j = jj;
for f = 1:(j_max - (jj-1))
    
    g((i-1):-1:1, j) = c:1:(c-1)+(i-1);
    
    c = c+1;
    
    j = j+1;
end
c = 1;
j = jj;
for f = 1:(jj)
    
    g((i-1):-1:1, j) = c:1:(c-1)+(i-1);
    
    c = c+1;
    
    j = j-1;
end
j = jj;
g(i, (j+1):end) = 1:1:(j_max - j);
g(i, (j-1):-1:1) = 1:1:(j-1);



