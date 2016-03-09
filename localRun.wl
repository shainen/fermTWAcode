(* ::Package:: *)

(* ::Section:: *)
(*All*)


(* ::Subsubsection:: *)
(*setup*)


SetDirectory[NotebookDirectory[]]


<<const.wl


<<dynfunc.wl


<<runfuncs.wl


<<2siteeqns.wl


<<inits.wl


(* ::Subsection:: *)
(*run TWA*)


Dynamic[rr]


Timing[results=TWAresults;]


fnums=results[[1]]\[Transpose];


intCoh=results[[2]]\[Transpose];


mmu=MaxMemoryUsed[]/10.^6


(*SetDirectory[ParentDirectory[]];*)


(*Save["4site.dat",{mmu,TWASingle,TWABi}];*)
