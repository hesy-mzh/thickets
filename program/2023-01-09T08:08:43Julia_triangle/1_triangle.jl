# 面積を求める関数(ヘロンの公式)
function area_triangle(a,b,c)
    if a+b>c && b+c>a && c+a>b
        s=(a+b+c)/2
        return sqrt(s*(s-a)*(s-b)*(s-c))
    else
        return "nothing"
    end
end

println("1,2,3 : ", area_triangle(1,2,3))
println("3,4,5 : ", area_triangle(3,4,5))
