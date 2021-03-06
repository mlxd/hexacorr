loadVtx;
dx=6.821230e-07;
g6t1 = [];
bins=[];
radius = 43;
vorts0 = vorts(1:(size(vorts,1) - nnz(isnan(vorts(:,2,1)))), 2:(size(vorts,2)-1), :);

for ii=1:size(vorts0,2)
   vorts1(:,ii,:) = vorts0(1:300,ii,:); 
end

parfor ii=1:(size(vorts1,2)-1)
    ii
   [g6t1(ii,:),bins(ii,:)] = binData(g6_struct(vorts1(:,ii,1),vorts1(:,ii,2),radius),500,500);
end
%%
% bins = linspace(0,max(g6C(1,:)),400);
% g6B = zeros(length(bins)-1,1);
% for kk=1:(length(bins)-1)
%     idx = find( g6C(1,:) >= bins(kk) & g6C(1,:) < bins(kk+1) );
%     if length(idx) >0
%         g6B(kk) = sum(g6C(2,idx))./length(idx);
%     end
% end
figure;
set(gca,'FontName','Latin Modern Roman','FontSize',22);
set(gca,'TickLabelInterpreter', 'latex');
%imagesc(bins(1,:),linspace(0,2,198),g6t1); 
contourf(linspace(0,size(g6t1,2)*dx,size(g6t1,2)),linspace(0.002,(size(vorts1,2)-1)./100,size(g6t1,1)),(g6t1),80,'LineWidth',0);
shading interp; set(gca,'YDir','normal');axis square;
caxis([0 1]); colorbar; %colormap ('default')
set(gca,'FontName','Latin Modern Roman','FontSize',22);
set(gca,'TickLabelInterpreter', 'latex');
set(gca,'DefaultTextInterpreter','Latex');
title('$g_6(r)$','Interpreter','LaTeX', 'FontSize',26);
xlabel('$r$ [d$x$]');ylabel('$t$ [s]');

cc = [0.2081    0.1663    0.5292
    0.2081    0.1904    0.5785
    0.2081    0.2145    0.6278
    0.2081    0.2386    0.6771
    0.1959    0.2645    0.7279
    0.1707    0.2919    0.7792
    0.1253    0.3242    0.8303
    0.0591    0.3598    0.8683
    0.0117    0.3875    0.8820
    0.0060    0.4086    0.8828
    0.0164    0.4245    0.8755
    0.0269    0.4404    0.8681
    0.0374    0.4564    0.8607
    0.0479    0.4723    0.8533
    0.0584    0.4882    0.8459
    0.0689    0.5041    0.8386
    0.0793    0.5200    0.8312
    0.0749    0.5375    0.8263
    0.0614    0.5572    0.8241
    0.0479    0.5769    0.8220
    0.0343    0.5966    0.8199
    0.0265    0.6137    0.8135
    0.0265    0.6263    0.8003
    0.0266    0.6389    0.7871
    0.0266    0.6516    0.7739
    0.0267    0.6642    0.7607
    0.0384    0.6743    0.7436
    0.0744    0.6765    0.7252
    0.1103    0.6787    0.7069
    0.1463    0.6809    0.6885
    0.1823    0.6831    0.6702
    0.2183    0.6853    0.6518
    0.2543    0.6875    0.6335
    0.2902    0.6897    0.6152
    0.3262    0.6918    0.5968
    0.3622    0.6940    0.5785
    0.3982    0.6962    0.5601
    0.4342    0.6984    0.5418
    0.4702    0.7006    0.5234
    0.5061    0.7028    0.5051
    0.5421    0.7050    0.4868
    0.5781    0.7072    0.4684
    0.6141    0.7094    0.4501
    0.6501    0.7116    0.4317
    0.6860    0.7138    0.4134
    0.7220    0.7160    0.3950
    0.7580    0.7182    0.3767
    0.7940    0.7204    0.3584
    0.8300    0.7226    0.3400
    0.8660    0.7248    0.3217
    0.9019    0.7270    0.3033
    0.9379    0.7292    0.2850
    0.9739    0.7314    0.2666
    0.9938    0.7455    0.2403
    0.9990    0.7653    0.2164
    0.9994    0.8435    0.1443
    0.9997    0.9218    0.0721
    1.0000    1.0000         0
    0.2353    0.2353    0.2353
    0.3882    0.3882    0.3882
    0.5412    0.5412    0.5412
    0.6941    0.6941    0.6941
    0.8471    0.8471    0.8471
    1.0000    1.0000    1.0000];

colormap(cc);
[~,de,~]=fileparts(pwd);
title(strrep(de,'_','\_'),'FontSize',22);
print('-dpng','-r300',strcat('g6_',strcat(de,'_2s.png')));