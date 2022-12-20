
move[z]:=(p={{0,0},{0,1}};p[[1]])
move[f]:=(p[[1]]=p[[1]]+p[[2]];p[[1]])
kaiten[th_]:=p[[2]]={{Cos[th],Sin[th},{-Sin[th],Cos[th]}.p[[2]]
move[r]:=(kaiten[Pi/3];p[[1]])
move[l]:=(kaiten[-Pi/3];p[[1]])

Attributes[move]=Listable



plot2=[t_]:=ListPlot[N[t], Joined->True, Axes->False, AspectRatio->1, PlotRange->All]

s={z,f,r,r,f,r,r,f}

rule2:={f->{f,l,f,r,r,f,l,f}}

s2=s/.rule2

plot2[move[Flatten[s2]]]

