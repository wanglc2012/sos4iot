function [TRT,ASP]=newsimu4Fig10
% New simulation for generating Figure 10

% set node scale and edge density level series: from 100 to 1000
n=100:100:1000;
d=1:1:10;
% counting edge density steps: from 2/n to 2/sqrt(2), divided into 10 gaps
dstep=(2./sqrt(n)-2./n)/10;

% set simulation times
M=100;

% initialize result matrix: 
TRT=[];  % totoal running time
ASP=[]; % average success probability

for j=1:length(n)   
    for i=1:length(d)
        succtimes=0;
        tic;
        tt=toc; % timing beginning 
        for k=1:M
            [W]=randHamGraph(n(j),d(i)*dstep(j));
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
        TRT(j,i)=toc-tt; % timing end of all M-times simulations
        ASP(j,i)=succtimes/M
    end
end

% Display simulation results
TRT
ASP

disp('sum(sum(ASP))/100=');
sum(sum(ASP))/100

figure % new figure
set(gcf,'color','w') ;
mesh(d,n,TRT);
xlabel('Edge Density Level');
ylabel('Node Number');
zlabel('Total Running Time (sec)');

figure % new figure
set(gcf,'color','w') ;
mesh(d,n,ASP);
xlabel('Edge Density Level');
ylabel('Node Number');
zlabel('Average Success Probability');

return

    