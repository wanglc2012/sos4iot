function [TRT,ASP]=newsimu4Fig7
% New simulation for generating Figure 7

% set simulation times
M=100;

% define random original topologies
sd=0.2:0.1:0.9; % stream density
dev=5:1:10; % dev number

% initialize result matrix: 
TRT=[];  % totoal running time
ASP=[]; % average success probability

for j=1:length(sd)
    for i=1:length(dev)
        succtimes=0;
        tic;
        tt=toc; % timing beginning 
        for k=1:M
            [G]=SOSinsgen(sd(j),dev(i))
            [W]=EdgeDual(G);
            while isempty(W)
                disp('Edge-dual graph is empty! Try another random instance ...');
                [G]=SOSinsgen(sd(j),dev(i))
                [W]=EdgeDual(G);
            end
            [H,f]=vdf(W);
            succtimes=succtimes+f;
            [f,H]
        end
        TRT(j,i)=toc-tt; % timing end of all M-times simulations
        ASP(j,i)=succtimes/M;
    end
end

% Display simulation results
TRT
ASP

disp('sum(sum(ASP))/48=');
sum(sum(ASP))/48

minA=min(min(ASP));
%maxA=max(max(ASP));

figure % new figure
set(gcf,'color','w') ;
plot(sd,ASP(:,1),'-bs',sd,ASP(:,2),'-yo',sd,ASP(:,3),'-rd',sd,ASP(:,4),'-g+',sd,ASP(:,5),'-kx',sd,ASP(:,6),'-c*');
xlim([0.2, 0.9]);
ylim([minA, 1.05]);
xlabel('Stream Density');
ylabel('Average Success Probability');

legend('dev=5','dev=6','dev=7','dev=8','dev=9','dev=10');

grid

minT=min(min(TRT));
maxT=max(max(TRT));

figure % new figure
set(gcf,'color','w') ;
plot(sd,TRT(:,1),'-bs',sd,TRT(:,2),'-yo',sd,TRT(:,3),'-rd',sd,TRT(:,4),'-g+',sd,TRT(:,5),'-kx',sd,TRT(:,6),'-c*');
xlim([0.2, 0.9]);
ylim([minT, maxT]);
xlabel('Stream Density');
ylabel('Total Running Time Over 100 Random Instances (sec)');

legend('dev=5','dev=6','dev=7','dev=8','dev=9','dev=10');

grid

return

    