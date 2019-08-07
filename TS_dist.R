# ʱ�����о���
library(TSdist)
library(xts)
library(timeSeries)
library(dtw)
library(MTS)

## Multivariate
mts1 <- matrix(rnorm(10), 5, 2)
mts2 <- matrix(rnorm(8), 4, 2)
myMethod<-"euclidean" # Or anything else

# ֱ�Ӽ����������е�dtw����
al1<-dtw(mts1,mts2,dist.method=myMethod, keep.internals = TRUE)              # Passing the two inputs
al1$costMatrix # �ۼƾ������
al1$localCostMatrix # mts1��mts2�ĵ����ľ���
al1$distance # ���룬δ��׼������
al1$index1 # mts1�Ķ��������
al1$index2 # mts2�Ķ��������

# �ȼ���������������ľ������Ȼ���ڼ���dtw����
al2<-dtw(proxy::dist(mts1,mts2,method=myMethod), keep.internals = TRUE)
al2$costMatrix # �ۼƾ������
al2$localCostMatrix # mts1��mts2�ĵ����ľ���
al2$distance # ���룬δ��׼������
al2$index1 # mts1�Ķ��������
al2$index2 # mts2�Ķ��������

plot(al1$index1,al1$index2, type="b")
al2$directionMatrix

dtwWindow.plot(sakoeChibaWindow, window.size = 1, reference = 7, query=6)

al2<-dtw(proxy::dist(mts1,mts2,method=myMethod), keep.internals = TRUE,
         step.pattern = mvmStepPattern(4))

