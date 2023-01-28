
t=var("t")
ex_cc(t)=vector([cos(t),sin(t)])
print(ex_cc(pi/3))

w=CC(1/2, 1/2*sqrt(3))

print(w)
print(w^2)
print(w^3)


print("++++ ++++ 1 ++++ ++++")
a1 = (w-w^3)*(w-w^5)
print( a1, "3*w^2", 3*w^2 )
l1 = (w-1)^2
print( l1, "w^4", w^4)
res1=2*(pi)/3*I/a1
print(res1)

print("++++ ++++ 2 ++++ ++++")
a2= (w^3-w)*(w^3-w^5)
print( a2, "3*w^0", 3*w^0 )
l2=(w^3-1)^2
print( l2, "4", 4)

print("++++ ++++ 3 ++++ ++++")
a3=(w^5-w)*(w^5-w^3)
print( a3, "3*w^4", 3*w^4 )
l3=(w^5-1)^2
print( l3, "w^2", w^2)

print("===== ===== ===== =====")
print(-2*w+3+4*w^2)

