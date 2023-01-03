#!/bin/env Rscript

# 出力先を指定
pdf("pole_plot_R.pdf")


#平面を作成

# 極
x <- c(1/2, -1, 1/2)
y <- c(sqrt(3)/2, 0, -sqrt(3)/2)

plot(x, y, xlim=c(-2,2), ylim=c(-2,2), xlab="Real", ylab="Image", asp=1, main="pole")

# 角度
theta <- seq(0, 2*pi, length=100)

par(new=T)
plot(0.5*cos(theta), 0.5*sin(theta), xlim=c(-2,2), ylim=c(-2,2), type="l", asp=1, col=2, ann=F, xaxt="n", yaxt="n")

par(new=T)
plot(2*cos(theta), 2*sin(theta), xlim=c(-2,2), ylim=c(-2,2), type="l", asp=1, col=3, ann=F, xaxt="n", yaxt="n")

par(new=T)
lines(x=c(0.5,2),y=c(0.01,0.01),lty=1,col=4)

par(new=T)
lines(x=c(0.5,2),y=c(-0.01,-0.01),lty=1,col=5)



dev.off()



