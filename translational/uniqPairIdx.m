function [uPair,count] = uniqPairIdx(PsiK,R,dx)
    count = 0;
    uPair = [];
    uPair(nchoosek(size(PsiK,2),2)+1).pk0 = NaN;
    uPair(nchoosek(size(PsiK,2),2)+1).pk1 = NaN;
    uPair(nchoosek(size(PsiK,2),2)+1).rabs = NaN;
    uPair(nchoosek(size(PsiK,2),2)+1).pk01 = NaN;
    for ii=1:(size(PsiK,2)-1)
        for jj=(ii+1):size(PsiK,2)
            count = count +1;
            uPair(count).pk0 = PsiK(:,ii);
            uPair(count).pk1 = PsiK(:,jj);
            uPair(count).rabs = sqrt(    sum(  (R(ii,:) - R(jj,:)).^2 ) );
            uPair(count).pk01 = uPair(count).pk0 .* conj(uPair(count).pk1);
        end
    end
    uPair = uPair(1:end-1);
end