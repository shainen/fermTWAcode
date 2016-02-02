(* ::Package:: *)

(* ::Subsection:: *)
(*rands arbitrary*)


(* ::Subsubsection:: *)
(*Fock state init*)


there[x_]:=Length[Select[occupied,#==x&]]


meansxm=Table[Table[KroneckerDelta[ii,jj](2there[ii]-1),{jj,ii,numferm}],{ii,numferm}];
meansym=Table[Table[0,{jj,ii+1,numferm}],{ii,numferm}];
meansxu=Table[Table[0,{jj,ii+1,numferm}],{ii,numferm}];
meansyu=Table[Table[0,{jj,ii+1,numferm}],{ii,numferm}];


fmeans=Flatten[{meansxm,meansym,meansxu,meansyu}];


sdxm=Table[Table[(1-KroneckerDelta[ii,jj])(there[ii]+there[jj]-2there[ii]there[jj]),{jj,ii,numferm}],{ii,numferm}];
sdym=Table[Table[there[ii]+there[jj]-2there[ii]there[jj],{jj,ii+1,numferm}],{ii,numferm}];
sdxu=Table[Table[2there[ii]there[jj]-there[ii]-there[jj]+1,{jj,ii+1,numferm}],{ii,numferm}];
sdyu=Table[Table[2there[ii]there[jj]-there[ii]-there[jj]+1,{jj,ii+1,numferm}],{ii,numferm}];


sdxm=Table[Table[0,{jj,ii,numferm}],{ii,numferm}];
sdym=Table[Table[0,{jj,ii+1,numferm}],{ii,numferm}];
sdxu=Table[Table[0,{jj,ii+1,numferm}],{ii,numferm}];
sdyu=Table[Table[0,{jj,ii+1,numferm}],{ii,numferm}];


fsd=Flatten[{sdxm,sdym,sdxu,sdyu}];


(* ::Subsubsection:: *)
(*make rands*)


randominitialsbh=Table[Table[RandomVariate[NormalDistribution[coh[[n]],1/2]]+I RandomVariate[NormalDistribution[0,1/2]],{n,numbos}],{runs}];


(*randominitialsbh=Table[Table[0,{numbos}],{runs}];*)


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


randemjjkk=fermsbyfermstos1p1s2p2[randem];


randemxxyy=fou1d[randemjjkk,Fourier,InverseFourier];


randxmxxyy=makeX[randemxxyy];


randymxxyy=makeY[randemxxyy];


randxmp=Flatten[Table[Table[randxmxxyy[[#1,#2,#3,#4]]&@@(cfneither[ii]+1)~Join~(cfneither[jj]+1),{jj,ii,numferm}],{ii,numferm}],1];


randymp=Flatten[Table[Table[randymxxyy[[#1,#2,#3,#4]]&@@(cfneither[ii]+1)~Join~(cfneither[jj]+1),{jj,ii+1,numferm}],{ii,numferm}],1];


(* ::Subsubsection:: *)
(*Eu,Ed*)


randeu=(randxu-I randyu)/2;


randeujjkk=fermsbyfermstos1p1s2p2[randeu];


randeuxxyy=fou1d[randeujjkk,Fourier,Fourier];


randxuxxyy=makeX[randeuxxyy];


randyuxxyy=makeY[randeuxxyy];


randxup=Flatten[Table[Table[randxuxxyy[[#1,#2,#3,#4]]&@@(cfneither[ii]+1)~Join~(cfneither[jj]+1),{jj,ii+1,numferm}],{ii,numferm}],1];


randyup=Flatten[Table[Table[randyuxxyy[[#1,#2,#3,#4]]&@@(cfneither[ii]+1)~Join~(cfneither[jj]+1),{jj,ii+1,numferm}],{ii,numferm}],1];


(* ::Subsubsection:: *)
(*Put together*)


randominitialsf=Flatten[{randxmp,randymp,randxup,randyup},1]\[Transpose];


randominitials=Chop[Transpose[{randominitialsf,randominitialsbh}]];
