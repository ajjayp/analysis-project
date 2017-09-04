function [f,d]=solver(d,x,f)
index1=find(d==1);
index2=find(d~=0);
local_f=f(index1);
local_x=x(index2,index2);
d1=d(index2);
index1;
index2;
if ((size(index1)==size(index2)) & (index1==index2))
    local_x=pinv(local_x);
    local_d=local_x*local_f;
else
    index3=find(d1~=1);
    local_x(index3,:)=[];
    local_f=local_f-sum(local_x(:,index3).*d1(index3),2);
    local_x(:,index3)=[];
    local_x=pinv(local_x);
    local_d=local_x*local_f;
end
d(index1)=local_d;
f=x*d;
force=f;
Displacement=d;
end