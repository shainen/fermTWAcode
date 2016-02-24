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


<<2dinitsFermMF.wl


(* ::Subsection:: *)
(*run TWA*)


Dynamic[rr]


Timing[fnums=(TWAresults+1)/2;]


mmu=MaxMemoryUsed[]/10.^6


(*SetDirectory[ParentDirectory[]];*)


(*Save["4site.dat",{mmu,TWASingle,TWABi}];*)
