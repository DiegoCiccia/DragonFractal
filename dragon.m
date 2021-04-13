%% The Dragon Fractal
% A MATLAB replica of the building of such fractal

%% Author: Diego Ciccia


%% Building the Fractal
% Starting from two lines at a right angle, we flip the whole figure by 90
% degrees on its vertex and add it to itself. We repeat the same procedure
% for every new shape we encounter. The ending result will be the formation
% of a fractal. In order to do so, the script firstly builds a matrix
% containing the modifications to the coordinates which are to be made,
% starting from the origin, in order to obtain a set of points which, once
% connected, yield the fractal figure.

n=20;
l=2;
for i=1:n
    l=l+2^i;
end
V=zeros((l+1),2);
d=repmat([2,1],1,2^n);
rep = [zeros(1,l);d];
rep(1,1:2) = [1,1];
for k=1:n
    z=2^k;
    j=2^(k-1);
    for m=1:z
        if m <= j
            rep(1, z + m) = rep(1, m) * -1;
        else
            rep(1, z + m) = rep(1,m);
        end
    end
end
rep = rep';

for s=2:length(V)          
        if rep((s-1),2) == 1
            V(s,1) = V(s-1,1) + rep((s-1),1);
            V(s,2) = V(s-1,2);
        else
            V(s,1) = V(s-1,1);
            V(s,2) = V(s-1,2) + rep((s-1),1);
        end
end

for i=1:n
    top = max(max(abs(V(1:(1+2^i),:)))) * 1.1;
    plot(V(1:(1+2^i),1), V(1:(1+(2^i)),2))
    ylim([-top, top])
    xlim([-top, top])
    grid on
    text(top,top,['n =', num2str(i)])
    drawnow
    pause(1)
end











