#!/bin/env Rscript

x<-c(2,7,-3,2,7,-3,2);
y<-c(0,5,5,0,-5,-5,0)


plot(x, y, xlim=c(-4,4), ylim=c(-4,4), type="n", xlab="X-axis", ylab="Y-axis",main="graph")

lines(c(-5,-1,-1,-5),c(5,1,-1,-5),col=1);
lines(c(5,1,1,5),c(5,1,-1,-5),col=1);

axis(side=1, pos=0, col=8);
axis(side=2, pos=0, col=8)
