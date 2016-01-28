function [gr,x] = radialCorr(X,Y,numbins,rMax)
% Calculates g(r), the radial distribution function for a series of 2d points
% X,Y are coordinate vectors
% numbins is the number of bins for r
% rMax is the maximum r-value, to ensure constant binning range
% gr is the function g(r)
% XX is the resulting bin range
    R = [X, Y];
    count = 0;
    S = zeros(nchoosek(length(X),2),1);
    for ii=1:(length(X)-1)
        for jj=(ii+1):length(X)
            count = count +1;
            S(count) = sqrt( sum( (R(ii,:) - R(jj,:) ).^2 ) );
        end
    end
    Rbin = linspace(0,rMax,numbins);
    [N,x]=hist(S,Rbin);
    dr = x(2)-x(1);
    gr = N./( pi*(2*dr.*Rbin + dr.^2) );
    %figure; plot(x,gr);
end