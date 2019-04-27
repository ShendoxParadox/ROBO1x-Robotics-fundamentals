function [ pos ] = lynx_fk( theta1, theta2, theta3, theta4, theta5, g )
%LYNX_FK The input to the function will be the joint
%    angles of the robot in radians, and the distance between the gripper pads in inches.
%    The output must contain 10 positions of various points along the robot arm as specified
%    in the question.

    %% YOUR CODE GOES HERE
    pos = zeros(10, 4);

end

function A = compute_dh_matrix(r, alpha, d, theta)

    % Your code from part 1 of the assignment goes here
     
end