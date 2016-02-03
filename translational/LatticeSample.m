figure; hold on
A1 = [1,0];
A2 = [1/2,sqrt(3)/2];
pos=[];

for ii=1:50
    for jj=1:50
        pos((ii-1)*50 + jj,:) = [ii*A2(1) + jj*A1(1),ii*A2(2)+jj*A1(2)];
        plot(ii*A2(1) + jj*A1(1),ii*A2(2)+jj*A1(2),'r*');
    end
end
axis equal