syms a b c d theta1 theta2 theta3 theta4 theta5

A1 = compute_dh_matrix(0, -pi/2, a, theta1);
A2 = compute_dh_matrix(b, 0, 0, (-pi/2) + theta2);
A3 = compute_dh_matrix(c, 0, 0, (pi/2) + theta3);
A4 = compute_dh_matrix(0, (-pi/2), 0, (-pi/2) + theta4);
A5 = compute_dh_matrix(0, 0, d, theta5);

A05 = A1 * A2 * A3 * A4 * A5 