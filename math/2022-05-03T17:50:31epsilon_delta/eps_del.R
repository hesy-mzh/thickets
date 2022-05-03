#!/bin/env Rscript

# 出力先を指定
pdf("eps_del.pdf")

#プロットする座標指定
#x<-c(0,5,0,0)
x<-seq(-2,2,length=100)

# グラフの式を関数として定義
y <- function(x) -x^3 + 8*x

# 平面にグラフを描写
plot(x, y(x), type="l", ann=F, bty="l", xaxt="n", yaxt="n")


par(cex.axis=1.4)
# 軸に数字を振る
axis(side=1, labels=c("a-d", "a", "a+d"), at=c(-0.4, 0, 0.4))
for (i in c(-0.4, 0, 0.4)) {
    lines( c(i,i), c(y(i),-10), lty=2, col=3) # x軸への垂線
}

axis(side=2, labels=c("f(a)-e", "f(a)", "f(a)+e"), at=c(y(-0.5), y(0), y(0.5)), las=2)
for (i in c(-0.5, 0, 0.5)) {
    lines( c(i,-3), c(y(i),y(i)), lty=2, col=2) # y軸への垂線
}

# 出力先デバイスを閉じる
dev.off()

