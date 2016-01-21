parfor ii=2:199
    ii
   [g6t1(ii-1,:,:),~] = binData(g6_struct(vorts(2:318,ii,1),vorts(2:318,ii,2)),500);
end
%%
bins = linspace(0,max(g6C(1,:)),400);
g6B = zeros(length(bins)-1,1);
for kk=1:(length(bins)-1)
    idx = find( g6C(1,:) >= bins(kk) & g6C(1,:) < bins(kk+1) );
    if length(idx) >0
        g6B(kk) = sum(g6C(2,idx))./length(idx);
    end
end