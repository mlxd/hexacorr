function [S] = uniqPairIdx_precalc(R,psi6p)
    %Generates unique pairs from the pre-computed psi6 orientational order
    %parameter, for use in calculating correlation functions
    count = 0;
    for ii=1:(size(R,1)-1)
        for jj=ii+1:size(R,1)
            count = count +1;
            S(count).cor0 = psi6p(ii);
            S(count).cor1 = psi6p(jj);
            S(count).rabs = sqrt( sum( (R(ii,:) - R(jj,:) ).^2 ) );
        end
    end
end