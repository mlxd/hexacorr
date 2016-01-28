function [GK,R] = sortCorr(psiPsi)
% Sorts the structs for translational correlation based on the radius.

    [~,order] = sort([psiPsi(:).rabs],'ascend');
    sPsiPsi = psiPsi(order);
    GK = zeros(size(sPsiPsi,2),1);
    R = zeros(size(sPsiPsi,2),1);
    for ii=1:size(sPsiPsi,2)
        R(ii) = sPsiPsi(ii).rabs;
        GK(ii) = abs(sum(sPsiPsi(ii).pk01)./6);
    end
end