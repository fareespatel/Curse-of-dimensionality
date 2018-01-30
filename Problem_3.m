%Mohammed Farees Patel

% X_dim represents the range of d-dimensional points
%Y_dim represents the range of n random points
X_dim= 1:10:100;
Y_dim=100:100:1050;

%creating a meshgrid
[X,Y]= meshgrid(X_dim, Y_dim);

%Creating a Z matrix that will store the gamma values for the first section
%where the distance function used is euclidean distance
Z1= zeros(size(X));

%Extract the dimensions of the Z matrix
[Z1_rows, Z1_col] = size(Z1);

%Section 1: Calculating the distance function using euclidean distance

for i=1:1:Z1_rows
    for j=1:1:Z1_col
        dim = X(1,i)
        num_pts= Y(j,1)
        n_by_d_matrix= randi([0,100],num_pts,dim)
        eud_dist= pdist(n_by_d_matrix)
        max_dist= max(eud_dist)
        min_dist= min(eud_dist(eud_dist>0))
        Z1(j,i)= log((max_dist - min_dist)/min_dist)
    end
end

%Section-2: Calcualting the ditance function using L1 norm (Minkowski).

Z2= zeros(size(X))

for i=1:1:Z1_rows
    for j=1:1:Z1_col
        dim = X(1,i)
        num_pts= Y(j,1)
        n_by_d_matrix= randi([0,100],num_pts,dim)
        eud_dist= pdist(n_by_d_matrix,'minkowski',1)
        max_dist= max(eud_dist)
        min_dist= min(eud_dist(eud_dist>0))
        Z2(j,i)= log((max_dist - min_dist)/min_dist)
    end
end

%Plot the 3D surface plot of the first section
subplot(1,2,1)
surf(X,Y,Z1)
xlabel('d-dimension')
ylabel('n-random points')
zlabel('gamma(d,n)')
title('Curse of Dimensionality (Euclidean Distance)')

%Plot the 3D surface plot of the second section
subplot(1,2,2)
surf(X,Y,Z2)
xlabel('d-dimension')
ylabel('n-random points')
zlabel('gamma(d,n)')
title('Curse of Dimensionality (L1 norm - Minkowski Distance)')


