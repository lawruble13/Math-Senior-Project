close all;
clear;
numlights = 7;
% Take a floor layout defined by triangles
triangles(:,:,1) = [0 0; -1 2; -1 9];
triangles(:,:,2) = [0 0; -1 9; 12 9];
triangles(:,:,3) = [0 0; 12 9; 12 -1];
triangles(:,:,4) = [0 0; 12 -1;  0 -1];
x = linspace(min(triangles(:,1,:),[],'all'), max(triangles(:,1,:),[],'all'), 200);
y = linspace(min(triangles(:,2,:),[],'all'), max(triangles(:,2,:),[],'all'), 200);
[X,Y] = meshgrid(x,y);
S = [vec(X) vec(Y)];
R = inshape(triangles, S);
S = S(R,:);

E = cell(0,2);

n=numlights*2;
m = n;
start = true;
for iter=1:25
    if start
        for i=1:m
            j = randi([1,size(S,1)],numlights,1);
            lightcentres = S(j,:);
            E = [E;{lightobj(numlights,lightcentres,S(:,1),S(:,2))},{lightcentres}];
        end
        start = false;
    else
        for i=1:m
            rc = rand();
            if rc < G(1)
                k=1;
            else
                for j=2:length(G)
                    if(G(j-1) < rc & G(j) > rc)
                        k=j;
                        break;
                    end
                end
            end
            lightcentres = Cx{randi([(k-1)*(N/K)+1,k*(N/K)],1,1),2};
            E = [E;{lightobj(numlights,lightcentres,S(:,1),S(:,2))},{lightcentres}];
        end
    end

    D = zeros(size(E,1));
    f = zeros(size(E,1),1);
    for i=1:size(E,1)
        D(i,i) = 0;
        for j=i+1:size(E,1)
            D(i,j) = norm(E{i,2}-E{j,2},'fro');
            D(j,i) = D(i,j);
        end
        f(i) = E{i,1};
    end

    a = D\f;
    fh = @(x)(linearspline(E(:,2),a,x));

    N = 10^4;
    Cx = cell(N,2);
    for i=1:N
        j = randi([1,size(S,1)],numlights,1);
        Cx{i,2} = S(j,:);
        Cx{i,1} = fh(Cx{i,2});
    end
    M = max(cell2mat(Cx(:,1)));
    for i=1:N
        Cx{i,1} = M-Cx{i,1};
    end
    Cx = sortrows(Cx,1,'descend');

    K = 10^2;
    gw = zeros(K,1);
    for i=1:K
        gw(i) = mean(cell2mat(Cx((i-1)*(N/K)+1:i*(N/K),1)));
    end
    gw = gw/sum(gw);
    G = cumsum(gw);
end

E = sortrows(E,1);

lightcentres = E{1,2};

fprintf("Minimum of %d obtained with\n", E{1,1});
for i=1:numlights
    fprintf("\tLight %i at (%d, %d)\n",i,lightcentres(i,1),lightcentres(i,2));
end

[~,~,m,M,B] = lightcalc(numlights, lightcentres, S(:,1),S(:,2));
scatter3(S(:,1),S(:,2), B, 5, B);
title("Illumination with best placement")

% figure;
% spline = zeros(size(S,1),1);
% points = cell2mat(E(:,2));
% heights = cell2mat(E(:,1));
% for i=1:size(S,1)
% spline(i) = fh(S(i,:));
% end
% scatter3(S(:,1),S(:,2),spline,5,spline)
% title("Most recent spline");
% hold on;
% scatter3(points(:,1),points(:,2),heights,10,'black')
