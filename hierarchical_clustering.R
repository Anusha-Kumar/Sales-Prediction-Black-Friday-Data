# An illustration of Hierarchical Agglomerative Clustering method on the data to group customers

## Computing Euclidean distances with select variables that affect the purchase amount the most
d=dist(tr_data[,c(7,9,10)],method="euclidean")

## Using hclust() method 
## method='average' implies the algorithm uses Average Linkage. Other alternatives are 'single', 'complete', 'ward.D'
fit = hclust(d,method="average")

summary(fit)
plot(fit)
