
function data=InsertData()

x=dlmread('world.txt');
x(:,1)=[];
Pos(1,:)=x(:,1);
Pos(2,:)=x(:,2);




minpos=min(Pos,[],2);
maxpos=max(Pos,[],2);

minpos=minpos*0.8;
maxpos=maxpos*1.2;

N=size(Pos,2);


Dis=zeros(N,N);

for i=1:N
    for j=i+1:N
        Dis(i,j)=norm(Pos(:,i)-Pos(:,j),2);
        Dis(j,i)=Dis(i,j);
    end
end




data.n=N;
data.Pos=Pos;
data.dis=Dis;
data.minpos=minpos;
data.maxpos=maxpos;
data.nvar=N;





end
 





