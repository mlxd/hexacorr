function [g6B,bin] = binData(g6C,binMax,bins)
bin = linspace(0,binMax,bins);
g6B = zeros(length(bin)-1,1);
for kk=1:(length(bin)-1)
    idx = find( g6C(1,:) >= bin(kk) & g6C(1,:) < bin(kk+1) );
    if length(idx) >0
        g6B(kk) = sum(g6C(2,idx))./length(idx);
    else
        g6B(kk) = 0;
    end
end

end