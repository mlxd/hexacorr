function [ result ] = psik( K, r )
%PSIK Determines translational order parameter\Psi_K_l(r_i) = e^{i\mathbf{K}_l\mathbf{r}_i}
%   Used to calculate orientational corrletaion function
    if size(r,2) == 1
        result = exp(1i*dot(K,r));
    else
        for ii=1:length(r)
            result(ii) = exp(1i*dot(K,r(ii,:)));
        end
    end
end

