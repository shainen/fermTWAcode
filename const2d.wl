(* ::Package:: *)

tmax=50;
steps=500;
times=Range[0,tmax,tmax/(steps-1)];


runs=10;


length=3;


sites=length^2;


coh = Table[0,{sites}];


occupied={1,2,3,4,7,10,11,12,13,16};


(*\[Omega][t_] := -20(1-2E^(-t^2/tscale^2))*)


\[Omega][t_] := -1


g[t_] := 1


numbos = sites;


numferm = 2 sites;


numfvars=2numferm^2-numferm;
