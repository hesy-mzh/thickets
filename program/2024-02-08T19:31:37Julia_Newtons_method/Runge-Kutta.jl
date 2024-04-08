# Runge-Kutta法
# http://www.isc.meiji.ac.jp/~mcelab/jyo_en2/2021/09/index.htm
# f:微分方程式 # t:時刻 # h:刻み幅
# x:関数 # n:繰返し回数
function RK4(f, t, x, h, n)
    for i in 1:n
        k0 = f(t,       x)
        k1 = f(t + h/2, x + k0*h/2)
        k2 = f(t + h/2, x + k1*h/2)
        k3 = f(t + h,   x + k2*h)
        x += (k0 + 2*k1 + 2*k2 + k3)* h/6
        t += h
    end
    return x
end

#####
# 微分方程式 u'(t) = u(t) + 1 の関数定義
function f(t, u)
    return u + 1
end

# 厳密解の関数定義
function exact_solution(t)
    return 2exp(t) - 1
end

# 初期条件と計算区間の終点
t0, u0 = 0, 1
t_end = 2

# 時間刻み幅
time_steps = [1/10, 1/20, 1/40, 1/80]

# 各時間刻み幅での数値解と厳密解との誤差を計算
for h in time_steps
    n = Int(t_end / h)
    numerical_solution = RK4(f, t0, u0, h, n)
    exact_value = exact_solution(t_end)
    error = abs(numerical_solution - exact_value)
    println("Time step: $h, Numerical Solution: $numerical_solution, Exact Solution: $exact_value, Error: $error")
end


