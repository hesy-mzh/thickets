##### ##### ##### ##### #####
# 数え上げアルゴリズム
##### ##### ##### ##### #####

def lattice(B, R):
    n = len(B[0]) # 次元nの取得
    G,M = B.gram_schmidt() # 直交化法

    Gv = [] # 直交行列の2乗
    for i in range(n): Gv.append( G[i].inner_product(G[i]) )

    sigma = matrix(QQ, n+1,n)
    r = []
    for i in range(n+1): r.append( i )
    rho = [0] * (n+1)
    v = vector(ZZ , n)
    v[0] = 1
    c = [0] * n
    w = [0] * n
    last_nonzero = 1
    k = 1

    while True:
        rho[k-1] = rho[k+1 -1]+(v[k-1]-c[k-1])^2*Gv[k-1]
        if rho[k-1] <= R^2:
            if k == 1 : return v
            k=k-1; r[k-1-1]=max(r[k-1-1],r[k-1])
            for i in range(r[k-1],k+1+1) : sigma[i-1,k-1] = sigma[i+1-1,k-1] + v[i-1]*M[i-1,k-1]
            c[k-1] = -sigma[k+1-1,k-1]; v[k-1] = round(c[k-1]); w[k-1]=1
        else :
            k = k+1
            if k == n+1 : return [0]
            r[k-2] = k-1
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



A1 = matrix([[18, 7, -3, -1], [12, -9, -8, 15], [-9, 1, -18, 6], [-19, -9, 0, 6]])
A2 = matrix([
[2, 4, 18, 9, -11, 11, 2],
 [12, 6, 19, -26, -7, -22, -20],
 [-13, -16, -23, 10, 17, 24, -20],
 [-16, 9, 8, 8, -9, 19, 22],
 [19, -8, -23, 2, -24, -2, -9],
 [-1, -5, -4, 20, -16, 3, -11],
 [-27, 8, 30, 26, -3, -13, -5]
])

print(lattice(A1, 7))
print(lattice(A2, 16))




##########    ##########
########## 問 ##########
##########    ##########

print("課題Aの行列")
n = 4
b = Matrix(n, [[18, 7, -3, 1], 
              [12, -9, -8, 15], 
              [-9, 1, -18, 6], 
              [-19, -9, 0, 6]])
print(b)
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
print()

print("課題Bの行列")
n = 6
b = Matrix(ZZ, n)
for i in range(n): b[i, i] = 1
b[0, 0] = 471691; b[1, 0] = 213169; b[2, 0] = 376903
b[3, 0] = 9871; b[4, 0] = 254689; b[5, 0] = 150236
print(b)
print()

n = 8
b = Matrix(ZZ, n)
for i in range(n): b[i, i] = 1
b[0, 0] = 32121; b[1, 0] = 4817; b[2, 0] = 2054; b[3, 0] = 7023
b[4, 0] = 22244; b[5, 0] = 8571; b[6, 0] = 9357; b[7, 0] = 15650
print(b)

##########    ##########
##########    ##########
##########    ##########


