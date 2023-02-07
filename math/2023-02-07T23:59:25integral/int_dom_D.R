#!/bin/env Rscript

# 出力先を指定
pdf("Domain_1_1_R.pdf")


#平面を作成

# 平面のサイズ
x_lim <- c(-1,1)
y_lim <- c(-1,1)


# 角度
theta <- seq(0, 2*pi, length=100)

# 半径 1 の円
plot(cos(theta), sin(theta), xlim=x_lim, ylim=y_lim, type="l", asp=1,
col=2, ann=F, main="Domain")
#col=2, ann=F, xaxt="n", yaxt="n", main="Domain")


# 直線
par(new=T)
lines(x=c(-1,1),y=c(-1,1), type="o", lty=1, col=4)


# 塗りつぶし
th <- seq(pi/4, pi/2, length=100)
#par(new=T)
polygon(c(0,0,cos(th)), c(1,0,sin(th)), col="gray")



dev.off()

