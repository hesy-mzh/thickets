#!/bin/env Rscript

# 刻み値time[1]と最大時刻time[2]
time<-c(0.1, 50)

#
# 二階微分方程式
# u'' = -sin u - Mu'
# u(0)=A, u'(0)=B
#

# 微分方程式のメイン関数
fn_main <- function(x,y,z) {
    return(z)
}

# 微分方程式のサブ関数
fn_sub <- function(x,y,z) {
    return(-sin(y)-M*z)
}

# Runge-Kutta method
r_k_method <- function(a,b) {

    u<-c(a)  # uの初期値
    v<-c(b)  # u'の初期値

    delta <- time[1]  # 刻み値

    for (i in c(1:floor(time[2]/delta))) {

        k <- fn_main(t[i+1], u[i], v[i])
        m <- fn_sub(t[i+1], u[i], v[i])

        k <- c(k, fn_main(t[i+1]+delta/2,u[i]+k[1]*delta/2,v[i]+m[1]*delta/2))
        m <- c(m, fn_sub(t[i+1]+delta/2,u[i]+k[1]*delta/2,v[i]+m[1]*delta/2))

        k <- c(k, fn_main(t[i+1]+delta/2,u[i]+k[2]*delta/2,v[i]+m[2]*delta/2))
        m <- c(m, fn_sub(t[i+1]+delta/2,u[i]+k[2]*delta/2,v[i]+m[2]*delta/2))

        k <- c(k, fn_main(t[i+1]+delta/2,u[i]+k[3]*delta,v[i]+m[3]*delta))
        m <- c(m, fn_sub(t[i+1]+delta/2,u[i]+k[3]*delta,v[i]+m[3]*delta))

        u[i+1] <- u[i] + k %*% c(1,2,2,1) * delta/6
        v[i+1] <- v[i] + m %*% c(1,2,2,1) * delta/6

    }

    ### Runge Kutta 法 とは無関係
    e<-v^2/2-cos(u)  # E(t) = u'^2/2 - cos(u)
    ###

    return(c(u,e))  # 数値解 u と おまけのe
}


# 時間t のベクトル
t <- seq(0, time[2], by = time[1])

### 数値計算 ###
# 初期値 u(0)=2, u'(0)=0, 空気抵抗m=0
M<-0
A=matrix(r_k_method(2, 0), ncol=2)
u_1 <- A[,1]
e_1 <- A[,2]

# 初期値 u(0)=2, u'(0)=0, 空気抵抗m=0.2
M<-0.2
A=matrix(r_k_method(2, 0), ncol=2)
u_2 <- A[,1]
e_2 <- A[,2]

# 初期値 u(0)=2, u'(0)=1.5, 空気抵抗m=0.2
M<-0.2
#u31<-r_k_method(2,1.5)
A=matrix(r_k_method(2, 1.5), ncol=2)
u_3 <- A[,1]
e_3 <- A[,2]




# 近似解をグラフにする
png("graph1.png")

plot(t,u_1,type="l",col="red", ylim=c(-2,8),ann=F)
par(new=T)
plot(t,u_2,type="l",col="green", ylim=c(-2,8),ann=F)
par(new=T)
plot(t,u_3,type="l",col="blue", ylim=c(-2,8),ann=F)

dev.off()


# E(t)をグラフにする
png("graph2.png")

plot(t,e_1,type="l",col="red", ylim=c(-1,2),ann=F)
par(new=T)
plot(t,e_2,type="l",col="green", ylim=c(-1,2),ann=F)
par(new=T)
plot(t,e_3,type="l",col="blue", ylim=c(-1,2),ann=F)

dev.off()

