#!/bin/env Rscript

# 出力先を指定
pdf("pole_plot_R.pdf")


#平面を作成

# 極
x <- c(1/2, -1, 1/2)
y <- c(sqrt(3)/2, 0, -sqrt(3)/2)
plot(x-1, y, xlim=c(-3,3), ylim=c(-3,3), xlab="Real", ylab="Image", asp=1, main="pole")


# 角度
theta <- seq(0, 2*pi, length=100)

# 半径 0.5 の円
par(new=T)
plot(0.5*cos(theta), 0.5*sin(theta), xlim=c(-3,3), ylim=c(-3,3), type="l", asp=1, col=2, ann=F, xaxt="n", yaxt="n")
text(x=0,y=0.5,labels="C4", pos=3)

# 半径 3 の円
par(new=T)
plot(3*cos(theta), 3*sin(theta), xlim=c(-3,3), ylim=c(-3,3), type="l", asp=1, col=3, ann=F, xaxt="n", yaxt="n")
text(x=2.2,y=2.2,labels="C2", pos=3)

# 直線
par(new=T)
lines(x=c(0.5,3),y=c(0.01,0.01),lty=1,col=4)
text(x=2,y=0,labels="C1", pos=3)

par(new=T)
lines(x=c(0.5,3),y=c(-0.01,-0.01),lty=1,col=5)
text(x=2,y=0,labels="C3", pos=1)

# 各点
text(x=0.5,y=0.1,labels="P1", pos=4)
text(x=3,y=0.1,labels="P2", pos=4)
text(x=3,y=-0.1,labels="P3", pos=4)
text(x=0.5,y=-0.1,labels="P4", pos=4)

dev.off()

