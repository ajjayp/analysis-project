function [stress,strain] =stress(start_node,end_node,Displacement,phi,length,area,modulus,AE)
T=[cosd(phi) sind(phi) 0 0;0 0 cosd(phi) sind(phi)];
U=0;
U(1,1)=Displacement(2*start_node-1);
U(2,1)=Displacement(2*start_node);
U(3,1)=Displacement(2*end_node-1);
U(4,1)=Displacement(2*end_node);
local_U=T*U;
strain=(local_U(2,1)-local_U(1,1))/length;
stress=strain*(area*modulus*AE);
end
