
using LinearAlgebra

# 関数値ベクトル
function f(x) 
   return [ x[2]^2-x[1]^3+4*x[1],
            (x[1]/2)^4+x[2]^4-1 ]
end

# 偏導関数行列
function Df(x) 
   return [ -3*x[1]^2+4 2*x[2]; 
            x[1]^3/4    4*x[2]^3 ]
end

function newton(x0, f, Df) 
    maxiter = 100  # 最大反復回数．適宜調整する．
    tol = 1e-6     # 停止条件の tolerance．適宜調整．
    x2 = x1 = x0 # 初期値

    for i in 1:maxiter

        # 行列Df が 退化している場合
        if det(Df(x1))==0
            return "degenerate"
        end
        
        x2 = x1 - Df(x1)\f(x1)
        
        # 途中経過の表示
        @show x2

        # 停止条件の判定    
        if norm(x2 - x1) < tol
            println("Converged in $i iterations.")
            break            
        end 

        x1 = x2
    end
    return x2    # 数値解を返却
end

newton([0,1.0],f,Df)

