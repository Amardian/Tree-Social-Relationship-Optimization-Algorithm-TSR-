
function data=CreateModel()

    % Source
    xs=-2.701;
    ys=4.019;
    
    % Target (Destination)
    xt=6.1;
    yt=6;
    
    xobs=[3.53 .11 .21 .36 .14 .5 4.2 4.8 5.3 5.1 5.9 4.4 5.3 4 4 4.2 4.3 3.98 3.5 3.2 3.6 -0.2 -1.3 -1.4 -2 -2.5 -1.89 -0.45 -2.11 -3 -4 4 4.5 4.9 5.1 6 8 8.3 9.1 8.3 6.7 4.1 4.6 6.1 5.8 5.9 4.5 6.8 7 0 0 0 0 0 3 3 3 3 3 3 3 3 3 3 5 5.6 5.2 6.1 7 8 .5 7.3 6.9 7.3 6.2 5.8 6 6.4 5.1];
    yobs=[7.54 .0333 .32 .45 1 2 7.7 8.12 8.8 7.9 7.1 8.3 8.6 2 3 6 .5 5.5 1.4 6.3 7.2 4 4 4 4 4 4 4 4 4 4 2 2 2 2 2 2 2 2 2 2 6 6 6 6 6 6 6 6 6.3 6.2 8 7.6 7.6 0 1 3 6 8 5 4 2 3.6 4.9 4 4 4 4 4 4 4 4 4 4 6.5 6.5 6.5 6.5 6.5 ]; 
    robs=[.3 .1 .36 .1 .1 .89 .1 .1 .1 .1 .1 .1 .2 .1 .2 .3 .1 .2 .4 .2 .3 .1 .2 .1 .3 .1 .1 .2 .2 .3 .1 .2 .2 .2 .1 .1 .1 .2 .3 .1 .156 .2 .2 .1 .3 .2 .2 .2 .3 .3 .2 .3 .3 .1 .3 .6 .1 .2 .3 .6 .3 .2 .31 .3 .3 .2 .51 .41 .3 .2 .4 .3 .4 .2 .2 .3 .1 .2 .3];
    
    n=3;
    
    xmin=-10;
    xmax= 10;
    
    ymin=-10;
    ymax= 10;
    
    data.xs=xs;
    data.ys=ys;
    data.xt=xt;
    data.yt=yt;
    data.xobs=xobs;
    data.yobs=yobs;
    data.robs=robs;
    data.n=n;
    data.xmin=xmin;
    data.xmax=xmax;
    data.ymin=ymin;
    data.ymax=ymax;
    
end