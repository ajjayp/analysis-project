function mat=bigmatrix(neq,mat_initial,start_node,end_node) %neq=no. of equation
a=zeros(neq,neq);
count=1;
for i=1:neq
    for j=1:neq
             if (j==start_node*2-1 || j==start_node*2 || j==end_node*2-1 || j==end_node*2) && (i==start_node*2-1 || i==start_node*2 || i==end_node*2-1 || i==end_node*2)
            a(i,j)=mat_initial(count);
            count=count+1;
            
        else 
            continue;
             end
    end
    
    end
    mat=a;
end
