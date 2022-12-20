# 簡約パラメータ
d=0.99
# 基底ベクトル数
n=10
# 基底ベクトル
b1= vector([7412341,0,0,0,0,0,0,0,0,0])
b2= vector([4198961,1,0,0,0,0,0,0,0,0])
b3= vector([3080971,0,1,0,0,0,0,0,0,0])
b4= vector([4833861,0,0,1,0,0,0,0,0,0])
b5= vector([5883429,0,0,0,1,0,0,0,0,0])
b6= vector([2237499,0,0,0,0,1,0,0,0,0])
b7= vector([4964807,0,0,0,0,0,1,0,0,0])
b8= vector([6561567,0,0,0,0,0,0,1,0,0])
b9= vector([1653939,0,0,0,0,0,0,0,1,0])
b10=vector([5698763,0,0,0,0,0,0,0,0,1])



# 基底ベクトルを行として並べた行列
B=matrix([b1,b2,b3,b4,b5,b6,b7,b8,b9,b10])
# シュミットの直交化法
# 直交化したベクトルの行列Cと係数mu
C,mu = B.gram_schmidt()

# ノルム保存ベクトル
B_norm=vector(RR,n)
#print(B_norm) # ノルム保存ベクトルの確認
# 各ベクトルのノルムを保存
for i in range(0,n):
    B_norm[i]=C[i].inner_product(C[i])
#print(B_norm) # ノルム保存ベクトルの確認


# アルゴリズム

k=2

while k <= n:
    for j in range(k-1,0,-1):
        if abs(mu[k-1,j-1]) > 0.5 :
            q=round(mu[k-1,j-1])  # グラムシュミット係数を四捨五入で丸める
            B[k-1]=B[k-1]-q*B[j-1]
            for l in range(0,j):
                    mu[k-1,l]=mu[k-1,l]-q*mu[j-1,l]
    if B_norm[k-1] >= (d-mu[k-1,k-2]^2)*B_norm[k-2]:
        k=k+1
    else :
        B.swap_rows(k-1,k-2)
        C,mu = B.gram_schmidt()
        for i in range(0,n):
            B_norm[i]=C[i].inner_product(C[i])
        k=max(k-1,2)

# 計算終了 #

### 結果表示 ###

print("===== 行列 B =====")
print(B)
print("===== 行列 C =====")
print(C)
print("===== 行列 mu =====")
print(mu)

print("===== 行列Bの各ベクトルのノルム =====")
for i in range(0,n):
    print(i,"行目:", B[i].norm().n())
print("===== 行列Cの各ベクトルのノルム =====")
for i in range(0,n):
    print(i,"行目:", C[i].norm().n())


