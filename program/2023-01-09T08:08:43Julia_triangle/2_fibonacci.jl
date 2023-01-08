# フィボナッチ数列
function fib(n)
    # 初期値
    a=0; b=1
    for i in 2:n
        # 漸化式
        c=a+b
        # 出力
        println("a_",i," = ",c)
        # 初期値変更
        a=b; b=c
    end
end

fib(10)
