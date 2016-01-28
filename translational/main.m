loadVtx;
dx=6.821230e-07;
nnRadius = 35;
VTX0 = csvread('vort_arr_0',1,0);

    %Find K for perfect lattice at angle only. Do not use t=0 data
    [r,a0_k,thetar,thetak,K] = findK( VTX0(:,2), VTX0(:,4), dx, nnRadius);
gkb = []%zeros(size(vorts,2),799);
bins = zeros(800,1);
parfor t=2:size(vorts,2)
    t
    %Get positions
    R = squeeze(vorts(1:size(vorts,1)-sum(vorts(:,t,1)==0),t,:));
    
    %Calculate PsiKs
    %K = K.*(0.95 + 0.05*rand(size(K,1),size(K,2)));
    PsiK = exp(1i.*psik(K,R));

    %Calculate unique pairs
    psiPsi = uniqPairIdx(PsiK,R,dx);

    %Calculate GK
    [GK,r] = sortCorr(psiPsi);
    [gkb(:,t),bins]=binData(GK,r,500,800);
end