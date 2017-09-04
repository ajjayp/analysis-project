function [P]= minimize(ndof,neq,nnp,nel,start_node,end_node,f,d,AE,phi,length,modulus)
x=0;
area=[1 1 1]';
for k=1:nel
element_mat=ke_mat(phi(k),area(k),length(k),modulus(k),ndof);
bigmatrix(neq,element_mat,start_node(k),end_node(k));
x=x+ans ;
end
[force,Displacement]=trusssolver(d,x,f);
for k=1:nel
[forces1(k),deformation1(k)]=stress(start_node(k),end_node(k),Displacement,phi(k),length(k),area(k),modulus(k),AE);
end
v1=area'*length;
x=0;
area=[1.5 3 0.5]' ;
for k=1:nel
element_mat=ke_mat(phi(k),area(k),length(k),modulus(k),ndof);
bigmatrix(neq,element_mat,start_node(k),end_node(k));
x=x+ans ;
end
[force,Displacement]=trusssolver(d,x,f);
for k=1:nel
[forces2(k),deformation2(k)]=stress(start_node(k),end_node(k),Displacement,phi(k),length(k),area(k),modulus(k),AE);
end
v2=area'*length;

x=0;
area=[2 1 6]' ;
for k=1:nel
element_mat=ke_mat(phi(k),area(k),length(k),modulus(k),ndof);
bigmatrix(neq,element_mat,start_node(k),end_node(k));
x=x+ans ;
end
[force,Displacement]=trusssolver(d,x,f);
for k=1:nel
[forces3(k),deformation3(k)]=stress(start_node(k),end_node(k),Displacement,phi(k),length(k),area(k),modulus(k),AE);
end
v3=area'*length;

x=0;
area=[10 7.5 9]' ;
for k=1:nel
element_mat=ke_mat(phi(k),area(k),length(k),modulus(k),ndof);
bigmatrix(neq,element_mat,start_node(k),end_node(k));
x=x+ans ;
end
[force,Displacement]=trusssolver(d,x,f);
for k=1:nel
[forces4(k),deformation4(k)]=stress(start_node(k),end_node(k),Displacement,phi(k),length(k),area(k),modulus(k),AE);
end
v4=area'*length;

x=0;
area=[10 5 11]' ;
for k=1:nel
element_mat=ke_mat(phi(k),area(k),length(k),modulus(k),ndof);
bigmatrix(neq,element_mat,start_node(k),end_node(k));
x=x+ans ;
end
[force,Displacement]=trusssolver(d,x,f);
for k=1:nel
[forces5(k),deformation5(k)]=stress(start_node(k),end_node(k),Displacement,phi(k),length(k),area(k),modulus(k),AE);
end
v5=area'*length;

x=0;
area=[4 5 2]' ;
for k=1:nel
element_mat=ke_mat(phi(k),area(k),length(k),modulus(k),ndof);
bigmatrix(neq,element_mat,start_node(k),end_node(k));
x=x+ans ;
end
[force,Displacement]=trusssolver(d,x,f);
for k=1:nel
[forces6(k),deformation6(k)]=stress(start_node(k),end_node(k),Displacement,phi(k),length(k),area(k),modulus(k),AE);
end
v6=area'*length;
Force=[max(abs(forces1)) max(abs(forces2)) max(abs(forces3)) max(abs(forces4)) max(abs(forces5)) max(abs(forces6))];
v=[v1 v2 v3 v4 v5 v6];
P=[v ; Force]' ;

