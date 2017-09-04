function mat=ke_mat(phi,area,length,modulus,ndof)
if ndof==1
    mat = [1   -1 ;-1    1];       % stiffness matrix for 1D
    cons=area.*modulus/length;          %constant
    Mat = cons.*mat;
else

c=cosd(phi)^2;
s=sind(phi)^2;
cs=cosd(phi)*sind(phi);
mat=[c cs -c -cs;
     cs s -cs -s;
     -c -cs c cs;
     -cs -s cs s]*area*modulus./length;
end

end
