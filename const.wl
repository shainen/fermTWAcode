(* ::Package:: *)

tscale=20;


tmax=4 tscale;
steps=500;
times=Range[0,tmax,tmax/(steps-1)];


runs=10;


length=2;


coh = {0,0};


occupied={2,4};


\[Omega][t_] := -20(1-2E^(-t^2/tscale^2))


(*\[Omega][t_] := -1*)


g[t_] := 1


numbos = length;


numferm = 2 length;


numfvars=2numferm^2-numferm;
