(* ::Package:: *)

tscale=0.2;


tmax=1;
steps=500;
times=Range[0,tmax,tmax/(steps-1)];


runs=100;


length=3;


sites=length^2;


coh = Table[0,{sites}];


occupied={1,2,3,4,7,10,11,12,13,16};


(*\[Omega][t_] := -20(1-2E^(-t^2/tscale^2))*)


finMu=10;


\[Omega][t_]:=-finMu(1-2E^(-t^2/tscale^2))


\[Omega][t_]:=-finMu


g[t_]:=20(1-E^(-t^2/tscale^2))


g[t_]:=20 Piecewise[{{(1-Cos[\[Pi] t/tscale/2])/2,t<2 tscale},{1,t>=2 tscale}}]


(*g[t_]:=10*)


numbos = sites;


numferm = 2 sites;


numfvars=2numferm^2-numferm;
