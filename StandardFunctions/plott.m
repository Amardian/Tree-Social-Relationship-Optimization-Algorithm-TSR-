x = (-100:.1:100);
y = (-100:.1:100);
[x,y] = meshgrid(x,x);
% z = sumsquaresfcnz(x,y);
 [m, n] = size(x,y);
 x2 = x .^2;
 I = repmat(1:n, m, 1);
 z = sum( I .* x2, 2);

figure
mesh(x,y,z)
grid on
hold on
xlabel('x');
ylabel('y');
zlabel('f(x,y');
colormap default
contour (x,y,z);