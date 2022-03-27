#!/bin/env Rscript

# 出力先を指定
pdf("graph_R.pdf")


# 平面を描写
plot(x, y, xlim=c(-1,4), ylim=c(-1,4), type="n", xlab="x1 axis", ylab="x2 axis",main="graph")

# 軸に数字を振る
axis(side=1, pos=0, col=8);
axis(side=2, pos=0, col=8)

# 領域の境界
lines(c(0, 5),c(0, 5),col=1);
lines(c(0, 0),c(0, 5),col=1);

# 塗りつぶし
x<-c(0,5,0,0);
y<-c(0,5,5,0)
polygon(x, y, col="gray")


# 出力先デバイスを閉じる
dev.off()


