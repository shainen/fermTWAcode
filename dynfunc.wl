(* ::Package:: *)

vxm[xx_,yy_]:=If[yy<xx,xm[yy,xx][t],xm[xx,yy][t]]
vym[xx_,yy_]:=Which[yy==xx,0,yy<xx,-ym[yy,xx][t],True,ym[xx,yy][t]]
vxu[xx_,yy_]:=Which[yy==xx,0,yy<xx,-xu[yy,xx][t],True,xu[xx,yy][t]]
vyu[xx_,yy_]:=Which[yy==xx,0,yy<xx,-yu[yy,xx][t],True,yu[xx,yy][t]]


around[ss_] := nfc[cfneither[ss] + #] & /@ {{0, 0, 1}, {0, 0, -1}, {0, 1, 0}, {0, -1, 0}}


otherspin[ff_]:=Mod[ff+sites,numferm,1]


aroundboth[ff1_,ff2_]:=DeleteDuplicates[Flatten[{around[#],otherspin[#]}&/@{ff1,ff2}]]


dot[ham_,a_,b_,der_,res_,sign_?VectorQ]:=Sum[D[ham,der[b,d][t]](-1)^sign[[1]]res[a,d]+D[ham,der[a,d][t]](-1)^sign[[3]] res[b,d],{d,aroundboth[a,b]}]+Sum[D[ham,der[g,b][t]](-1)^sign[[2]]res[a,g]+D[ham,der[g,a][t]](-1)^sign[[4]] res[b,g],{g,aroundboth[a,b]}]


xmdot[ham_,a_,b_]:=dot[ham,a,b,xm,vym,{1,1,1,1}]+dot[ham,a,b,ym,vxm,{0,1,0,1}]+dot[ham,a,b,xu,vyu,{1,0,1,0}]+dot[ham,a,b,yu,vxu,{0,1,0,1}]


ymdot[ham_,a_,b_]:=dot[ham,a,b,ym,vym,{0,0,1,1}]+dot[ham,a,b,xm,vxm,{0,0,1,1}]+dot[ham,a,b,xu,vxu,{0,1,1,0}]+dot[ham,a,b,yu,vyu,{0,1,1,0}]


xudot[ham_,a_,b_]:=dot[ham,a,b,xm,vyu,{0,0,1,1}]+dot[ham,a,b,ym,vxu,{0,1,1,0}]+dot[ham,a,b,xu,vym,{0,1,1,0}]+dot[ham,a,b,yu,vxm,{0,1,1,0}]


yudot[ham_,a_,b_]:=dot[ham,a,b,xm,vxu,{1,1,0,0}]+dot[ham,a,b,ym,vyu,{0,1,1,0}]+dot[ham,a,b,yu,vym,{0,1,1,0}]+dot[ham,a,b,xu,vxm,{1,0,0,1}]


bdot[bv_,ham_]:=bv'[t]==-I D[ham,bv[t]\[Conjugate]]


alldot[ham_] := {Table[Table[xm[ii, jj]'[t] == xmdot[ham, ii, jj], {jj, ii, numferm}], {ii, numferm}], Table[Table[ym[ii, jj]'[t] == ymdot[ham, ii, jj], {jj, ii + 1, numferm}], {ii, numferm}], Table[Table[xu[ii, jj]'[t] == xudot[ham, ii, jj], {jj, ii + 1, numferm}], {ii, numferm}], Table[Table[yu[ii, jj]'[t] == yudot[ham, ii, jj], {jj, ii + 1, numferm}], {ii, numferm}]}
