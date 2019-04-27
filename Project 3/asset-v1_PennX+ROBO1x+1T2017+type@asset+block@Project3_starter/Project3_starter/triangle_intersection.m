function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise

%%% All of your code should be between the two lines of stars.
% *******************************************************************
%% we have two matrices 3*2 P1, and P2 as an inputs to the function contains the points
% of the two triangles, the first row contains x-y coordinates of the first
% point in the triangle and so on ...


%% extracting triangles points coordinates from the matrix
% first triangle

x(1) = P1(1,1);  y(1) = P1(1,2);
x(2) = P1(2,1);  y(2) = P1(2,2);
x(3) = P1(3,1);  y(3) = P1(3,2);

% second triangle

x(4) = P2(1,1);  y(4) = P2(1,2);
x(5) = P2(2,1);  y(5) = P2(2,2);
x(6) = P2(3,1);  y(6) = P2(3,2);

%% constructing equation of straight line  y = mx + c
% Getting the slope (m)
% first triangle slope line

if x(2) - x(1) == 0
    x(2) = x(1) + 0.0000000001;
end
if x(3) - x(2) == 0
    x(3) = x(3) + 0.0000000001;
end
if x(3) - x(1) == 0
    x(3) = x(3) + 0.0000000001;
end
if x(5) - x(4) == 0
    x(5) = x(5) + 0.0000000001;
end
if x(6) - x(5) == 0
    x(6) = x(6) + 0.0000000001;
end
if x(6) - x(4) == 0
    x(6) = x(6) + 0.0000000001;
end

 
m(1) = (y(2) - y(1)) / (x(2) - x(1));
m(2) = (y(3) - y(2)) / (x(3) - x(2));
m(3) = (y(3) - y(1)) / (x(3) - x(1));

% second triangle slope line

m(4) = (y(5) - y(4)) / (x(5) - x(4));
m(5) = (y(6) - y(5)) / (x(6) - x(5));
m(6) = (y(6) - y(4)) / (x(6) - x(4));

% substituting in the equation with either of the two points to get the
% interception with y

c(1) = y(1) - (m(1)*x(1));
c(2) = y(2) - (m(2)*x(2));
c(3) = y(3) - (m(3)*x(3));

c(4) = y(4) - (m(4)*x(4));
c(5) = y(5) - (m(5)*x(5));
c(6) = y(6) - (m(6)*x(6));

% setting a flag

flag = 0;
f = zeros(1,4);
%% solving the equations with each others to get the points of intersection
% solving equation 1 with 4, 5 and 6

for i = 1:2
    for j = 4:5
        f = zeros(1,4);
        
        x_int = (-c(i) + c(j)) / (m(i) - m(j));
        y_int = (m(i) * x_int) + c(i);
        
        if ((x_int <= max(x(i), x(i+1))) && (x_int >= min(x(i), x(i+1)))) == 1
            f(1) = 1;
        end
        if ((x_int <= max(x(j), x(j+1))) && (x_int >= min(x(j), x(j+1)))) == 1
            f(2) = 1;
        end
        if ((y_int <= max(y(i), y(i+1))) && (y_int >= min(y(i), y(i+1)))) == 1
            f(3) = 1;
        end
        if ((y_int <= max(y(j), y(j+1))) && (y_int >= min(y(j), y(j+1)))) == 1
            f(4) = 1;
        end
        
        if f == 1
            flag = 1;
            break;
        end  
    end
end

f = zeros(1,4);

for j = 4:5
    
    x_int = (-c(3) + c(j)) / (m(3) - m(j));
    y_int = (m(3) * x_int) + c(3);
    
    f = zeros(1,4);
    
        if ((x_int <= max(x(3), x(1))) && (x_int >= min(x(3), x(1)))) == 1
            f(1) = 1;
        end
        if ((x_int <= max(x(j), x(j+1))) && (x_int >= min(x(j), x(j+1)))) == 1
            f(2) = 1;
        end
        if ((y_int <= max(y(3), y(1))) && (y_int >= min(y(3), y(1)))) == 1
            f(3) = 1;
        end
        if ((y_int <= max(y(j), y(j+1))) && (y_int >= min(y(j), y(j+1)))) == 1
            f(4) = 1;
        end
        
        if f == 1
            flag = 1;
            break;
        end  
end

f = zeros(1,4);

for i = 1:2
    
    f = zeros(1,4);
        
        x_int = (-c(i) + c(6)) / (m(i) - m(6));
        y_int = (m(i) * x_int) + c(i);
        
        if ((x_int <= max(x(i), x(i+1))) && (x_int >= min(x(i), x(i+1)))) == 1
            f(1) = 1;
        end
        if ((x_int <= max(x(4), x(6))) && (x_int >= min(x(4), x(6)))) == 1
            f(2) = 1;
        end
        if ((y_int <= max(y(i), y(i+1))) && (y_int >= min(y(i), y(i+1)))) == 1
            f(3) = 1;
        end
        if ((y_int <= max(y(4), y(6))) && (y_int >= min(y(4), y(6)))) == 1
            f(4) = 1;
        end
        
        if f == 1
            flag = 1;
            break;
        end  
    
end

f = zeros(1,4);

       
        x_int = (-c(3) + c(6)) / (m(3) - m(6));
        y_int = (m(3) * x_int) + c(3);
        
        if ((x_int <= max(x(3), x(1))) && (x_int >= min(x(3), x(1)))) == 1
            f(1) = 1;
        end
        if ((x_int <= max(x(4), x(6))) && (x_int >= min(x(4), x(6)))) == 1
            f(2) = 1;
        end
        if ((y_int <= max(y(3), y(1))) && (y_int >= min(y(3), y(1)))) == 1
            f(3) = 1;
        end
        if ((y_int <= max(y(4), y(6))) && (y_int >= min(y(4), y(6)))) == 1
            f(4) = 1;
        end
        
        if f == 1
            flag = 1;
            
        end  
    

if triangle_inside(P1,P2)

        flag = true;

    end    
        %% code for triangle inside a triangle case
  
        
        
        function [ inside ] = triangle_inside( P1, P2 )

%UNTITLED3 Summary of this function goes here

%   Detailed explanation goes here



    inside = false;

    

    B =[P2(1,1) P2(1,2) 1;

        P2(2,1) P2(2,2) 1;

        P2(3,1) P2(3,2) 1];

    

    B1 =[P1(1,1) P1(1,2) 1;

        P2(2,1) P2(2,2) 1;

        P2(3,1) P2(3,2) 1];



    B2 =[P2(1,1) P2(1,2) 1;

        P1(1,1) P1(1,2) 1;

        P2(3,1) P2(3,2) 1];



    B3 =[P2(1,1) P2(1,2) 1;

        P2(2,1) P2(2,2) 1;

        P1(1,1) P1(1,2) 1];

    

    b = abs(det(B1)/2) + abs(det(B2)/2) + abs(det(B3)/2);

    

    if abs(det(B)/2) == b

        inside = true;

    end



end




    

% *******************************************************************
end