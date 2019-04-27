function [ ik_sol ] = puma_ik( x, y, z, R )
%PUMA_IK Write your code here. The input to the function will be the position of
%    the end effector (in inches) in the world frame, and the 
%    Rotation matrix R_60 as described in the question.
%    The output must be the joint angles of the robot to achieve 
%    the desired end effector position and orientation.

    %% YOUR CODE GOES HERE

    ik_sol = ones(1, 6);
    
    a = 13;
    b = 2.5;
    c = 8;
    d = 2.5;
    e = 8;
    f = 2.5;
    
   % syms theta1 theta2 theta3 theta4 theta5 theta6
    
   % A1 = compute_dh_matrix( 0 , pi/2 , a , theta1 );
   % A2 = compute_dh_matrix( c , 0 , -b , theta2 );
   % A3 = compute_dh_matrix( 0 , -pi/2 , -d , theta3 );
   % A4 = compute_dh_matrix( 0 , pi/2 , e , theta4 );
   % A5 = compute_dh_matrix( 0 , -pi/2 , 0 , theta5 );
   % A6 = compute_dh_matrix( 0 , 0 , f , theta6 );
    
   % T06 = A1 * A2 * A3 * A4 * A5 * A6;
    
  %  l = sqrt(x^2 + y^2);
  %  x_c = sqrt(l^2 - (b+d)^2);
    
   
   %% Gettin Theta 3
   m = sqrt((z - a )^2 + x^2);
    
    theta3_1 = (m^2 - e^2 - c^2) / (2 * e * c);
    theta3 =  (acosd(theta3_1) - 90)
    
    
    %% Getting Theta 2
    % at x = +ve  z = +ve
   if x > 0 && z > 0
    theta2_1 = ((e^2 - m^2 - c^2)/(2 * m * c));
    theta2_2 = ((x^2 - (z-a)^2 - m^2)/(2*m*(z-a)));
    
    if theta2_1 < 0 
        theta2_1 = 180 - acosd(theta2_1);
    else
        theta2_1 = acosd(theta2_1);
    end
    
    if theta2_2 < 0
        theta2_2 = 180 - acosd(theta2_2);
    else
        theta2_2 = acosd(theta2_2);
    end
   
    theta2 = 90 - (theta2_1 + theta2_2) 
   end
   
   % at x = -ve z = +ve
   
   if x < 0 && z > 0
   theta2_1 = ((e^2 - m^2 - c^2)/(2 * m * c));
   theta2_2 = (((z-a)^2 - x^2 - m^2)/(2*m*x));
   
    if theta2_1 < 0 
        theta2_1 = 180 - acosd(theta2_1);
    else
        theta2_1 = acosd(theta2_1);
    end
    
    if theta2_2 < 0
        theta2_2 = 180 - acosd(theta2_2);
    else
        theta2_2 = acosd(theta2_2);
    end
   
    theta2 = 180 - (theta2_1 + theta2_2)
   end
    
  %  theta2_1 = 180 - acosd(((e^2 - m^2 - c^2)/(2 * m * c))); 
  % theta2_2 = 180 - acosd(((x^2 - (z-a)^2 - m^2)/(2 * (z-a) *m)));
  % theta2_2 = 180 - acosd(((z-a)^2 - m^2 - x^2)/(2*m*-x));
  %  theta2 = 180 - (theta2_1 + theta2_2) 
    
    
    
    
    
    
    
    
    
    
    
    
    

end