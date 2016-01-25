(* ::Package:: *)

tmax=50;
steps=500;
times=Range[0,tmax,tmax/(steps-1)];


runs=100;


length=2;


coh = {0,0};


occupied={1,3};


\[Omega][t_] := -1;


g[t_] := 1;


numbos = length;


numferm = 2 length;


numfvars=2numferm^2-numferm;
