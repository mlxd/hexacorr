function [r,a0_k,theta,theta_k,K] = findK(X,Y,dx,r_rad)
    r = zeros(length(X),1);
    theta = zeros(length(X),1);
    for ii=1:length(X)
        [nn,idx] = findNN([X(ii) Y(ii)],X, Y, r_rad);
        r(ii) = sum( sqrt((nn(:,1) - X(ii)).^2 +(nn(:,2) - Y(ii)).^2 ) )/length(nn);
        for jj=1:length(nn)
            theta(ii) = theta(ii) + mod( getAngle( [X(ii),Y(ii)], [X(idx(jj)),Y(idx(jj))]),2*pi);
        end
        theta(ii) = theta(ii)./length(nn);
    end
    r = mean(r);%sum(r)./length(r);
    theta = median(mod(theta,2*pi));
    a0_k = 4*pi/(sqrt(3)*r*dx);
    theta_k = theta+pi/6;
    K=[];
    for ii = 1:6
        K(ii,:) = a0_k.*[sin(theta_k + (ii-1)*pi/3), -cos(theta_k + (ii-1)*pi/3) ];
    end
end