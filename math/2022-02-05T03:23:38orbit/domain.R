#!/bin/env Rscript

x<-c(2,5,5,2,-5,-5,2);
y<-c(0,3,-3,0,7,-7,0)

plot(x, y, xlim=c(-4,4), ylim=c(-4,4), type="n", xlab="X-axis", ylab="Y-axis",main="|x-2|>|y|")

polygon(x, y, col=3);

axis(side=1, pos=0);
axis(side=2, pos=0)

