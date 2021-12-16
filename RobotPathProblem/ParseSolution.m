
function sol=ParseSolution(sol,data)

    x=sol.x;
    y=sol.y;
    
    xs=data.xs;
    ys=data.ys;
    xt=data.xt;
    yt=data.yt;
    xobs=data.xobs;
    yobs=data.yobs;
    robs=data.robs;
    
    XS=[xs x xt];
    YS=[ys y yt];
    k=numel(XS);
    TS=linspace(0,1,k);
    
    tt=linspace(0,1,100);
    xx=spline(TS,XS,tt);
    yy=spline(TS,YS,tt);
    
    dx=diff(xx);
    dy=diff(yy);
    
    L=sum(sqrt(dx.^2+dy.^2));
    
    nobs = numel(xobs); % Number of Obstacles
    Violation = 0;
    for k=1:nobs
        d=sqrt((xx-xobs(k)).^2+(yy-yobs(k)).^2);
        v=max(1-d/robs(k),0);
        Violation=Violation+mean(v);
    end
    
    sol.TS=TS;
    sol.XS=XS;
    sol.YS=YS;
    sol.tt=tt;
    sol.xx=xx;
    sol.yy=yy;
    sol.dx=dx;
    sol.dy=dy;
    sol.L=L;
    sol.Violation=Violation;
    sol.IsFeasible=(Violation==0);
    
    
end
