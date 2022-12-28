
move[z]:=(p={{0,0},{0,1}};p[[1]])
move[f]:=(p[[1]]=p[[1]]+p[[2]];p[[1]])
kaiten[th_]:=p[[2]]={{Cos[th],Sin[th},{-Sin[th],Cos[th]}.p[[2]]
move[r]:=(kaiten[Pi/2];p[[1]])
move[l]:=(kaiten[-Pi/2];p[[1]])

move[x]:=p[[1]]
move[y]:=p[[1]]

Attributes[move]=Listable


plot2=[t_]:=ListPlot[N[t], Joined->True, Axes->False, AspectRatio->1, PlotRange->All]

t={z,y}

rule4:={x->{r,y,f,l,x,f,x,l,f,y,r},y->{l,x,f,r,y,f,y,r,f,x,l}}

s2=t/.rule4

plot2[move[Flatten[s2]]]

