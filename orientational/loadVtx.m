vorts=zeros(1,1,2); a=zeros(2,1);
steps=2000:1000:999000;
<<<<<<< HEAD
vtxLost.count=0;
vtxLost.idx=[];
for ii=steps
    f=csvread(strcat(strcat('vort_ord_',int2str(ii)),'.csv'),1,0);
    for jj=1:length(f)
        if f(jj,5) == 0
            vtxLost.idx = union(vtxLost.idx,f(jj,4));
        end
    end
end

vtxLost.count = length(vtxLost.idx);

for ii=steps
    count((ii/1000)-1)=0;
    f=csvread(strcat(strcat('vort_ord_',int2str(ii)),'.csv'),1,0);
    for jj=1:length(f)
        if (f(jj,1) == 0 || f(jj,2) == 0) && ~ismember(f(jj,4),vtxLost.idx)
            %vorts(jj,ii/1000,1) = NaN;
            %vorts(jj,ii/1000,2) = NaN;
        else
            count(ii/1000 -1 ) = count(ii/1000 -1) +1;
            vorts(count(ii/1000 -1),ii/1000,1) = f(jj,1);
            vorts(count(ii/1000 -1),ii/1000,2) = f(jj,2);
        end
    end
end

=======
for ii=steps
    f=load(strcat(strcat('vort_ord_',int2str(ii)),'.csv'));
    for jj=1:length(f)
        if f(jj,1) == 0 || f(jj,2) == 0
            vorts(jj,ii/1000,1) = NaN;
            vorts(jj,ii/1000,2) = Nan;
        else
            vorts(jj,ii/1000,1) = f(jj,1);
            vorts(jj,ii/1000,2) = f(jj,2);
        end
    end
end
>>>>>>> b7fe4f7b69fef45ae86878a94bc5cae6170ed14f
