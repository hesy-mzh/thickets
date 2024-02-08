
# 複合台形公式
function comp_trapezoidal_rule(f,a,b, N)
    h = (b-a)/N
    return h/2*sum(f(a + (i-1)*h) + f(a + i*h) for i in 1:N)
end

f(x) = sin(x) # 被積分関数
a = 0         # 区間始点
b = pi        # 区間終点
N = 80        # 分割数


@show I = comp_trapezoidal_rule(f,a,b,N)

# 誤差表示
@show  1-I

