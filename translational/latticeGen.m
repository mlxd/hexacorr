function [latt] = latticeGen(A,theta,VTX0)
    A1 = 1*[cos(0+theta),sin(0+theta)];
    A2 = 1*[cos(pi/3+theta),sin(pi/3+theta)];
    count = 0;
    for ii=100:-A:-900
        for jj=000:-A:-1000
            count = count +1;
            latt(count,:) = ii*A1 + jj*A2; 
        end
    end
    figure; plot(latt(:,1)-10.4476,latt(:,2)+12.7184,'*');hold on; plot(VTX0(:,2),VTX0(:,4),'r*');
end