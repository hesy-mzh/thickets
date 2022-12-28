
move[z]:=(p={{0,0},{0,1}};p[[1]])
move[f]:=(p[[1]]=p[[1]]+p[[2]];p[[1]])
kaiten[th_]:=p[[2]]={{Cos[th],Sin[th},{-Sin[th],Cos[th]}.p[[2]]
move[r]:=(kaiten[2Pi/3];p[[1]])
move[l]:=(kaiten[-2Pi/3];p[[1]])

move[y]:=p[[1]]

Attributes[move]=Listable


plot2=[t_]:=ListPlot[N[t], Joined->True, Axes->False, AspectRatio->1, PlotRange->All]

t={z,f,y,f,r,f,f,r,f,f}

rule3:={f->{f,f},y->{r,f,y,f,l,f,y,f,l,f,y,f,r}}

s2=t/.rule3

plot2[move[Flatten[s2]]]

