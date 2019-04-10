function [TRT,ASP]=newsimu4Fig10
% New simulation for generating Figure 10

% set node scale series: from 100 to 1000
n=100:100:1000;
% set simulation times
M=100;

% initialize result matrix: 
TRT=[];  % totoal running time
ASP=[]; % average success probability

d=1:1:10;
for j=1:length(n)
    
    % set edge density series: from 2/n to 2/sqrt(n)
    dstep=(2/sqrt(n(j))-2/n(j))/10;

    for i=1:length(d)
        succtimes=0;
        tic;
        tt=toc; % timing beginning 
        for k=1:M
            [W]=randHamGraph(n(j),d(i)*dstep);
            [H,f]=vdf(W);
            succtimes=succtimes+f;
% output a Hamiltonian path with prob. 2/M 
%         if f==1
%             r=rand;
%             if r<2/M
%                 WH=[];
%                 WH=[W; H]
%             end    
%         end
        end
        j
        i
        TRT(j,i)=toc-tt % timing end of all M-times simulations
        ASP(j,i)=succtimes/M
    end
end

% Display simulation results
TRT
ASP

figure % new figure
set(gcf,'color','w') ;
mesh(d,n,TRT);
xlabel('Edge Density Factor');
ylabel('Node Number');
zlabel('Total Running Time');

figure % new figure
set(gcf,'color','w') ;
mesh(d,n,ASP);
xlabel('Edge Density Factor');
ylabel('Node Number');
zlabel('Average Success Probability');

return

    