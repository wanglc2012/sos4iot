function newsimu4Fig8
% New simulation for generating Figure 8

% set edge density
d=1/3;
% set simulation times
M=1000;

% initialize result matrix: 
TRT=[];  % totoal running time
ASP=[]; % average success probability

for i=1:9
    n=i*10;
    succtimes=0;
    tt=toc; % timing beginning 
    for k=1:M
        [W]=randHamGraph(n,d);
        [H,f]=vdf(W);
        succtimes=succtimes+f;
    end
    TRT(i)=toc-tt; % timing end of all M-times simulations
    ASP(i)=succtimes/M;
end

% Display simulation results
TRT
ASP

n=10:10:90;
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

%title('Simulations Towards Hamiltonian Edge-Dual Topologies With Edge-Density 1/3');
xlabel('Node Number');
ylabel(hAx(1),'Total Running Time Over 1000 Random Instances (sec)'); % left y-axis
ylabel(hAx(2),'Success Probability of Achieving Optimal SOS Solutions'); % right y-axis

legend('Total Running Time','Success Probability');
grid;

return

    