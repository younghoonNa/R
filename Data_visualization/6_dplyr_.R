
getwd()

setwd("C:/Users/hallym/Desktop/R")
getwd()

install.packages("animation")
install.packages("png")
library(animation)
library(png)

install.packages("dplyr")
library(dplyr)


tat <- read.csv("���α������_�õ�_�ñ�����_����_������(2018).csv") # ������ ���
tat

dta2 <- tat %>% filter(�ñ���=="������") %>% select(��, �߻��Ǽ�, ����ڼ�, �λ��ڼ�, �߻�, ���, �λ�Ű�)
dta2


options(repr.plot.width=20, repr.plot.height=10)

par(bg="yellow")
plot(dta2$�߻��Ǽ�, main= paste("����� ������ ���� ������ ���(2018)", "\n", "��ó[�ѱ����ΰ���]"),
     xlab="��", ylab="�Ǽ�", type='o', axes = F,
     col=1, ylim = c(0,400),  pch=1, lwd=2)
lines(dta2$�λ��ڼ�, type='o', col=2, pch=2)
lines(dta2$�߻�, type='o', col=3, pch=3, lwd=2)
lines(dta2$���, type='o', col=4, pch=4, lwd=2)
lines(dta2$�λ�Ű�, type='o', col=5, pch=5, lwd=2)
axis(1, at = 1:12, labels = seq(1,12))
axis(2, ylim = c(0,400))

text(1, 250, "229��", col= "red")

arrows(8, 350, 12, 180, col = "red", lwd = 4)
text(8, 370, "171������ ���� �����ϴ�.", col= "red")


legend("topright", c("�߻��Ǽ�", "�λ��ڼ�", "�߻�", "���", "�λ�Ű�"), 
       cex=0.8, col=c(1:5), fill=c(1:5),  bg="white", density = 90)


df_m2 <- tat %>% filter(�õ� == "����") %>% group_by(�ñ���) %>%
  summarise("�ñ����� �߻��Ǽ�" = sum(�߻��Ǽ�)) 
df_m2


par(bg = "darkgray", mar = c(4,5,5,4), oma = c(2,2,2,2), pty = 'm')
barplot(df_m2$"�ñ����� �߻��Ǽ�", beside = T, col = rainbow(30), border= "white",
      space = 1, names.arg = df_m2$�ñ���, las = 2, ylim = c(0,3800))
title("2018�� ������� ������ �߻� �Ǽ�", font = 2, xlab = "�ñ���", ylab = "��ġ")
grid(10 ,7, lty = 2, lwd =1, col = "white")
box(which = 'inner', col = "black", lwd = 2)

for (i in c(1:25)) {
  points(2*(i-1)+1.5, df_m2[i,2], cex= 3, col = rainbow(30))
  
}

df_p3 <- tat %>% filter(�ñ��� == "��걸") %>% select(�߻��Ǽ�, �λ��ڼ�, �߻�, �λ�Ű�)
df_p3

df_m3 <- as.matrix(df_p3)
df_m3


par(bg="yellow4")
name <- c("�߻��Ǽ�", "�λ�Ǽ�", "�߻�", "�λ�Ǽ�")
barplot(df_m3, density=120, main="����� ��걸 ���� ������ ���(2018)",
        ylab="�Ǽ�", beside = T, col=rainbow(12), ylim = c(0, 200),
        names.arg = name)
points(1.5, 100, cex = 4, col = 'white', lwd = 4)
points(24.5, 130, cex = 4, col = 'white', lwd = 4)
points(38.5, 20, cex = 4, col = 'white', lwd = 4)
points(50.5, 8, cex = 4, col = 'white', lwd = 4)

grid(4, 6, lwd = 1, lty = 2, col = 'black')

legend(30, 200 , density=30, angle=50, name, ncol=2, cex=0.7, fill=rainbow(12), lty=1,
       box.lty=1, box.col = "white")
legend(30,250, ncol = 4, name, cex=0.7, fill=rainbow(12), box.lty=1, bg="yellow")

s = sum(df_p4$�߻��Ǽ�)

df_p4 <- tat %>% filter(�ñ��� == "��걸") %>% group_by(�ñ���) %>% select(��, �߻��Ǽ�)
df_p4

df_m4 <- round(df_p5$�߻��Ǽ�/s * 100,2)
df_m4

par(bg = "darkblue", fg = "white")
pie(df_p4$�߻��Ǽ�, col = rainbow(length(df_p5$�ñ���)), main = 
      paste("2018�⵵ ��걸�� ������ ���� �ð�ȭ.", "\n", "��ó[���ΰǰ����ǰ���]"),
    cex = 1, labels = paste(df_p5$��,"\n", df_m4, "%"), font = 2)
box(which = 'inner', lwd = 2, col = "white")
arrows(-0.3, 0.3, 0.2, 1.2, col = "red", angle = 0)
arrows(0.1, 1, 1, 1, col = "red")
text(2,1, "���� ���� ����� �߻��� ���� 5��")

df_p5 <- tat %>% filter(�ñ��� == "�߶���") %>% group_by(�ñ���) %>% select(��, �߻��Ǽ�)
df_p5

df_m5 <- round(df_p5$�߻��Ǽ�/s * 100,2)
df_m5

install.packages("plotrix")
library(plotrix)

options(repr.plot.width=15, repr.plot.height=10)

par(bg = "pink", fg = "white")
pie3D(df_p5$�߻��Ǽ�, col = rainbow(length(df_p5$�ñ���)), main = 
      paste("2018�⵵ �߶����� ������ ���� �ð�ȭ.", "\n", "��ó[���ΰǰ����ǰ���]"),
    cex = 1, labels = paste(df_p5$��,"\n", df_m5, "%"))
box(which = 'inner', lwd = 2, col = "white")
arrows(-0.4, 0.3, -0.4, 1.2, col = "red", angle = 0)
arrows(-0.4, 0.94, 2, 0.94, col = "red")
