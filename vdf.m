function [H,find]=vdf(W)
% Input W: adjacent matrix of Graph G=(V,E)
% Output H: longest partial Hamiltonian path

% Backup W
W0=W;

% Initializing an empty list
H=[];
n=length(W);

% counting degrees
deg=[];
deg=sum(W);

% choosing node with min-degree
[x,i]=min(deg);

% searching partial Hamiltonian path H
while 1
    H=[H,i];
    if deg(i)>0
        % finding node adjacent to i with min-degree
        j=mindegadj(i,W,deg);

        % dropping node i
        for k=1:n
            if W(i,k)==1
                deg(k)=deg(k)-1;
                W(i,k)=0;
                W(k,i)=0;
            end
        end

        i=j;
        continue;
    else
        break;
    end
end

if length(H)==n
    find=1;
else
    % recovering the head node from H
    i=H(1); H(1)=[];
    W(i,1:n)=W0(i,1:n);
    W(1:n,i)=W0(1:n,i);
    % re-counting degrees
    deg=sum(W);
    % searching partial Hamiltonian path via the reverse direction
    while 1
        H=[i,H];
        if deg(i)>0
            % finding node adjacent to i with min-degree
            j=mindegadj(i,W,deg);
            % dropping node i
            for k=1:n
                if W(i,k)==1
                    deg(k)=deg(k)-1;
                    W(i,k)=0;
                    W(k,i)=0;
                end
            end
            i=j;
            continue;
        else
            break;
        end
    end
end

% piecing remained unvisited nodes
if length(H)==n
    find=1;
else
    find=0;
    V=1:n;
    V(H)=[];
    H=[H V];
end
return


function [j]=mindegadj(i,W,deg)
n=length(W);
j=0;
mindeg=n;
for k=1:n
    if W(i,k)==1
        if deg(k)<mindeg
            mindeg=deg(k);
            j=k;
        end
    end
end
if j==0 
    print('Error: Not find adjacent node with min-degree!');
end
return








