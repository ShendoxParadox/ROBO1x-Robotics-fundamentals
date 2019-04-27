function [ pos ] = lynx_fk( theta1, theta2, theta3, theta4, theta5, g )
%LYNX_FK The input to the function will be the joint
%    angles of the robot in radians, and the distance between the gripper pads in inches.
%    The output must contain 10 positions of various points along the robot arm as specified
%    in the question.



    %% YOUR CODE GOES HERE
    pos = zeros(10, 3);
    a = 3;
    b = 5.75;
    c = 7.375;
    d = 4.125;
    e = 1.125;
    
    pos(1,1:3) = 0;
    A1 = compute_dh_matrix(0, (-pi/2), a, theta1);
    pos(2,1:3) = A1(1:3,4)';
    A2 = compute_dh_matrix(b, 0, 0, (-pi/2)+theta2);
    A02 = A1 * A2;
    pos(3,1:3) = A02(1:3,4)';
    A3 = compute_dh_matrix(c, 0, 0, (pi/2)+theta3);
    A03 = A1 * A2 * A3;
    pos(4,1:3) = A03(1:3,4)';
    A4 = compute_dh_matrix(0, (-pi/2), 0, (-pi/2)+theta4);
    A04 = A1 * A2 * A3 * A4;
    pos(5,1:3) = A04(1:3,4)';
    
    A5 = compute_dh_matrix(0, 0, d, theta5);
    
   
    A51 = eye(4);
    A51(1:3, 4) = [0 0 -e]';
    A051 = A1 * A2 * A3 * A4 * A5 * A51;
    pos(6, 1:3) = A051(1:3, 4);
    
    A52 = eye(4);
    A52(1:3, 4) = [g/2 0 -e]';
    A052 = A1 * A2 * A3 * A4 * A5 * A52;
    pos(7, 1:3) = A052(1:3, 4);
    
    A53 = eye(4);
    A53(1:3, 4) = [-g/2 0 -e]';
    A053 = A1 * A2 * A3 * A4 * A5 * A53;
    pos(8, 1:3) = A053(1:3, 4);
    
    A54 = eye(4);
    A54(1:3, 4) = [g/2 0 0]';
    A054 = A1 * A2 * A3 * A4 * A5 * A54;
    pos(9, 1:3) = A054(1:3, 4);
    
    A55 = eye(4);
    A55(1:3, 4) = [-g/2 0 0]';
    A055 = A1 * A2 * A3 * A4 * A5 * A55;
    pos(10, 1:3) = A055(1:3, 4);
   
    

end

function A = compute_dh_matrix(r, alpha, d, theta)

 A = eye(4);
    
    A(1,1) = cos(theta);
    A(1,2) = -sin(theta)*cos(alpha);
    A(1,3) = sin(theta)*sin(alpha);
    A(1,4) = r*cos(theta);
    
    A(2,1) = sin(theta);
    A(2,2) = cos(theta)*cos(alpha);
    A(2,3) = -cos(theta)*sin(alpha);
    A(2,4) = r*sin(theta);
    
    A(3,1) = 0;
    A(3,2) = sin(alpha);
    A(3,3) = cos(alpha);
    A(3,4) = d;
    
    A(4,1) = 0; 
    A(4,2) = 0;
    A(4,3) = 0;
    A(4,4) = 1;
    
    % Your code from part 1 of the assignment goes here
     
end