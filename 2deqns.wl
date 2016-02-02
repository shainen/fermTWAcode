(* ::Package:: *)

(* ::Subsection:: *)
(*hamiltonian*)


bvars=Table[bh[nn],{nn,sites}];


fvars=Flatten[{Table[Table[xm[ii,jj],{jj,ii,numferm}],{ii,numferm}],Table[Table[ym[ii,jj],{jj,ii+1,numferm}],{ii,numferm}],Table[Table[xu[ii,jj],{jj,ii+1,numferm}],{ii,numferm}],Table[Table[yu[ii,jj],{jj,ii+1,numferm}],{ii,numferm}]}];


vars=bvars~Join~fvars;


bonds=Flatten[{{#,nfc[cfneither[#]+{0,1}]},{#,nfc[cfneither[#]+{1,0}]},{#,nfc[cfneither[#]+{0,1}]}+{sites,sites},{#,nfc[cfneither[#]+{1,0}]}+{sites,sites}}&/@Range[sites],1];


hamkinb=Total[(bh[#][t]\[Conjugate]bh[#][t]-1/2)&/@Range[sites]];


hamkinf=Total[-vxm[#1,#2]&@@@bonds];


hamint=Total[-1/2((-vxu[#1,#2]-I vyu[#1,#2])bh[#3][t]\[Conjugate]+(-vxu[#1,#2]+I vyu[#1,#2])bh[#3][t])&@@@({#,#+sites,#}&/@Range[sites])];


hamtot=\[Omega][t]hamkinb+hamkinf+g[t]hamint;


beqns=Table[bdot[bh[nn],hamtot],{nn,numbos}];


Timing[feqns=alldot[hamtot];]


TWAeqns=Flatten[{beqns,feqns}];
