(* ::Package:: *)

(*tscale=10;*)


tmax=50;
steps=500;
times=Range[0,tmax,tmax/(steps-1)];


runs=100;


length=2;


coh = {3,3};


occupied={1,3};


(*\[Omega][t_] := -20(1-2\[ExponentialE]^(-t^2/tscale^2))*)


\[Omega][t_] := -1


g[t_] := 1/3


numbos = length;


numferm = 2 length;


numfvars=2numferm^2-numferm;
