(* ::Package:: *)

(* ::Section:: *)
(*All*)


(* ::Subsubsection:: *)
(*setup*)


SetDirectory[Directory[]<>"/fermTWAcode"];


<<const2d.wl


<<dynfunc.wl


<<2dfuncs.wl


<<runfuncs.wl


<<2deqns.wl


<<2dinits.wl


(* ::Subsection:: *)
(*run TWA*)


results=TWAresults;


fnums=results[[1]]\[Transpose];


intCoh=results[[2]]\[Transpose];


mmu=MaxMemoryUsed[]/10.^6;


SetDirectory[ParentDirectory[]];


Save["fermTWAres.dat",{mmu,fnums,intCoh}];
