# シュミットの直交化法
def Gram_Schmidt_orthonormalization(B):
    n = len(B[0])
    G = matrix(QQ,n)
    M = identity_matrix(QQ,n)
    G[0] = B[0]
    for i in range(1,n):
        G[i] = B[i]
        for j in range(i):
            M[i,j] = B[i].inner_product(G[j])/G[j].inner_product(G[j])
            G[i] = G[i] - M[i,j]*G[j]
    return G,M


# サンプル行列
B = matrix([[18, 7, -3, -1], [12, -9, -8, 15], [-9, 1, -18, 6], [-19, -9, 0, 6]])

# グラムシュミットの直交化法の関数
B1,B2 = B.gram_schmidt()

# 実装した直交化法の関数
G1,G2 = Gram_Schmidt_orthonormalization(B)

# 直交ベクトルの比較
print(B1-G1)

# 係数行列比較
print(B2-G2)

