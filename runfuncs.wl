(* ::Package:: *)

singleRun=Function[{startEq,newInits},
Block[{newstate=First@NDSolve`Reinitialize[start,newInits],sol},
NDSolve`Iterate[newstate,tmax];
sol=NDSolve`ProcessSolutions[newstate][[All,2]];
values=(Outer[Through[#1[#2]]&,sol,times,1]);
{(values[[1]]+1)/2,1/2 (-Conjugate[values[[2]]] (-values[[3]]-I values[[4]])-values[[2]] (-values[[3]]+I values[[4]]))}]
];


initsToEqns[inits_]:=Table[bh[ii][0]==inits[[2,ii]],{ii,numbos}]~Join~Table[fvars[[ii]][0]==inits[[1,ii]],{ii,numfvars}]


observables={xm[#,#]&/@Range[numferm],bh[#]&/@Range[sites],xu[#,#+sites]&/@Range[sites],yu[#,#+sites]&/@Range[sites]};


TWAresults:=(
start=First@NDSolve`ProcessEquations[Flatten[{TWAeqns,initsToEqns[randominitials[[1]]]}],observables,{t,0,tmax},Method->{"EquationSimplification"->"Solve"}];
fullTWA=0;
Table[AddTo[fullTWA,singleRun[start,Flatten[initsToEqns[randominitials[[rr]]]]]/runs];,{rr,runs}];
Chop[fullTWA]
)
