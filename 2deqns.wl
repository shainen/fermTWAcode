(* ::Package:: *)

(* ::Subsection:: *)
(*hamiltonian*)


bvars=Table[bh[nn],{nn,sites}];


fvars=Flatten[{Table[Table[xm[ii,jj],{jj,ii,numferm}],{ii,numferm}],Table[Table[ym[ii,jj],{jj,ii+1,numferm}],{ii,numferm}],Table[Table[xu[ii,jj],{jj,ii+1,numferm}],{ii,numferm}],Table[Table[yu[ii,jj],{jj,ii+1,numferm}],{ii,numferm}]}];


vars=bvars~Join~fvars;


bonds=Flatten[{{#,nfc[cfneither[#]+{0,0,1}]},{#,nfc[cfneither[#]+{0,1,0}]}}&/@Range[numferm],1];


hamkinbF[bb_]:=bh[bb][t]\[Conjugate]bh[bb][t]-1/2


hamkinfF[ff1_,ff2_]:=Total[DeleteDuplicates[(-vxm[ff1,#]&/@around[ff1])~Join~(-vxm[ff2,#]&/@around[ff2])]]


hamintF[ff1_,ff2_]:=Total[DeleteDuplicates[-1/2((-vxu[Mod[#,sites,1],Mod[#,sites,1]+sites]-I vyu[Mod[#,sites,1],Mod[#,sites,1]+sites])bh[Mod[#,sites,1]][t]\[Conjugate]+(-vxu[Mod[#,sites,1],Mod[#,sites,1]+sites]+I vyu[Mod[#,sites,1],Mod[#,sites,1]+sites])bh[Mod[#,sites,1]][t])&/@{ff1,ff2}]]


hamtotfF[ff1_,ff2_]:=hamkinfF[ff1,ff2]+g[t]hamintF[ff1,ff2]


hamtotbF[ss_]:=\[Omega][t]hamkinbF[ss]+g[t]hamintF[ss,ss]


beqns=Table[bdot[bh[nn],hamtotbF[nn]],{nn,numbos}];


feqns = {Table[Table[xm[ii, jj]'[t] == xmdot[hamtotfF[ii,jj] , ii, jj], {jj, ii, numferm}], {ii, numferm}], Table[Table[ym[ii, jj]'[t] == ymdot[hamtotfF[ii,jj] , ii, jj], {jj, ii + 1, numferm}], {ii, numferm}], Table[Table[xu[ii, jj]'[t] == xudot[hamtotfF[ii,jj], ii, jj], {jj, ii + 1, numferm}], {ii, numferm}], Table[Table[yu[ii, jj]'[t] == yudot[hamtotfF[ii,jj] , ii, jj], {jj, ii + 1, numferm}], {ii, numferm}]};


TWAeqns=Flatten[{beqns,feqns}];
