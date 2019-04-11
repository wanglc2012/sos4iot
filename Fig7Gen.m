

% define random original topologies
sd=0.2:0.1:0.9; % stream density
dev=5:1:10; % dev number

% a running record of newsimu4Fig7.m
TRT =[0.0559    0.0814    0.1393    0.2422    0.3659    0.5550
    0.0873    0.1562    0.2700    0.4839    0.8072    1.2312
    0.1138    0.2425    0.4741    0.8300    1.4204    2.2564
    0.1737    0.3885    0.7528    1.3671    2.2376    3.6051
    0.2506    0.5358    1.1112    1.9913    3.0832    4.8718
    0.3553    0.7484    1.4842    2.7635    4.3235    6.8801
    0.4274    0.9715    1.8379    3.4324    5.7860    8.7933
    0.5610    1.2242    2.4237    4.3273    7.2056   11.3025]


ASP =[0.9100    0.8100    0.7800    0.7800    0.7500    0.6900
    0.9500    0.9100    0.8100    0.8600    0.9400    0.9100
    0.8900    0.9100    0.9500    0.9700    0.9800    0.9900
    0.9700    0.9900    0.9800    1.0000    1.0000    1.0000
    0.9800    1.0000    1.0000    1.0000    1.0000    1.0000
    1.0000    1.0000    1.0000    1.0000    1.0000    1.0000
    1.0000    1.0000    1.0000    1.0000    1.0000    1.0000
    1.0000    1.0000    1.0000    1.0000    1.0000    1.0000]

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
ylabel('Total Running Time (sec)');

legend('dev=5','dev=6','dev=7','dev=8','dev=9','dev=10');

grid


  