function sol=weightcom(sol,data)



n=data.nvar;
xa=data.xantenna;
ya=data.yantenna;
xs=data.xserver;
ys=data.yserver;
x = sol.x;


W=0;

for k=1:n

xc = (xa(k)-xs(x(k))).^2;
yc = (ya(k)-ys(x(k))).^2;
W = W+ sqrt((xc+yc));

end


sol.w=sum(W);



end
% 