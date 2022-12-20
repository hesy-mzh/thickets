kaijo1[n_?IntegerQ] := 
 Module[{ans = 1}, 
  If[n < 0, Print["Fudenai Seisu wo Nyuryokushitekudasai."], 
   If[n > 0, For[i = 1, i <= n, i = i + 1, ans = ans*i]];
   Print[ans];]]
