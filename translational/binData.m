function [gkB,bin] = binData(gk,binMax,bins)
bin = linspace(0,binMax,bins);
gkB = zeros(length(bin)-1,1);
for kk=1:(length(bin)-1)
    idx = find( gk(3,:) >= bin(kk) & gk(3,:) < bin(kk+1) );
    if length(idx) >0
        gkB(kk) = sum(gk(4,idx))./length(idx);
    else
        gkB(kk) = 0;
    end
end

end