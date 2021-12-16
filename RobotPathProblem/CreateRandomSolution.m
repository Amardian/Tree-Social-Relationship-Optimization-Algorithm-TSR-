
function sol1=CreateRandomSolution(data)

    n=data.n;
    
    xmin=data.xmin;
    xmax=data.xmax;
    
    ymin=data.ymin;
    ymax=data.ymax;

    sol1.x=unifrnd(xmin,xmax,1,n);
    sol1.y=unifrnd(ymin,ymax,1,n);
    
end