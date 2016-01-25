(* ::Package:: *)

(* ::Section:: *)
(*All*)


(* ::Subsubsection:: *)
(*setup*)


SetDirectory[NotebookDirectory[]]


<<const.wl


<<dynfunc.wl


<<2dfuncs.wl


<<runfuncs.wl


<<2siteeqns.wl


<<inits.wl


(* ::Subsection:: *)
(*run TWA*)


Dynamic[rr]


fnums=TWAresults;


mmu=MaxMemoryUsed[]/10.^6


(*SetDirectory[ParentDirectory[]];*)


(*Save["4site.dat",{mmu,TWASingle,TWABi}];*)
