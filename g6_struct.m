function [g6C] = g6_struct(X,Y)
S = uniqPairIdx([X,Y]);
[~,order] = sort([S(:).rabs],'ascend');
SSorted = S(order);

for ii=1:size(SSorted,2)
    g6S(ii).r = SSorted(ii).rabs;
    psi6_1 = (psi6([SSorted(ii).pos0(1),SSorted(ii).pos0(2)],X,Y,50));
    psi6_2 = (psi6([SSorted(ii).pos1(1),SSorted(ii).pos1(2)],X,Y,50));
    g6S(ii).val = abs(conj(psi6_1)*conj(psi6_1));
end
g6C = cell2mat(squeeze(struct2cell(g6S)));
%figure;plot(g6C(1,:),g6C(2,:))
end