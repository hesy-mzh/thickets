# 簡約パラメータ
d=0.99
# 基底ベクトル数
n=8
# 基底ベクトル
b1=vector([412341,0,0,0,0,0,0,0])
b2=vector([189973,1,0,0,0,0,0,0])
b3=vector([394513,0,1,0,0,0,0,0])
b4=vector([321880,0,0,1,0,0,0,0])
b5=vector([225516,0,0,0,1,0,0,0])
b6=vector([342935,0,0,0,0,1,0,0])
b7=vector([227799,0,0,0,0,0,1,0])
b8=vector([ 14011,0,0,0,0,0,0,1])



# 基底ベクトルを行として並べた行列
B=matrix([b1,b2,b3,b4,b5,b6,b7,b8])
# 直交化したベクトルの行列Cと係数mu
C,mu = B.gram_schmidt()

# ノルム保存ベクトル
B_norm=vector(RDF,[0,0,0,0,0,0,0,0])
print(B_norm) # ノルム保存ベクトルの確認
for i in range(0,n):
    B_norm[i]=C[i].dot_product(C[i])
print(B_norm) # ノルム保存ベクトルの確認

k=2

while k <= n:
    for j in range(k-1,0,-1):
        if abs(mu[k-1,j-1]) > 0.5 :
            q=round(mu[k-1,j-1])  # 注意 修正
            B[k-1]=B[k-1]-q*B[j-1]
            for l in range(0,j):
                    mu[k-1,l]=mu[k-1,l]-q*mu[j-1,l]
    if B_norm[k-1] >= (d-mu[k-1,k-2]^2)*B_norm[k-2]:
        k=k+1
    else :
        B.swap_rows(k-1,k-2)
        C,mu = B.gram_schmidt()
        for i in range(0,n):
            B_norm[i]=C[i].dot_product(C[i])
        k=max(k-1,2)

print("===== 行列 B =====")
print(B)
print("===== 行列 C =====")
print(C)
print("===== 行列 mu =====")
print(mu)

