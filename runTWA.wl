(* ::Package:: *)

(* ::Section:: *)
(*All*)


(* ::Subsubsection:: *)
(*setup*)


SetDirectory[Directory[]<>"/fermTWAcode"];


<<2dfuncs.wl


<<dynfunc.wl


<<const2d.wl


<<runfuncs.wl


t1=Timing[<<2deqns.wl];


<<2dinits.wl


(* ::Subsection:: *)
(*run TWA*)


t2=Timing[results=TWAresults;];


fnums=results[[1]]\[Transpose];


intCoh=results[[2]]\[Transpose];


mmu=MaxMemoryUsed[]/10.^6;


SetDirectory[ParentDirectory[]];


Save["fermTWAres.dat",{mmu,t1,t2,fnums,intCoh}];
