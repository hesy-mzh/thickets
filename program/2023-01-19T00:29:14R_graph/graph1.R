
x <- c(5,0,5,1,1,0,5,0)
y <- c(0,5,5,9,0,1,1,6)

pdf(width=5,height=9)

plot(x,y,type="o",xaxp=c(0,5,5),yaxp=c(0,9,9))

dev.off()

