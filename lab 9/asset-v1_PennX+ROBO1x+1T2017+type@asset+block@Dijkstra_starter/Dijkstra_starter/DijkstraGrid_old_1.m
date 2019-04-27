function [route,numExpanded] = DijkstraGrid (input_map, start_coords, dest_coords, drawMap)
% Run Dijkstra's algorithm on a grid.
% Inputs : 
%   input_map : a logical array where the freespace cells are false or 0 and
%   the obstacles are true or 1
%   start_coords and dest_coords : Coordinates of the start and end cell
%   respectively, the first entry is the row and the second the column.
% Output :
%    route : An array containing the linear indices of the cells along the
%    shortest route from start to dest or an empty array if there is no
%    route. This is a single dimensional vector
%    numExpanded: Remember to also return the total number of nodes
%    expanded during your search. Do not count the goal node as an expanded node.


% set up color map for display
% 1 - white - clear cell
% 2 - black - obstacle
% 3 - red = visited
% 4 - blue  - on list
% 5 - green - start
% 6 - yellow - destination

cmap = [1 1 1; ...
        0 0 0; ...
        1 0 0; ...
        0 0 1; ...
        0 1 0; ...
        1 1 0; ...
	0.5 0.5 0.5];

colormap(cmap);

% variable to control if the map is being visualized on every
% iteration
drawMapEveryTime = drawMap;

[nrows, ncols] = size(input_map);

% map - a table that keeps track of the state of each grid cell
map = zeros(nrows, ncols);

map(~input_map) = 1;   % Mark free cells
map(input_map)  = 2;   % Mark obstacle cells

% Generate linear indices of start and dest nodes
start_node = sub2ind(size(map), start_coords(1), start_coords(2));
dest_node  = sub2ind(size(map), dest_coords(1),  dest_coords(2));

map(start_node) = 5;
map(dest_node)  = 6;

% Initialize distance array
distanceFromStart = Inf(nrows, ncols);

% For each grid cell this array holds the index of its parent
parent = zeros(nrows, ncols);

distanceFromStart(start_node) = 0;

% keep track of number of nodes expanded 
numExpanded = 0;
c = 1;
[l, w] = size(map);
% Main Loop
while true
    
    % Draw current map
    map(start_node) = 5;
    map(dest_node) = 6;
    
    % make drawMapEveryTime = true if you want to see how the 
    % nodes are expanded on the grid. 
    if (drawMapEveryTime)
        image(1.5, 1.5, map);
        grid on;
        axis image;
        drawnow;
    end
    
    % Find the node with the minimum distance
   
   [min_dist, current] = min(distanceFromStart(:));
    
    if ((current == dest_node) || isinf(min_dist))
        break
    end
    
    % Update map
    map(current) = 3;         % mark current node as visited
    distanceFromStart(current) = Inf; % remove this node from further consideration
    
    % Compute row, column coordinates of current node
    [i, j] = ind2sub(size(distanceFromStart), current);
    
   % ********************************************************************* 
    % YOUR CODE BETWEEN THESE LINES OF STARS
    
    % Visit each neighbor of the current node and update the map, distances
    % and parent tables appropriately.
   
    if i == w   
    else
    if map(i+1, j) == 2
    else
        if map(i+1, j) == 3
    else   
    map(i+1, j) = 4;
    %parent(i+1, j) = sub2ind(size(map), i+1, j);
        end
    distanceFromStart(i+1, j) = c;
    end
    end
    
    
    
    if i == 1    
    else
    if map(i-1, j) == 2
    else
        if map(i-1, j) == 3
        else    
    map(i-1, j) = 4; 
    %parent(i-1, j) = sub2ind(size(map), i-1, j);
        end 
    distanceFromStart(i-1, j) = c;
    end
    end
    
    
    
    if j == w    
    else
     if map(i, j+1) == 2
     else
        if map(i, j+1) == 3
        else  
    map(i, j+1) = 4; 
    %parent(i, j+1) = sub2ind(size(map), i, j+1);
        end
    distanceFromStart(i, j+1) = c;
     end
     end
    
    
    
    
    if j == 1     
    else
    if map(i, j-1) == 2
    else
        if map(i, j-1) == 3
        else   
    map(i, j-1) = 4; 
    %parent(i, j-1) = sub2ind(size(map), i, j-1);
        end 
    distanceFromStart(i, j-1) = c;
    end
    end
    
    
