(* ::Package:: *)

(* ::Subsection:: *)
(*hamiltonian*)


bvars=Table[bh[nn],{nn,length}];


fvars=Flatten[{Table[Table[xm[ii,jj],{jj,ii,numferm}],{ii,numferm}],Table[Table[ym[ii,jj],{jj,ii+1,numferm}],{ii,numferm}],Table[Table[xu[ii,jj],{jj,ii+1,numferm}],{ii,numferm}],Table[Table[yu[ii,jj],{jj,ii+1,numferm}],{ii,numferm}]}];


vars=bvars~Join~fvars;


hamkinb=Total[(bh[#][t]\[Conjugate]bh[#][t]-1/2)&/@{1,2}];


hamkinf=Total[-vxm[#1,#2]&@@@{{1,2},{3,4}}];


hamint=Total[-1/2((-vxu[#1,#2]-I vyu[#1,#2])bh[#3][t]\[Conjugate]+(-vxu[#1,#2]+I vyu[#1,#2])bh[#3][t])&@@@{{1,3,1},{2,4,2}}];


hamtot=\[Omega][t]hamkinb+hamkinf+g[t]hamint;


beqns=Table[bdot[bh[nn],hamtot],{nn,length}];


Timing[feqns=alldot[hamtot];]


TWAeqns=Flatten[{beqns,feqns}];
