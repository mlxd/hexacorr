function [gKC] = gk_struct(X,Y,rad)
psikp = zeros(length(X),1);
for ii=1:length(X)
    psikp(ii) = psik([X(ii),Y(ii)],X,Y);
end

S = uniqPairIdx_precalc([X,Y],psi6p);
[~,order] = sort([S(:).rabs],'ascend');
SSorted = S(order);

for ii=1:size(SSorted,2)
    g6S(ii).r = SSorted(ii).rabs;
    psi6_1 = SSorted(ii).cor0;
    psi6_2 = SSorted(ii).cor1;
    g6S(ii).val = abs(conj(psi6_1)*conj(psi6_1));
end
g6C = cell2mat(squeeze(struct2cell(g6S)));
%figure;plot(g6C(1,:),g6C(2,:))
end