(* ::Package:: *)

tmax=50;
steps=500;
times=Range[0,tmax,tmax/(steps-1)];


runs=1000;


length=2;


coh = {Sqrt[9],Sqrt[9]};


occupied={};


\[Omega][t_] := -1;


g[t_] := 1/3;


numbos = length;


numferm = 2 length;


numfvars=2numferm^2-numferm;
