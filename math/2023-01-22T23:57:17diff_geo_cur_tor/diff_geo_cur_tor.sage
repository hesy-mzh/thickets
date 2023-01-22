
# 変数 t の定義
t = var('t')
# ベクトルx(t)の定義
x(t) = vector([exp(t),exp(-t),sqrt(2)*t])

# 1の解答
pro1=diff(x(t),t)
print("1 : ", pro1)

# 2の解答
pro2=expand(pro1.norm()).simplify_full()
print("2 : ", pro2)
# 2 の簡略化した式
pro2a = (sqrt( (e^(4*t) + 2*e^(2*t) + 1).factor() )*e^(-t)).simplify()
print("2a : ", pro2a)

# 3の解答
pro3 = pro1/pro2
print("3 : ", pro3)
# ベクトルe1 の定義
e1=pro3

# 4の解答
pro4 = diff(pro3,t).simplify_full()
print("4 : ", pro4)

# 5の解答
pro5 = (pro4/pro2).simplify()
print("5 : ", pro5)

# 6の解答
pro6 = pro5.norm().simplify_full()
print("6 : ", pro6)
# 曲率kappa 定義
kappa = pro6
# 6 の簡略化した式
pro6a = sqrt(2)*e^(2*t)/(sqrt((e^(8*t) + 4*e^(6*t) + 6*e^(4*t) + 4*e^(2*t) + 1).factor())).simplify()
print("6a : ", pro6a)

#print(vector([2,2,sqrt(2)*(-e^(t)+e^(-t))]))
#print(vector([2,2,sqrt(2)*(-e^(t)+e^(-t))]).norm().expand().simplify_full())

# ベクトルe2 の定義
e2=pro5/pro6
#print(e2)

# 7の解答
pro7 =pro3.cross_product(e2)
print("7 : ", pro7.simplify_full())
# ベクトルe3 の定義
e3=pro7
# 7 の簡略化した式
pro7a=vector([
    (-sqrt((e^(4*t) + 2*e^(2*t) + 1).factor())).simplify() / (sqrt((e^(8*t) + 4*e^(6*t) + 6*e^(4*t) + 4*e^(2*t) + 1).factor())).simplify(),
    (sqrt((e^(4*t) + 2*e^(2*t) + 1).factor())).simplify() *e^(2*t) / (sqrt((e^(8*t) + 4*e^(6*t) + 6*e^(4*t) + 4*e^(2*t) + 1).factor())).simplify(),
    sqrt(2)* (sqrt((e^(4*t) + 2*e^(2*t) + 1).factor())).simplify() *e^t / (sqrt((e^(8*t) + 4*e^(6*t) + 6*e^(4*t) + 4*e^(2*t) + 1).factor())).simplify()
])
print("7a : ", pro7a)

# 8の解答
pro8=diff(pro7,t).simplify_full()
print("8 : ", pro8)

pro8a=vector([
    2* (sqrt((e^(8*t) + 4*e^(6*t) + 6*e^(4*t) + 4*e^(2*t) + 1).factor())).simplify() * (sqrt((e^(4*t) + 2*e^(2*t) + 1).factor())).simplify() *e^(2*t) / (e^(10*t) + 5*e^(8*t) + 10*e^(6*t) + 10*e^(4*t) + 5*e^(2*t) + 1).factor(),
    2* (sqrt((e^(8*t) + 4*e^(6*t) + 6*e^(4*t) + 4*e^(2*t) + 1).factor())).simplify() *e^(2*t) / ( (e^(6*t) + 3*e^(4*t) + 3*e^(2*t) + 1).factor() * (sqrt((e^(4*t) + 2*e^(2*t) + 1).factor())).simplify() ),
    -(sqrt(2)*e^(3*t) - sqrt(2)*e^t) * (sqrt((e^(8*t) + 4*e^(6*t) + 6*e^(4*t) + 4*e^(2*t) + 1).factor())).simplify() * (sqrt((e^(4*t) + 2*e^(2*t) + 1).factor())).simplify() / (e^(10*t) + 5*e^(8*t) + 10*e^(6*t) + 10*e^(4*t) + 5*e^(2*t) + 1).factor()
])
print("8a : ", pro8a)

# 9の解答
pro9 = -(pro8/pro2).norm().simplify_full()
print("9 : ", pro9)

