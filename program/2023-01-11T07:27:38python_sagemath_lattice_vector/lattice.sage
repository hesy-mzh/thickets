
##### ##### ##### ##### #####
# 数え上げアルゴリズム
##### ##### ##### ##### #####

def lattice(B, R):
    n = len(B[0]) # 次元nの取得
    G,M = B.gram_schmidt() # 直交化法

    Gv = [] # 直交行列の2乗
    for i in range(n):
        Gv.append( G[i].inner_product(G[i]) )

    sigma = matrix(QQ, n+1,n)
    r = []
    for i in range(n+1):
        r.append( i )
    rho = [0] * (n+1)
    v = vector(ZZ , n)
    v[0] = 1
    c = [0] * n
    w = [0] * n
    last_nonzero = 1
    k = 1
    

    while True:

        rho[k-1] = rho[k]+(v[k-1]-c[k-1])^2*Gv[k-1]

        if rho[k-1] <= R^2:

            if k == 1:
                return v
            k=k-1
            r[k-1]=max(r[k-1],r[k])

            for i in range(r[k],k,-1):
                sigma[i-1,k-1] = sigma[i,k-1] + v[i-1]*M[i-1,k-1]

            c[k-1] = -sigma[k,k-1]
            v[k-1] = round(c[k-1])
            w[k-1]=1

        else :

            k = k+1
            if k == n+1:
                return [0]
            r[k-1] = k

            if k>= last_nonzero:
                last_nonzero = k; v[k-1] = v[k-1] + 1
            else:
                if v[k-1] > c[k-1]:
                    v[k-1] = v[k-1] - w[k-1]
                else:
                    v[k-1] = v[k-1] + w[k-1]
                    
                w[k-1] = w[k-1] +1


##### ##### ##### ##### #####
# 以上 関数lattice 定義
##### ##### ##### ##### #####







print("課題Aの行列")
n = 4
b = Matrix(n, [[18, 7, -3, 1], 
              [12, -9, -8, 15], 
              [-9, 1, -18, 6], 
              [-19, -9, 0, 6]])
print(b)
print(lattice(b, 7))
print()

n = 7
b = Matrix(n, [[2, 4, 18, 9, -11, 11, 2], 
              [12, 6, 19, -26, -7, -22, -20], 
              [-13, -16, -23, 10, 17, 24, -20], 
              [-16, 9, 8, 8, -9, 19, 22], 
              [19, -8, -23, 2, -24, -2, -9], 
              [-1, -5, -4, 20, -16, 3, -11], 
              [-27, 8, 30, 26, -3, -13, -5]])
print(b)
print(lattice(b, 16))
print()

