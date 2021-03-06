(* ::Package:: *)

tscale=10;


tmax=40;
steps=500;
times=Range[0,tmax,tmax/(steps-1)];


runs=100;


length=10;


sites=length^2;


coh = Table[0,{sites}];


fermenergy=Table[N[-2(Cos[2\[Pi] ii/length]+Cos[2\[Pi] jj/length])],{ii,0,length-1},{jj,0,length-1}];


occupied=Join[nfc/@(Position[fermenergy,_?Negative,2]-1),nfc/@(Position[fermenergy,0.,2]-1),nfc/@(Position[fermenergy,_?Negative,2]-1)+sites,nfc/@(Position[fermenergy,0.,2]-1)+sites];


(*occupied={1,2,3,4,7,10,11,12,13,16};*)


(*\[Omega][t_] := -20(1-2E^(-t^2/tscale^2))*)


finMu=10;


\[Omega][t_]:=-finMu(1-E^(-t^2/tscale^2))


(*\[Omega][t_]:=-finMu*)


g[t_]:=(1-E^(-t^2/tscale^2))


(*g[t_]:=20 Piecewise[{{(1-Cos[\[Pi] t/tscale/2])/2,t<2 tscale},{1,t\[GreaterEqual]2 tscale}}]*)


(*g[t_]:=10*)


numbos = sites;


numferm = 2 sites;


numfvars=2numferm^2-numferm;
