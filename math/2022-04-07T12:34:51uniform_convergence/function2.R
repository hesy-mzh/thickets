#!/bin/env Rscript

# 出力先を指定
pdf("graph2_R.pdf")

x<-c(0,5,0,0)
y<-c(0,5,5,0)
# 平面を描写
plot(x, y, xlim=c(-2,8), ylim=c(-4,4), type="n", xlab="x axis", ylab="f'_n g'_n", main="graph a_0", yaxt="n")

# y座標のメモリ
axis(side=2, at=0, labels="a_0")

# 軸に数字を振る
axis(side=1, pos=0, col=8)
#axis(side=2, pos=0, col=8)


# グラフ描写
#x<-c(0,5,0,0);
#y<-c(0,5,5,0)
for (i in 0:7) {
    curve(x^i, -3, 5, add=TRUE, col=i)
    curve((x-6)^i, 1, 9, add=TRUE, col=i)
}

# 出力先デバイスを閉じる
dev.off()


