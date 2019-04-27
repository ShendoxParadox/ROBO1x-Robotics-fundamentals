% In this script, you need to convert the quaternion to a rotation matrix
% Your final solution for the rotation matrix must be stored in R
% The quaternion for Qs + Qx i + Qy j + Qz k, is represented in matrix form as [Qs, Qx, Qy, Qz]

task2_solution = zeros(3*20, 3);

% Test code for 20 different quaternions
for i = 1:20

    quat = genQuaternion(); % Generates a random quaternion
    % quat is a 1x4 matrix of the form [Qs, Qx, Qy, Qz]
    
    %% Your code starts here
    qs = quat(1);
    qx = quat(2);
    qy = quat(3);
    qz = quat(4);
    
    
    % Your solution for R must be a 3x3 matrix
    R = eye(3);
    R = [1-2*qy^2-2*qz^2, 2*qx*qy-2*qz*qs, 2*qx*qz+2*qy*qs; ...
    2*qx*qy+2*qz*qs, 1-2*qx^2-2*qz^2, 2*qy*qz-2*qx*qs; ...
    2*qx*qz-2*qy*qs, 2*qy*qz+2*qx*qs, 1-2*qx^2-2*qy^2];
    %% Your code ends here
    
    %% Storing answer for auto-grading
    if ~isequal(size(R), [3 3])
        error('R must be a 3x3 matrix')
    end
    
    task2_solution(((i-1)*3)+1:((i-1)*3)+3, :) = R;
end;