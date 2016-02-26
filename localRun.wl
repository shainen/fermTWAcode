(* ::Package:: *)

(* ::Section:: *)
(*All*)


(* ::Subsubsection:: *)
(*setup*)


SetDirectory[NotebookDirectory[]]


<<const2d.wl


<<dynfunc.wl


<<2dfuncs.wl


<<runfuncs.wl


Timing[<<2deqns.wl]


<<2dinits.wl


(* ::Subsection:: *)
(*run TWA*)


Dynamic[rr]


Timing[results=TWAresults;]


fnums=results[[1]]\[Transpose];


intCoh=results[[2]]\[Transpose];


mmu=MaxMemoryUsed[]/10.^6


(*SetDirectory[ParentDirectory[]];*)


(*Save["4site.dat",{mmu,TWASingle,TWABi}];*)
