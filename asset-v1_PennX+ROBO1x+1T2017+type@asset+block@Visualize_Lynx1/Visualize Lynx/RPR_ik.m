function [ ik_sol ] = RPR_ik( x, y, z, R )
%RPR_IK Write your code here. The input to the function will be the position of
%    the end effector (in inches) in the world frame, and the 
%    Rotation matrix R_30 as described in the question.
%    The output must be the joint angles and extensions of the robot to achieve 
%    the end effector position and orientation.

    %% YOUR CODE GOES HERE
    
    ik_sol = ones(1, 3);

  %  a = 10;
  %  b = 5;
    
  %  theta1 = atan2(x,y);
    
  %  c = y - b;
    
  %  hyp = c/cos(theta1);
    
  %  d2 = hyp/cos(pi/4);
    
  %  l = y - c;
    
  %  theta3 = acos(l/b);
    
  %  ik_sol = [theta1, d2, theta3]
    
    
    b = 5;
    
    theta1 = acos(R(1,1));
    theta3 = asin(R(3,3));
    
    l = b * cos(theta3);
    
    c = y - l;
    
    hyp = c / cos(theta1);
    
    d2 = hyp / cos(pi/4);
    
    ik_sol = [theta1, d2, theta3];
    
    
    
    
   
  
  
  
  
end
