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


<<inits.wl


(* ::Subsection:: *)
(*run TWA*)


fnums=(TWAresults+1)/2;


mmu=MaxMemoryUsed[]/10.^6;


SetDirectory[ParentDirectory[]];


Save["fermTWAres.dat",{mmu,fnums}];
