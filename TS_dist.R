# 时间序列距离
library(TSdist)
library(xts)
library(timeSeries)
library(dtw)
library(MTS)

## Multivariate
mts1 <- matrix(rnorm(10), 5, 2)
mts2 <- matrix(rnorm(8), 4, 2)
myMethod<-"euclidean" # Or anything else

# 直接计算两个序列的dtw距离
al1<-dtw(mts1,mts2,dist.method=myMethod, keep.internals = TRUE)              # Passing the two inputs
al1$costMatrix # 累计距离矩阵
al1$localCostMatrix # mts1与mts2的点与点的距离
al1$distance # 距离，未标准化距离
al1$index1 # mts1的对齐的索引
al1$index2 # mts2的对齐的索引

# 先计算两个矩阵点与点的距离矩阵，然后在计算dtw距离
al2<-dtw(proxy::dist(mts1,mts2,method=myMethod), keep.internals = TRUE)
al2$costMatrix # 累计距离矩阵
al2$localCostMatrix # mts1与mts2的点与点的距离
al2$distance # 距离，未标准化距离
al2$index1 # mts1的对齐的索引
al2$index2 # mts2的对齐的索引

plot(al1$index1,al1$index2, type="b")
al2$directionMatrix

dtwWindow.plot(sakoeChibaWindow, window.size = 1, reference = 7, query=6)

al2<-dtw(proxy::dist(mts1,mts2,method=myMethod), keep.internals = TRUE,
         step.pattern = mvmStepPattern(4))


