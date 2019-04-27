function [ pos, R ] = RPR_fk( theta1, d2, theta3 )
%RPR_FK Write your code here. The input to the function will be the joint
%    angles of the robot in radians, and the extension of the prismatic joint in inches.
%    The output includes: 
%    1) The position of the end effector and the position of 
%    each of the joints of the robot, as explained in the question.
%    2) The rotation matrix R_03, as explained in the question.

    %% YOUR CODE GOES HERE
    a = 10;
    b = 5;
    
    % A1 = compute_dh_matrix(0, -135*pi/180, a, theta1);
    
    % A2 = compute_dh_matrix(0, -90*pi/180, d2, -90*pi/180);
    
    % A3 = compute_dh_matrix(0, -90*pi/180, 0,  -180*pi/180 + theta3);
    
    % A33 = compute_dh_matrix(0, 0, b, -90*pi/180);
    
   % A1
   % A1*A2
   % A1*A2*A3*A33
    
   pos0 = [0 0 0];
   pos1 = [0 0 a];
   
  % adj = cos(pi/4) * d2;
  % x2 = (adj^2 + adj^2) - (2 * adj * adj * cos(theta1));
  % x = sqrt(x2);
  % asterisk = asin((adj * sin(theta1))/ x);
  % phi = pi/2 - asterisk ;
  % l = cos(phi) * x;
  % y2 = adj - l;
   
   
  % pos2 = [0, y2 , 10 - (sin(pi/4) * d2)];
  % pos3 = [0, (cos(pi/4) * d2) + 5, 10 - (sin(pi/4) * d2)];
   
  % pos = [pos0; pos1; pos2; pos3]
  
  
  pd2 = d2 * cos(pi/4); 
  y2 = pd2 * cos(theta1);
  x2 = pd2 * sin(theta1);
  
  z2 = (a - (sin(pi/4) * d2));
  pos2 = [x2, y2, z2];
  
  hyp3 = b * cos(theta3);
  
  new_hyp = hyp3 + pd2 ;
  
  x3 = new_hyp * sin(theta1);
  y3 = new_hyp * cos(theta1);
  z3 = z2 + b * sin(theta3);
  
  pos3 = [x3 y3 z3]; 
      
   pos = [pos0; pos1; pos2; pos3];
 
  
%   R = [1 0 0; 0 cos(theta3) -sin(theta3); 0 sin(theta3) cos(theta3)]...
 %  * [1 0 0; 0 cos(pi/4) -sin(pi/4); 0 sin(pi/4) cos(pi/4)]...
  % * [cos(theta1) -sin(theta1) 0; sin(theta1) cos(theta1) 0; 0 0 1];
  

 % R = [cos(theta1) -sin(theta1) 0; sin(theta1) cos(theta1) 0; 0 0 1]...
 %    * [1 0 0; 0 cos(pi/4) -sin(pi/4); 0 sin(pi/4) cos(pi/4)]...
 %   * [1 0 0; 0 cos(theta3) -sin(theta3); 0 sin(theta3) cos(theta3)];
  
  R03 = [1 0 0; 0 0 1; 0 -1 0];
   
  Rz = [cos(theta1) -sin(theta1) 0; sin(theta1) cos(theta1) 0; 0 0 1];
  
  Rx = [1 0 0; 0 cos(theta3) -sin(theta3); 0 sin(theta3) cos(theta3)];
      
  R = Rz * Rx * R03;
      
      
   
   
   
   
   
    
    
    
    
   % pos = zeros(4, 3);
   % R = eye(3);

end
