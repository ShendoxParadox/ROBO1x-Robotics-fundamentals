function [ q_int ] = quat_slerp( q0, q1, steps )

omega = acos(dot(q0,q1));

i = 0:(steps-1);
t = i / (steps-1);

q_int = zeros(steps, 4);

q_int = ((sin((1-t))*omega)/sin(omega))'*q0 + ((sin(t*omega))/sin(omega))'*q1;







