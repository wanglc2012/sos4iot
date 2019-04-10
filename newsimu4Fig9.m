function [TRT,ASP]=newsimu4Fig9(density)
% New simulation for generating Figure 9

% set edge density
d=density;
% set simulation times
M=100;

% initialize result matrix: 
TRT=[];  % totoal running time
ASP=[]; % average success probability

n=100:100:1000;
for i=1:length(n)
    succtimes=0;
    tic;
    tt=toc; % timing beginning 
    for k=1:M
        [W]=randHamGraph(n(i),d);
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
    TRT(i)=toc-tt; % timing end of all M-times simulations
    ASP(i)=succtimes/M;
end

% Display simulation results
TRT
ASP

figure % new figure
set(gcf,'color','w') ;
[hAx,hLine1,hLine2]=plotyy(n,TRT,n,ASP);
ylim(hAx(1),[0,max(TRT)*1.382]);
y1tick=0:max(TRT)*1.382*0.1:max(TRT)*1.382;
set(hAx(1),'ytick',y1tick) ;
set(gca,'box','off');
ylim(hAx(2),[0,1.1]);
y2tick=[0:0.1:1.1];
set(hAx(2),'ytick',y2tick) ;
set(hAx(1),'color','w') ;

set(hLine1,'LineWidth',2,'color','b','marker','o');
set(hLine2,'LineWidth',2,'color','g','marker','d');

xlabel('Node Number');
ylabel(hAx(1),'Total Running Time Over 100 Random Instances (sec)'); % left y-axis
ylabel(hAx(2),'Success Probability of Achieving Optimal SOS Solutions'); % right y-axis

legend('Total Running Time','Success Probability');
grid;

return

    