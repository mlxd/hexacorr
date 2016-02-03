function [GKB,bin] = binIt(GK,R,binMax,bins)

if binMax == 0
    binMax = max(R)+1;
end

bin = linspace(0,binMax,bins);
GKB = zeros(length(bin)-1,1);

for kk=1:(length(bin)-1)
    idx = find( R >= bin(kk) & R < bin(kk+1) );
    if length(idx) >0
        GKB(kk) = mean(GK(idx));%sum((GK(idx)))./length(idx);
    else
        GKB(kk) = 0;
    end
end

end