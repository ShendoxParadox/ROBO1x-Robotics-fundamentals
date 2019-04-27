function [ v05, w05 ] = lynx_velocities( thetas, thetadot )
%LYNX_VELOCITIES The input to the function will be:
%    thetas: The joint angles of the robot in radians - 1x5 matrix
%    thetadot: The rate of change of joint angles of the robot in radians/sec - 1x5 matrix
%    The output has 2 parts:
%    v05 - The linear velocity of frame 5 with respect to frame 0, expressed in frame 0.
%    w05 - The angular velocity of frame 5 with respect to frame 0, expressed in frame 0.
%    They are both 1x3 matrices of the form [x y z] for a vector xi + yj + zk

    %% YOUR CODE GOES HERE
    
a = 3;
b = 5.75;
c = 7.375;
d = 4.125;

theta1 = thetas(1);
theta2 = thetas(2);
theta3 = thetas(3);
theta4 = thetas(4);
theta5 = thetas(5);

A1 = compute_dh_matrix(0, (-90*pi/180), a, theta1);
A2 = compute_dh_matrix(b, 0, 0, (-90*pi/180) + theta2);
A3 = compute_dh_matrix(c, 0, 0, (90*pi/180) + theta3);
A4 = compute_dh_matrix(0, (-90*pi/180), 0, (-90*pi/180) + theta4);
A5 = compute_dh_matrix(0, 0, d, theta5);

T01 = A1;
T02 = T01 * A2;
T03 = T02 * A3;
T04 = T03 * A4;
T05 = T04 * A5;

Z0 = [0; 0; 1]; 
Z1 = T01(1:3,3);
Z2 = T02(1:3,3);
Z3 = T03(1:3,3);
Z4 = T04(1:3,3);
Z5 = T05(1:3,3);

P0 = [0; 0; 0];
P1 = T01(1:3,4);
P2 = T02(1:3,4);
P3 = T03(1:3,4);
P4 = T04(1:3,4);
P5 = T05(1:3,4);

Jp1 = cross(Z0, P5-P0);
Jp2 = cross(Z1, P5-P1);
Jp3 = cross(Z2, P5-P2);
Jp4 = cross(Z3, P5-P3);
Jp5 = cross(Z4, P5-P4);


Jo1 = Z0;
Jo2 = Z1;
Jo3 = Z2;
Jo4 = Z3;
Jo5 = Z4;

J = [Jp1 Jp2 Jp3 Jp4 Jp5; Jo1 Jo2 Jo3 Jo4 Jo5];

x_dot = J * thetadot'



v05 = x_dot(1:3,1)';
w05 = x_dot(4:6,1)';



    
end