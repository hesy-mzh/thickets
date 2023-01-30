#!/bin/env Rscript

# 出力先を指定
pdf("pole_plot_R.pdf")


#平面を作成

# 平面のサイズ
x_lim <- c(-5,5)
y_lim <- c(0,6.5)

# 極
x <- c(0)
y <- c(pi)
plot(x, y, xlim=x_lim, ylim=y_lim, xlab="Real", ylab="Image", asp=1, main="pole")


# 角度
#theta <- seq(0, pi, length=100)

# 半径 5 の円
#par(new=T)
#plot(5*cos(theta), 5*sin(theta), xlim=x_lim, ylim=y_lim, type="l", asp=1, col=2, ann=F, xaxt="n", yaxt="n")
#text(x=0,y=5,labels="C2", pos=1)


# 直線
par(new=T)
lines(x=c(-5,5,5,-5,-5),y=c(0,0,2*pi,2*pi,0), type="o", lty=1, col=4)
text(x=0,y=0,labels="L1", pos=3)
text(x=5,y=3,labels="L2", pos=2)
text(x=0,y=6,labels="L3", pos=1)
text(x=-5,y=3,labels="L4", pos=4)


# 各点
text(x=-5,y=0,labels="P1", pos=1)
text(x=5,y=0,labels="P2", pos=1)
text(x=5,y=2*pi,labels="P3", pos=4)
text(x=-5,y=2*pi,labels="P4", pos=4)

dev.off()

