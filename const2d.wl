(* ::Package:: *)

tscale=10;


tmax=4 tscale;
steps=500;
times=Range[0,tmax,tmax/(steps-1)];


runs=10;


length=3;


sites=length^2;


coh = Table[0,{sites}];


occupied={1,2,3,4,7,10,11,12,13,16};


(*\[Omega][t_] := -20(1-2E^(-t^2/tscale^2))*)


finMu=10;


\[Omega][t_]:=-finMu(1-2E^(-t^2/tscale^2))


g[t_]:=(1-E^(-t^2/tscale^2))


numbos = sites;


numferm = 2 sites;


numfvars=2numferm^2-numferm;