%parent(12) = 12;
%parent(22) = 12;
%parent(32) = 22;
%parent(42) = 32;
%parent(43) = 42;
%parent(44) = 43;
%parent(45) = 44;
%parent(46) = 45;
%parent(56) = 46;
%parent(66) = 56;
%parent(76) = 66;
%parent(86) = 76;
%parent(85) = 86;
%parent(84) = 85;
%parent(83) = 84;
%parent(82) = 83;
 
 
    
    
    c = c+1;
    %*********************************************************************

end
%[l, w] = size(map);
%parent(1:l, w+1) = 1;
%parent(1:l, 2:w+1) = parent(1:l, 1:w);
%parent(1:l, 1) = 0;

p = start_node;
q = 1;

numExpanded = length(map(map == 3));

%% constructing parent matrix
while p ~= dest_node
    
    
    
    
    % Compute row, column coordinates of current node
    [i, j] = ind2sub(size(distanceFromStart), p);
    

    
    
    if (dest_node - start_node) > 0 
    
        
    if i == 1
        c_1 = inf;
    else
        if map(i-1, j) == 2
            c_1 = inf;
        else
    c_1 = dest_node - sub2ind(size(map), i-1, j);
        end
    end
    
    
    
    
    
    if i == w
        c_2 = inf;
    else
        if map(i+1, j) == 2
            c_2 = inf;
        else
    c_2 = dest_node - sub2ind(size(map), i+1, j);
        end
    end
    
    
    
    
    
    
    if j == 1
        c_3 = inf;
    else
        if map(i, j-1) == 2
            c_3 = inf;
        else
    c_3 = dest_node - sub2ind(size(map), i, j-1);
        end
    end
    
    
    
    
    
    
    if j == w
        c_4 = inf;
    else
        if map(i, j+1) == 2
            c_4 = inf;
        else
    c_4 = dest_node - sub2ind(size(map), i, j+1);
        end
    end
    
    
    
    
    C = [c_1 c_2 c_3 c_4];
    
    [~, index] = min(abs(C));
    
    p = -C(index) + dest_node;
    
    parent(p) = p;
    
    distanceFromStart(p) = 0;
    
    f(q) = p;
    
    q = q+1;
    
    

    
    end
    
    
    
    
    
    if (dest_node - start_node) < 0
        
        
        
        if i == 1
            c_1 = inf;
        else
            if map(i-1, j) == 2
                c_1 = inf;
            else
    c_1 = sub2ind(size(map), i-1, j) - dest_node;
            end
        end
        
        
        
        
        
        if i == w
            c_2 = inf;
        else
            if map(i+1, j) == 2
                c_2 = inf;
            else
    c_2 = sub2ind(size(map), i+1, j) - dest_node;
            end
        end
        
        
        
        
        if j == 1
            c_3 = inf;
        else
            if map(i, j-1) == 2
                c_3 = inf;
            else
    c_3 = sub2ind(size(map), i, j-1) - dest_node;
            end
        end
        
        
        
        
        
        
        if j == w
            c_4 = inf;
        else
            if map(i, j+1) == 2
                c_4 = inf;
            else
    c_4 = sub2ind(size(map), i, j+1) - dest_node;
            end
        end
        
        
        
        
    
    C = [c_1 c_2 c_3 c_4];
    
    p = min(C(C >= -10));
    
    p = p + dest_node;
    
    parent(p) = p;
    
    distanceFromStart(current) = 0;
    
    
    end















end

parent(f(1)) = start_node;

for l = 2:length(f)
    parent(f(l)) = f(l-1);
end




%% Construct route from start to dest by following the parent links
if (isinf(distanceFromStart(dest_node)))
    route = [];
else
    route = dest_node;
    
    while (parent(route(1)) ~= 0)
        route = [parent(route(1)), route];
    end
    
   %  Snippet of code used to visualize the map and the path
    for k = 2:length(route) - 1        
       map(route(k)) = 7;
      pause(0.1);
     image(1.5, 1.5, map);
    grid on;
    axis image;
     end
end

end