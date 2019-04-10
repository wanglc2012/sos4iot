function [W]=randHamGraph(n,d)
% Generating Hamiltonian graph at random
% Input n: node scale
% Input d: edge density 
% Output W: adjacent matrix

% Generating a random permutation 
S=randperm(n);
W(1:n,1:n)=0;
for i=1:n-1
    % adding a Hamiltonian path H=S(1),S(2),...,S(n)
    W(S(i),S(i+1))=1;
    W(S(i+1),S(i))=1;
end

% reset density
%  Let d=((n-1)+dd*n(n-1)/2)/(n(n-1)/2). Then, we have dd=d-2/n.
%
if d>2/n
    dd=d-2/n;
else
    dd=d;
end

% adding remained edges randomly according to density dd
for i=1:n-1
    for j=i+1:n
        if W(i,j)==0
            r=rand;
            if r<dd
                    W(i,j)=1;
                    W(j,i)=1;
            end
        end
    end
end                 
return



