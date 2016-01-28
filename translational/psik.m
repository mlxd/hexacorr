function [ result ] = psik( K, r )
%PSIK Determines translational order parameter\Psi_K_l(r_i) = e^{i\mathbf{K}_l\mathbf{r}_i}
%   Used to calculate orientational corrletaion function
    if size(r,2) == 1 && size(K,2) == 1
        result = exp(1i*dot(K,r));
    elseif size(r,2) == 1 && size(K,2) > 1
        result = sum(bsxfun(@times,r,K),2);
    elseif size(r,2) > 1 && size(K,2) > 1
        result = zeros(size(K,1),size(r,1));
        for jj=1:size(K,1)
            result(jj,:) = sum(bsxfun(@times,r,K(jj,:)),2);
        end
    else
        result = sum(bsxfun(@times,r,K),2);
    end
end

