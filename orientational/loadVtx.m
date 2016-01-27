vorts=zeros(1,1,2); a=zeros(2,1);
steps=2000:1000:999000;
for ii=steps
f=load(strcat(strcat('vort_ord_',int2str(ii)),'.csv'));
for jj=1:length(f)
    %if f(jj,1) == 0 || f(jj,2) == 0
    %    vorts(jj,ii/1000,1) = NaN;
    %    vorts(jj,ii/1000,2) = Nan;
    %else
        vorts(jj,ii/1000,1) = f(jj,1);
        vorts(jj,ii/1000,2) = f(jj,2);
    %end
end
end