
using LinearAlgebra

A = Float64[2 -1 0 0 0; -1 2 -1 0 0; 0 -1 2 -1 0; 0 0 -1 2 -1; 0 0 0 -1 2]

b = Float64[0, 0, 0, 0, 6]
x = [0, 0, 0, 0, 0]
r = b - A*x
p = r
tol = 1e-6   # 停止条件のtolerance

# 固有値の確認
@show eigvals(A)

# CG法による反復計算
for i in 1:20
    alpha = r'*p/(p'*A*p)
    xx = x + alpha*p
    # 停止条件
    (norm(xx - x) < tol) && break
    global x = xx
    @show i, Float64.(x)   # 途中経過の表示
    global r = r - alpha*A*p
    beta = r'*A*p/(p'*A*p)
    global p = r - beta*p
end

@show x   # 数値解の表示

