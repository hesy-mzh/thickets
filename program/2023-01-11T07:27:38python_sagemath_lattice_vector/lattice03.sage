
count=0
def debugprint(text,sigma,r,rho,v,c,w,last_nonzero,k):
    global count
    count=count+1
    print("debug:",count,":ここから:",text)
    print("シグマ:")
    print(sigma)
    print("r:",r,"  ロー:",rho, "  v:",v)
    print("c:",c, "  w:",w, "  last nonzero:",last_nonzero, "  k:",k)
    print("\n")
#    print("ここまで:",text)


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
    
    # 初期値
    print("初期値")
    print("n:",n)
    print("直交ベクトル")
    print(G)
    print("係数")
    print(M)
    print("内積:",Gv)
#    print("シグマ:")
#    print(sigma)
#    print("r:",r)
#    print("ロー:",rho)
#    print("v:",v)
#    print("c:",c)
#    print("w:",w)
#    print("last nonzero:",last_nonzero)
#    print("k:",k)
    print("ここまで初期値")
    #

    while True:
        debugprint("loop 1st",sigma,r,rho,v,c,w,last_nonzero,k) ### debug
        rho[k-1] = rho[k+1 -1]+(v[k-1]-c[k-1])^2*Gv[k-1]
        #debugprint("loop 2nd",sigma,r,rho,v,c,w,last_nonzero,k) ### debug
        if rho[k-1] <= R^2:
            debugprint("loop iftrue 1st",sigma,r,rho,v,c,w,last_nonzero,k) ### debug
            if k == 1 : return v
            k=k-1; r[k-1]=max(r[k-1],r[k])
            debugprint("loop iftrue k=k-1; r[k-1-1]=max(r[k-1-1],r[k-1])",sigma,r,rho,v,c,w,last_nonzero,k) ### debug
            for i in range(r[k],k+1+1,-1) : sigma[i-1,k-1] = sigma[i+1-1,k-1] + v[i-1]*M[i-1,k-1]
            debugprint("loop iftrue 3rd",sigma,r,rho,v,c,w,last_nonzero,k) ### debug
            c[k-1] = -sigma[k+1-1,k-1]; v[k-1] = round(c[k-1]); w[k-1]=1
            debugprint("loop iftrue 4th",sigma,r,rho,v,c,w,last_nonzero,k) ### debug
        else :
            debugprint("loop iffalse 1st",sigma,r,rho,v,c,w,last_nonzero,k) ### debug
            k = k+1
            if k == n+1 : return [0]
            r[k-2] = k-1
            #debugprint("loop iffalse 2nd",sigma,r,rho,v,c,w,last_nonzero,k) ### debug
            if k>= last_nonzero:
                last_nonzero = k; v[k-1] = v[k-1] + 1
                debugprint("loop iffalse 2nd if true",sigma,r,rho,v,c,w,last_nonzero,k) ### debug
            else:
                debugprint("loop iffalse 3rd if false",sigma,r,rho,v,c,w,last_nonzero,k) ### debug
                if v[k-1] > c[k-1]:
                    debugprint("loop iffalse 4th iffalse iftrue",sigma,r,rho,v,c,w,last_nonzero,k) ### debug
                    v[k-1] = v[k-1] - w[k-1]
                else:
                    debugprint("loop iffalse 5th iffalse iffalse",sigma,r,rho,v,c,w,last_nonzero,k) ### debug
                    v[k-1] = v[k-1] + w[k-1]
                w[k-1] = w[k-1] +1
                debugprint("loop iffalse 6th",sigma,r,rho,v,c,w,last_nonzero,k) ### debug

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
#print(lattice(A2, 16))

