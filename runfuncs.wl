(* ::Package:: *)

singleRun=Function[{startEq,newInits},
Block[{newstate=First@NDSolve`Reinitialize[start,newInits],sol},
NDSolve`Iterate[newstate,tmax];
sol=NDSolve`ProcessSolutions[newstate][[All,2]];
(Through[sol[#]]&/@times)\[Transpose]
]
];


initsToEqns[inits_]:=Table[bh[ii][0]==inits[[2,ii]],{ii,numbos}]~Join~Table[fvars[[ii]][0]==inits[[1,ii]],{ii,numfvars}]


TWAresults:=(
start=First@NDSolve`ProcessEquations[Flatten[{TWAeqns,initsToEqns[randominitials[[1]]]}],xm[#,#]&/@Range[numferm],{t,0,tmax}];
fullTWA=0;
Table[AddTo[fullTWA,singleRun[start,Flatten[initsToEqns[randominitials[[rr]]]]]/runs];,{rr,runs}];
Chop[fullTWA]
)
