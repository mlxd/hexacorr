function [S] = uniqPairIdx(R)
    count = 0;
    for ii=1:(size(R,1)-1)
        for jj=ii+1:size(R,1)
            count = count +1;
            S(count).pos0 = R(ii,:);
            S(count).pos1 = R(jj,:);
            S(count).rabs = sqrt( sum( (R(ii,:) - R(jj,:) ).^2 ) );
        end
    end
end