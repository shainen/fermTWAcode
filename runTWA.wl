(* ::Package:: *)

(* ::Section:: *)
(*All*)


(* ::Subsubsection:: *)
(*setup*)


SetDirectory[Directory[]<>"/fermTWAcode"];


<<const.wl


<<dynfunc.wl


<<2dfuncs.wl


<<runfuncs.wl


<<2siteeqns.wl


<<inits.wl


(* ::Subsection:: *)
(*run TWA*)


fnums=(TWAresults+1)/2;


mmu=MaxMemoryUsed[]/10.^6;


SetDirectory[ParentDirectory[]];


Save["fermTWAres.dat",{mmu,fnums}];
