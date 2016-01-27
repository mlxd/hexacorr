loadVtx;
vorts=[];

PsiK = zeros(size(vorts)-nnz(isnan(vorts(:,1,1))),1);
PsiK=[];
for ii=1:1
    for jj=1:6
        %PsiK(ii,jj,:) = psik(K(jj,:),squeeze(vorts(1:300,ii+1,:)))';
        PsiK(ii,jj,:) = psik(K(jj,:),vorts)';
    end
end

count = 0;
kIdx = 1;
time = 1;
uPair = [];
gk=[]
gkb=zeros(6,999);
bin=[];
for kIdx = 1:6
count = 0;
for ii=1:(size(PsiK,3)-1)
    for jj=(ii+1):size(PsiK,3)
        count = count +1;
        uPair(count).pk0 = PsiK(time,kIdx,ii);
        uPair(count).pk1 = PsiK(time,kIdx,jj);
        uPair(count).rabs = sqrt(    sum(  (vorts(ii,time,:) - vorts(jj,time,:)).^2 ) );
        uPair(count).pk01 = PsiK(time,kIdx,ii) * conj(PsiK(time,kIdx,jj));
    end
end

[~,order] = sort([uPair(:).rabs],'ascend');
uPairS(kIdx,:) = uPair(order);

gk(kIdx,:,:) = cell2mat(squeeze(struct2cell(uPairS(kIdx,:))));

[gkb(kIdx,:),~]=binData(squeeze(gk(kIdx,:,:)),55,1000)

end