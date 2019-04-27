function [ v06, w06 ] = puma_velocities( thetas, thetadot )
%PUMA_VELOCITIES The input to the function will be:
%    thetas: The joint angles of the robot in radians - 1x6 matrix
%    thetadot: The rate of change of joint angles of the robot in radians/sec - 1x6 matrix
%    The output has 2 parts:
%    v06 - The linear velocity of frame 6 with respect to frame 0, expressed in frame 0.
%    w06 - The angular velocity of frame 6 with respect to frame 0, expressed in frame 0.
%    They are both 1x3 matrices of the form [x y z] for a vector xi + yj + zk

    %% YOUR CODE GOES HERE
    
    v06 = zeros(1, 3);
    w06 = zeros(1, 3);
    
    a = 13;
    b = 2.5;
    c = 8;
    d = 2.5;
    e = 8;
    f = 2.5;
    
    theta1 = thetas(1);
    theta2 = thetas(2);
    theta3 = thetas(3);
    theta4 = thetas(4);
    theta5 = thetas(5);
    theta6 = thetas(6);
    
    A1 = compute_dh_matrix( 0 , pi/2 , a , theta1 );
    A2 = compute_dh_matrix( c , 0 , -b , theta2 );
    A3 = compute_dh_matrix( 0 , -pi/2 , -d , theta3 );
    A4 = compute_dh_matrix( 0 , pi/2 , e , theta4 );
    A5 = compute_dh_matrix( 0 , -pi/2 , 0 , theta5 );
    A6 = compute_dh_matrix( 0 , 0 , f , theta6 );
    
    T01 = A1;
    T02 = T01 * A2;
    T03 = T02 * A3;
    T04 = T03 * A4;
    T05 = T04 * A5;
    T06 = T05 * A6;
    
Z0 = [0; 0; 1]; 
Z1 = T01(1:3,3);
Z2 = T02(1:3,3);
Z3 = T03(1:3,3);
Z4 = T04(1:3,3);
Z5 = T05(1:3,3);
Z6 = T06(1:3,3);

P0 = [0; 0; 0];
P1 = T01(1:3,4);
P2 = T02(1:3,4);
P3 = T03(1:3,4);
P4 = T04(1:3,4);
P5 = T05(1:3,4);
P6 = T06(1:3,4);

Jp1 = cross(Z0, P6-P0);
Jp2 = cross(Z1, P6-P1);
Jp3 = cross(Z2, P6-P2);
Jp4 = cross(Z3, P6-P3);
Jp5 = cross(Z4, P6-P4);
Jp6 = cross(Z5, P6-P5);


Jo1 = Z0;
Jo2 = Z1;
Jo3 = Z2;
Jo4 = Z3;
Jo5 = Z4;
Jo6 = Z5;
    
    
    J = [Jp1 Jp2 Jp3 Jp4 Jp5 Jp6; Jo1 Jo2 Jo3 Jo4 Jo5 Jo6];
    
x_dot = J * thetadot';



v06 = x_dot(1:3,1)';
w06 = x_dot(4:6,1)';
    
    
    
    
end