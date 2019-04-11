function [G]=SOSinsgen(sd,dev)

% adding edges randomly according to density sd
G=[];
G(1:dev,1:dev)=0;
for i=1:dev-1
    for j=i+1:dev
        r=rand;
        if r<sd
            G(i,j)=1;
            G(j,i)=1;
        end
    end
end

return

