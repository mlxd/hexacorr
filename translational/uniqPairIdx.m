function [S] = uniqPairIdx(R,K,dx)
    count = 0;
    for ii=1:(size(R,1)-1)
        for jj=ii+1:size(R,1)
            count = count +1;
            S(count).pos0 = R(ii,:);

    end
end