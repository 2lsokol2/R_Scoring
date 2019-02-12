
����� �-�� ���������� ������ (knn)
+ ���������� ��������

setwd("F:/scoring/KNN/R_�������_8_1_knn")
sales <- read.table("DISCRIM_0_new_R.txt", header=T, sep=";")

summary(sales)
sales[1:5, ]

#  �� �������������
#  head(sales)
#  tail(sales)


dim(sales)
class(sales[ , 6])


#  ��������� ����������
set.seed(14)
test.num <- sample(1:nrow(sales), 50, replace = FALSE)

#  �������� �������
test <- sales[test.num, 2:5]

#  ��������� �������
train <- sales[-test.num, 2:5]

#  ��� ������ ��� ��������� �������
cl <- sales[-test.num, 6]

#  ����������� ���������� class
library(class)

#  ��������� ����� �������� �� �������� �������
zzz1 <- knn(train, test, cl, k = 3)

#  ����� ����� �������� prob=TRUE


#  �������� ������������ ��������� � ������������� �������
table(zzz1, sales[test.num, 6])



#------------------------------
#  ��� ���������� �������� k?
#  �����-��������� - ���������� �������
#  ������ ����� ����� caret

a <-rep(0,15)

for (i in 1:15)
{
  zzz <- knn(train, test, cl, k = i)
  a[i] <- summ(zzz != sales[test.num, 6])
}

a

##testing

#  ��������� ����������
set.seed(3476)
test.num <- sample(1:nrow(data), 2000, replace = FALSE)

#  �������� �������
test_knn <- data[test.num, 1:12]

#  ��������� �������
train_knn <- data[-test.num, 1:12]

#  ��� ������ ��� ��������� �������
cl <- data[-test.num, 1]

#  ����������� ���������� class
library(class)

#  ��������� ����� �������� �� �������� �������
zzz1 <- knn(train_knn, test_knn, cl, k = 3)

#  ����� ����� �������� prob=TRUE


#  �������� ������������ ��������� � ������������� �������
table(zzz1, test$target_for_calc)









