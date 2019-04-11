function [W]=EdgeDual(G)
% Input G: a undirected graph G
% Ouput W: the adjacent matrix of the edge-dual graph of G

V=[]; W=[];

M=length(G);

for i=1:M-1
    for j=i+1:M
        if G(i,j)==1
            V=[V; i j];
        end
    end
end

[N,x]=size(V);
if N<2
    return
end
    
for i=1:N-1
    for j=i+1:N
        a=V(i,1);b=V(i,2);
        c=V(j,1);d=V(j,2);
        if isempty(intersect([a,b],[c,d]))==0
            W(i,j)=1;
            W(j,i)=1;
        end
    end
end    
            
return


% % compact edge representations
% function [z]=Lam(i,j,M)
% z=min([i,j])*M+max([i,j]);
% return 
% function [i,j]=iLam(z,M)
% i=floor(z/M);
% j=z-i*M;
% return


