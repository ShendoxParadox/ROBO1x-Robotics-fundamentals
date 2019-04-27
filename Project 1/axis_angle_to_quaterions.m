% In this script, you need to convert the axis-angle representation into quaternion form
% Your final solution for the quaternion representation must be stored in quat
% If the quaternion is Qs + Qx i + Qy j + Qz k, it should be stored as [Qs, Qx, Qy, Qz]

task1_solution = zeros(24, 4);

% Test code for 24 different axis-angle representations
for i = 1:24

    [vec, theta] = genAxisAngle(); % Generates a random axis-angle representation
    % vec is a 1x3 matrix of the form [x y z] for a vector xi + yj + zk
    % theta is in radians
    
    %% Your code starts here
    
    
    % Your solution for quat must be 1x4 matrix
   
    quat = [0 0 0 0];
    
    quat = [cos(theta/2), vec(1) * sin(theta/2), vec(2) * sin(theta/2), vec(3) * sin(theta/2)];
    
    %% Your code ends here
    
    %% Storing answer for auto-grading
    if ~isequal(size(quat), [1 4])
        error('quat must be a 1x4 matrix')
    end
    
    task1_solution(i, :) = quat;
end