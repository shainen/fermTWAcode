(* ::Package:: *)

(* ::Subsection:: *)
(*rands arbitrary*)


(* ::Subsubsection:: *)
(*Fock state init*)


(* ::Input:: *)
(*(*eferm[px_,py_]:=-2(Cos[2\[Pi] px/length]+Cos[2\[Pi] py/length])*)*)


(* ::Input:: *)
(*(*occupied=Flatten[Table[nfc[nn,#1,#2]&@@@Select[Tuples[Range[0,length-1],2],eferm@@#<0&],{nn,{0,1}}]]*)*)


(* ::Input:: *)
(*(*occupied=Range[2length^2]*)*)


there[x_]:=Length[Select[occupied,#==x&]]


meansxm=Table[Table[KroneckerDelta[ii,jj](2there[ii]-1),{jj,ii,numferm}],{ii,numferm}];
meansym=Table[Table[0,{jj,ii+1,numferm}],{ii,numferm}];
meansxu=Table[Table[0,{jj,ii+1,numferm}],{ii,numferm}];
meansyu=Table[Table[0,{jj,ii+1,numferm}],{ii,numferm}];


fmeans=Flatten[{meansxm,meansym,meansxu,meansyu}];


sdxm=Table[Table[0,{jj,ii,numferm}],{ii,numferm}];
sdym=Table[Table[0,{jj,ii+1,numferm}],{ii,numferm}];
sdxu=Table[Table[0,{jj,ii+1,numferm}],{ii,numferm}];
sdyu=Table[Table[0,{jj,ii+1,numferm}],{ii,numferm}];


fsd=Flatten[{sdxm,sdym,sdxu,sdyu}];


(* ::Subsubsection:: *)
(*make rands*)


randominitialsbh=Table[Table[RandomVariate[NormalDistribution[0,1/2]]+I RandomVariate[NormalDistribution[0,1/2]],{numbos}],{runs}];


randxm=Table[Table[0,{jj,1,ii-1},{runs}]~Join~Table[If[sdxm[[ii,jj-ii+1]]!=0,
RandomVariate[NormalDistribution[meansxm[[ii,jj-ii+1]],sdxm[[ii,jj-ii+1]]]],meansxm[[ii,jj-ii+1]]],{jj,ii,numferm},{runs}],{ii,numferm}];
randxm=randxm+randxm\[Transpose]-Table[Table[0,{runs}]+KroneckerDelta[ii,jj]Diagonal[randxm][[ii]],{ii,numferm},{jj,numferm}];


randym=Table[Table[0,{jj,1,ii},{runs}]~Join~Table[If[sdym[[ii,jj-ii]]!=0,
RandomVariate[NormalDistribution[meansym[[ii,jj-ii]],sdym[[ii,jj-ii]]]],meansym[[ii,jj-ii]]],{jj,ii+1,numferm},{runs}],{ii,numferm}];
randym=randym-randym\[Transpose];


randxu=Table[Table[0,{jj,1,ii},{runs}]~Join~Table[If[sdxu[[ii,jj-ii]]!=0,
RandomVariate[NormalDistribution[meansxu[[ii,jj-ii]],sdxu[[ii,jj-ii]]]],meansxu[[ii,jj-ii]]],{jj,ii+1,numferm},{runs}],{ii,numferm}];
randxu=randxu-randxu\[Transpose];


randyu=Table[Table[0,{jj,1,ii},{runs}]~Join~Table[If[sdyu[[ii,jj-ii]]!=0,
RandomVariate[NormalDistribution[meansyu[[ii,jj-ii]],sdyu[[ii,jj-ii]]]],meansyu[[ii,jj-ii]]],{jj,ii+1,numferm},{runs}],{ii,numferm}];
randyu=randyu-randyu\[Transpose];


(* ::Subsubsection:: *)
(*Em*)


randem=(randxm-I randym)/2;


randemjjkk=fermsbyfermstosxy1sxy2[randem];


randemxxyy=fou2d[randemjjkk,Fourier,InverseFourier];


randxmxxyy=makeX[randemxxyy];


randymxxyy=makeY[randemxxyy];


randxmp=Flatten[Table[Table[randxmxxyy[[#1,#2,#3,#4,#5,#6]]&@@(cfneither[ii]+1)~Join~(cfneither[jj]+1),{jj,ii,numferm}],{ii,numferm}],1];


randymp=Flatten[Table[Table[randymxxyy[[#1,#2,#3,#4,#5,#6]]&@@(cfneither[ii]+1)~Join~(cfneither[jj]+1),{jj,ii+1,numferm}],{ii,numferm}],1];


(* ::Subsubsection:: *)
(*Eu,Ed*)


randeu=(randxu-I randyu)/2;


randeujjkk=fermsbyfermstosxy1sxy2[randeu];


randeuxxyy=fou2d[randeujjkk,Fourier,Fourier];


randxuxxyy=makeX[randeuxxyy];


randyuxxyy=makeY[randeuxxyy];


randxup=Flatten[Table[Table[randxuxxyy[[#1,#2,#3,#4,#5,#6]]&@@(cfneither[ii]+1)~Join~(cfneither[jj]+1),{jj,ii+1,numferm}],{ii,numferm}],1];


randyup=Flatten[Table[Table[randyuxxyy[[#1,#2,#3,#4,#5,#6]]&@@(cfneither[ii]+1)~Join~(cfneither[jj]+1),{jj,ii+1,numferm}],{ii,numferm}],1];


(* ::Subsubsection:: *)
(*Put together*)


randominitialsf=Flatten[{randxmp,randymp,randxup,randyup},1]\[Transpose];


randominitials=Transpose[{randominitialsf,randominitialsbh}];
