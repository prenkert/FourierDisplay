(* ::Package:: *)

(* ::Subtitle:: *)
(*Public*)


BeginPackage["FourierPack`"];


(* ::Subsection:: *)
(*Function Definitions*)


Cn; ApproxFunction;
FFTShift; CnFFT; ApproxFFT;
MakeComplex;
MakeContinuous; CartesianToPolar;
ImageLinePoints; MakeTour; PrependIndices; UniformResample; 
L2Error;
EpicyclePlot; Spinner;SpinnerRow;StaticSpinner;


(* ::Subsection:: *)
(*Data Definitions*)


LineData


(* ::Subtitle:: *)
(*Private*)


Begin["`Private`"]


(* ::Section:: *)
(*Init*)


$baseDirectory = "G:\\My Drive\\Projects\\FourierDisplay\\Software";


hexToRGB[hex_]:=RGBColor@@(N[FromDigits[StringJoin[#],12]/255]&/@Partition[Characters[hex],2]);
$themeColors = hexToRGB/@{"023859","056C83","DDCCC2","CA431E","D86334"}


(* ::Section:: *)
(*Functions and Routines*)


(* ::Subsection:: *)
(*Fourier Series*)


Cn::usage=
	"Cn[data,n] Calculate the nth complex Fourier coefficient from discrete data";
Cn[data_, n_]:=1./Sqrt[Length[data]] Sum[data[[x]]*Exp[2. Pi I n x/Length[data]],{x,1,Length[data]}]


(*ApproxFunction::usage=
	"ApproxFunction[Cn,x,L,$N_Integer] Construct approximating function with coefficients given by Cn[n], variable x, length of data L, with terms from n=-$N to n=$N\n"<>
	"ApproxFunction[Cn,x,L,$N_List] Builds approximating function from n\[Element]$N";
ApproxFunction[Cn_,x_,L_, $N_Integer]:=1./Sqrt[L] Sum[Cn[n]Exp[-2.I*n*\[Pi]*x/L],{n,-$N,$N}];
ApproxFunction[Cn_,x_, L_, $N_List]:=1./Sqrt[L] Sum[Cn[n]Exp[-2.I*n*\[Pi]*x/L],{n,$N}];*)

ApproxFunction::usage=
	"ApproxFunction[Cn,x,L,$N_Integer] Construct approximating function with coefficients given by Cn[n], variable x, length of data L (Length@data), with terms from n=-$N to n=$N\n.  Returns <|'Coefficients'\[Rule]coefs, 'Radii'\[Rule]Abs/@coefs, 'Speeds'\[Rule]speeds, 'Terms'\[Rule]terms, 'Centers'\[Rule]centers, 'Function'\[Rule]function|>.  Use 'Scale'->length option to rescale period to length"<>
	"ApproxFunction[Cn,x,L,$N_List] Builds approximating function from n\[Element]$N";
Options[ApproxFunction] ={"Scale"->Default, "SortFunction"->Abs, "Sort"->False, "ForcedMagnitudes"->None};
ApproxFunction[Cn_,x_,L_, ($N_Integer|$N_List), OptionsPattern[]]:=Module[{nterms, coefs, speeds, terms, armends, centers, function},
	nterms = With[{nlist = If[Head@$N===Integer,Range[-$N,$N],$N]},If[OptionValue["Sort"],SortBy[nlist,OptionValue["SortFunction"]],nlist]];
	coefs = Table[1./Sqrt[L]*Cn[n],{n,nterms}]; (*May need to relocate the 1./Sqrt[L]*)
	With[{fmag = OptionValue["ForcedMagnitudes"]},
		If[fmag===None,Unevaluated@Sequence[],
			coefs = MapThread[(#1*Exp[I*Arg[#2]])&, {fmag,coefs}];
		]
	];		
	speeds = With[{Length = If[OptionValue["Scale"]===Default, L, OptionValue["Scale"]]},Table[2. n \[Pi] /Length, {n,nterms}]];
	terms = MapThread[(#1*Exp[-I*x*#2])&,{coefs,speeds}];
	armends = Accumulate@terms;
	centers = Drop[Prepend[armends,0],-1];
	function = Total@terms;
	Return[<|"Coefficients"->coefs, "Radii"->Abs/@coefs, "Speeds"->speeds, "Terms"->terms, "ArmEnds"->armends, "Centers"->centers, "Function"->function|>]];

(*ApproxFunction[{Cn_, Mags_List},x_,L_,($N_Integer|$N_List), OptionsPattern[]]:=Module[{nterms, coefs, speeds, terms, armends, centers, function},
	nterms = With[{nlist = If[Head@$N===Integer,Range[-$N,$N],$N]},If[OptionValue["Sort"],SortBy[nlist,OptionValue["SortFunction"]],nlist]];
	coefs = Table[1./Sqrt[L]*Cn[n],{n,nterms}]; (*May need to relocate the 1./Sqrt[L]*)
	coefs = MapThread[(#1*Exp[I*Arg[#2]])&, {Mags,coefs}];
	speeds = With[{Length = If[OptionValue["Scale"]===Default, L, OptionValue["Scale"]]},Table[2. n \[Pi] /Length, {n,nterms}]];
	terms = MapThread[(#1*Exp[-I*x*#2])&,{coefs,speeds}];
	armends = Accumulate@terms;
	centers = Drop[Prepend[armends,0],-1];
	function = Total@terms;
	Return[<|"Coefficients"->coefs, "Radii"->Abs/@coefs, "Speeds"->speeds, "Terms"->terms, "ArmEnds"->armends, "Centers"->centers, "Function"->function|>]];*)



(* ::Subsubsection:: *)
(*FFT*)


FFTShift::usage=
	"FFTShift[data, {Indices->False}] Center FFT data\n"<>
	"FFTShift[data, {Indices->True}] Append Indices to shifted FFT data";
Options[FFTShift] = {"k"->All, "Indices" ->False};
FFTShift[dat_?ArrayQ,OptionsPattern[]]:=
	Module[{dims=Dimensions[dat], fftshifted, index},
		fftshifted = RotateRight[dat,If[OptionValue["k"]===All,Quotient[dims,2],Quotient[dims[[OptionValue["k"]]],2] UnitVector[Length[dims],OptionValue["k"]]]];
		index = Table[n,{n,-Floor[dims[[1]]/2],If[EvenQ[dims[[1]]], Floor[ dims[[1]]/2]-1, Floor[dims[[1]]/2]]}];
		If[OptionValue["Indices"], Transpose[{index, fftshifted}], fftshifted]];


CnFFT::usage=
	"CnFFT[data, n] Calculates nth coefficient from complex Fourier coefficients data.  Data should be output from Fourier[].  Uses FFTShift with indices.
	CnFFT[data, SortFunc, N] sorts by SortFunc applied to {n,coeff}, i.e. SortBy[Abs@*Last]";
(*CnFFT[fftshifted_,n_]:=Module[{cn},
	cn = Last@SelectFirst[fftshifted, #[[1]]==n&]; (*May need to conjugate*)
	Return[cn]];*)
CnFFT[data_]:=Module[{fftshifted},
	fftshifted = FFTShift[Fourier[data],"Indices"->True];
	Function[{n},Last@SelectFirst[fftshifted, #[[1]]==n&]]];
CnFFT[data_,SortFunc_,N_]:=Module[{fftshifted, coefList},
	fftshifted = FFTShift[Fourier[data],"Indices"->True];
	coefList = First/@Take[SortFunc[fftshifted], N];
	Return[<|"CoefficientFunction"->Function[{n},Last@SelectFirst[fftshifted, #[[1]]==n&]], "CoefficientList"->coefList|>]];
CnFFT[data_, N_]:=Module[{fftshifted, coefList},
	fftshifted = FFTShift[Fourier[data],"Indices"->True];
	coefList = First/@TakeLargestBy[fftshifted,Abs@*Last, N];
	Return[<|"CoefficientFunction"->Function[{n},Last@SelectFirst[fftshifted, #[[1]]==n&]], "CoefficientList"->coefList|>]];


(*  -- DEPRICATED --  
ApproxFFT::usage =
	"ApproxFFT[data, ($N_List|$N_Integer), x_Symbol, 'Scaled'->True, 'ScaleFactor'->2\[Pi]] Calculates approximating series with FFT from list of pairs.  $N_Integer series from -$Nth coefficient to $Nth coefficient.  $N_List calculates terms from n in $N. Returns <|'Coefficients'\[Rule]coefs, 'Radii'\[Rule]Abs/@coefs, 'Speeds'\[Rule]speeds, 'Terms'\[Rule]terms, 'Centers'\[Rule]centers, 'Function'\[Rule]function|>."
Options[ApproxFFT] = {"Scaled"->False, "ScaleFactor"->(2\[Pi]), "SortFunc"->None};
ApproxFFT[data_, ($N_List|$N_Integer), x_Symbol, OptionsPattern[]]:=
	Module[{cn, coefs (*, sortFunc = OptionValue["SortFunc"]*)}, 
		coefs = FFTShift[Fourier[data],"Indices"->True];
		cn[i_]:=CnFFT[coefs,i];
		ApproxFunction[cn, If[OptionValue["Scaled"], x*(Length@data)/OptionValue["ScaleFactor"],x],Length@data, $N]]; *)


(* ::Subsection:: *)
(*Complex Coefficients*)


MakeComplex[pairs_List]:=(#1+I #2)& @@@ pairs;


(* ::Subsection:: *)
(*Real Coefficients*)


MakeContinuous::usage =
	"MakeContinuous[polarPoints_List, 'Sort'->True, 'EndPoints'->{0,2\[Pi]}] Takes list of polar coordinates, sorts if 'Sort', and adds mean of first and last point at the endpoints to make a continuous function when repeated";
Options[MakeContinuous] = {"Sort"->True, "EndPoints"->{0,2\[Pi]}};
MakeContinuous[polarPoints_List, OptionsPattern[]]:=Module[{contPoints},
	contPoints = If[OptionValue["Sort"],SortBy[polarPoints,First],polarPoints];
	PrependTo[contPoints,{First@OptionValue["GetPoints"],Mean[{contPoints[[1,2]],contPoints[[-1,2]]}]}];
	AppendTo[contPoints,{Last@OptionValue["GetPoints"],Mean[{contPoints[[1,2]],contPoints[[-1,2]]}]}];
	Return[contPoints]]


CartesianToPolar::usage=
	"CartesianToPolar[cartPoints_List, {'MakeContiuous'\[Rule]True}]Takes list of cartesian points cartPoints and converts them to a sorted list of polar coordinates shifted from {-\[Pi],\[Pi]} to {0,2\[Pi]}.  See MakeContinuous.";
Options[CartesianToPolar] = {"MakeContiuous"->True};
CartesianToPolar[cartPoints_List, OptionsPattern[]]:=Module[{polarPoints},
	polarPoints = SortBy[MapAt[Abs[#-Pi]&,(Reverse@*ToPolarCoordinates/@cartPoints),{All,1}], First];
	If[OptionValue["MakeContinuous"],Return[MakeContinuous[polarPoints,"Sort"->False]],Return[polarPoints]]]


(* ::Subsection:: *)
(*Sampling and Data*)


ImageLinePoints::usage = "ImageLinePoints[image] Returns {x,y} points of a continuous dark line on a continuous light background.";
ImageLinePoints[image_Image]:=Module[{processedImage, points},
processedImage = DeleteBorderComponents@Thinning@ColorNegate@Binarize@image;
points = N@PixelValuePositions[processedImage, White];
Return[points]];


MakeTour::usage = 
	"MakeTour[data, 'PrependIndices'\[Rule]True, 'StartFunction'->None] Takes list of points data and reorders using FindShortestTour.  'PrependIndices' prepends index to each point.  Scale index for data of length l by setting 'IndexScale'->l.  'StartFunction' is a pure function that finds the first point in the series.";
Options[MakeTour]={"StartFunction"->None, "CenterPoints"->True};
MakeTour[data_, opts:OptionsPattern[{FindShortestTour,MakeTour}]]:=Module[{startFunc = OptionValue["StartFunction"],sortedDat, tour, outPoints},
	sortedDat = If[startFunc===None,data,SortBy[data,startFunc]];
	tour = Last@FindShortestTour[data, FilterRules[{opts},Options[FindShortestTour]]];
	outPoints = With[{points = sortedDat[[tour]]},If[OptionValue["CenterPoints"],(#-Mean@points)&/@points,points]];
	
	Return[outPoints]];


PrependIndices::usage = 
	"PrependIndices[data, 'ParametrizationType'->'Linear', 'IndexStart'->0, 'IndexScale'->None] Parametrizes points in tour list 'data' by ParametrizationType.  Type='Linear' parametrizes by point, starting at 'IndexStart' for data of length 'IndexScale.'  Type='EuclidianDistance' parametrizes by distance along path.";
Options[PrependIndices] = {"ParametrizationType"->"Linear", "IndexStart"->0, "IndexScale"->None};
PrependIndices[data_List, OptionsPattern[]]:= Module[{type=OptionValue["ParametrizationType"],l=OptionValue["IndexScale"], start=OptionValue["IndexStart"]},
	 Switch[type,
		"Linear",
			With[{indices = If[l===None, Subdivide[start,Length@data-1+start,Length@data-1], Subdivide[start, l+start,Length@data-1]]},
				Return[Transpose[{indices, data}]]],
		"EuclidianDistance",
			With[{indices = Accumulate[Prepend[EuclideanDistance@@@Partition[data, 2,1],0]]},
				Return[DeleteDuplicatesBy[Transpose[{indices,data}],First]]]
		]];


UniformResample::usage = 
	"UniformResample[(points_List|points_InterpolatingFunction),n_} Takes points as List or InterpolatingFunction and samples closest exponent of 2 less than n points between 'EndPoints'.  'ParametrizationType'->'Linear' indexes each point from zero; 'Given' attaches indices from parametrization of 'points.'";
Options[UniformResample] = {"ParametrizationType"->"Linear"};
UniformResample[(points_List|points_InterpolatingFunction), n_, OptionsPattern[]]:= Module[{samplePoints, sampleDomain, samplePointsIndexed, order, pointsFunc, indices},
	order = Round@Chop[N[Log[n]/Log[2]]];
	pointsFunc = If[Head[points]===InterpolatingFunction, points, Interpolation[points, InterpolationOrder->1]];
	sampleDomain = If[Head[points]===InterpolatingFunction, Subdivide[First@points["Domain"][[1]],Last@points["Domain"][[1]],2^order-1], Subdivide[points[[1,1]],points[[-1,1]],2^order-1]];
	samplePoints = pointsFunc/@sampleDomain;
	indices = If[OptionValue["ParametrizationType"]=="Linear",Table[i,{i,0,Length@sampleDomain-1}],sampleDomain];
	Return[<|"SamplePoints"->samplePoints, "SamplePointsIndexed"->Transpose[{indices,samplePoints}],"InterpolatingFunction"->pointsFunc, "Length"->Last@indices|>]];


(* ::Subsection:: *)
(*Testing*)


SquaredPointDistance::usage="SquaredPointDistance[p1_, p2_, Type:('Cartesian'|'Polar')] calculates distance between points.  Use {\[Theta],r} for polar coordinates";
SquaredPointDistance[p1_, p2_, Type:("Cartesian"|"Polar")]:=
	Switch[Type,
		"Cartesian",
			Return[SquaredEuclideanDistance[p1,p2]],
		"Polar",
			Return[Last@p1^2+Last@p2^2-2Last@p1*Last@p2*Cos[First@p1-First@p2]]];

L2Error::usage=
	"L2Error[TruePoints_List,(ApproxFunc_InterpolatingFunction|TrueFunc_Symbol), ('Complex'|'Polar'|'Cartesian')] Computes Least Square error between true data points (x,y or \[Theta],r) and approximating function. 'Type' can be 'Complex', 'Polar', or 'Cartesian'.  Normalize option normalizes by number of points";
Options[L2Error] = {"Normalize" -> True};
L2Error[TruePoints_List,(ApproxFunc_InterpolatingFunction|ApproxFunc_Symbol|ApproxFunc_Function), Type:("Complex"|"Polar"|"Cartesian"), OptionsPattern[]]:=Module[{ApproxPoints, Distances, GrossL2, L2},
	ApproxPoints = Switch[Type,
		("Cartesian"|"Polar"),
			Table[ApproxFunc[i],{i,First/@TruePoints}],
		"Complex",
			{Re@#, Im@#}&/@Table[ApproxFunc[i],{i,First/@TruePoints}]];
	Distances = Switch[Type,
		("Cartesian"|"Complex"),
			MapThread[SquaredPointDistance[#1, #2,"Cartesian"]&,{Last/@TruePoints, ApproxPoints}],
		"Polar",
			MapThread[SquaredPointDistance[#1, #2,"Polar"]&,{Last/@TruePoints, ApproxPoints}]];
	GrossL2 = Total@Distances;
	L2 = If[OptionValue["Normalize"],GrossL2/(Length@TruePoints),GrossL2];
	
	Return[<|"L2Error"->L2, "ApproxPoints"->ApproxPoints, "Distances"->Distances|>];
	
	];


(* ::Subsection:: *)
(*Visualization*)


EpicyclePlot::usage = "EpicyclePlot[circlesObject, {t, a,b}, opts].  a=start time, b = current time, c = final time.CirclesObject output from ApproxFunction modified from https://mathematica.stackexchange.com/questions/100051/dynamic-epicycles";
Options[EpicyclePlot]={"Frames"->25, "ShowCircles"->True, "Movie"->False, "Spinners"->False, "PlotRange"->"Radii"};
EpicyclePlot[circlesObject_Association,{t_Symbol,a_,b_,c_}, opts:OptionsPattern[{EpicyclePlot,SpinnerRow,Spinner}]]:=Quiet[Module[{pp,fr,frn, plotGraphic,finalGraphic, centers,range,points, radii,$N},
	pp[time_] := If[(b-a)>0,ParametricPlot[ReIm@circlesObject["Function"], {t, a, time},Evaluated -> True, Axes -> None, PlotRange -> All],{}];
	centers[time_]:= ReIm[circlesObject["Centers"]/.(t->time)];
	points[time_]:= Prepend[ReIm[circlesObject["ArmEnds"]/.(t->time)],{0,0}];
	radii = circlesObject["Radii"];
	$N = Length@radii;
	range = Automatic;
	plotGraphic[time_]:=
	With[{$centers = centers[time],$points = points[time]},
Show[
			Graphics[
				If[TrueQ[OptionValue["ShowCircles"]],
					Table[{Circle[$centers[[i]], radii[[i]]]},{i,1, $N}],
					{}]
					], 
			pp[time],
			Graphics[{AbsoluteThickness[1], Line[$points], AbsolutePointSize[5], Point[$points]}],
			PlotRange -> range, ImageSize->Scaled[0.8],PlotRangePadding->Max@radii]];
	range = Switch[OptionValue[EpicyclePlot,"PlotRange"], "Radii", Total@radii, "Plot",PlotRange[ParametricPlot[ReIm@circlesObject["Function"], {t, a, c},Evaluated -> True,PlotRange -> All]],"All",PlotRange[plotGraphic[c]],_,OptionValue[EpicyclePlot,"PlotRange"]];
	finalGraphic[time_]:=If[OptionValue["Spinners"],
Column[{SpinnerRow[circlesObject,time,FilterRules[{opts},Join[Options[SpinnerRow],Options[Spinner]]]],plotGraphic[time]}, Center,ItemSize->Scaled[.8]],
plotGraphic[time]];
If[OptionValue["Movie"]===False,
		Return[finalGraphic[b]]
		,
		fr = OptionValue["Frames"];
		frn = Table[
			finalGraphic[t],
			{t, a, b,(b - a)/(fr - Boole[fr > 1])}];
		Return[Deploy@ListAnimate[frn]]]]];        


Spinner::usage = "Spinner[{coef, \[Omega]},$t] Shows spinner graphics of coef*\!\(\*SuperscriptBox[\(e\), \(I*\[Omega]*$t\)]\). Set 'MaxRadius' to largest circle being compared against; must be constant across circles being compared. Default options are {'FunctionViewer'\[Rule]False,'AngleViewer'\[Rule]False, 'StatViewer'\[Rule]False, 'MaxRadius'\[Rule]None}";
Options[Spinner] = {"FunctionViewer"->False,"AngleViewer"->False, "StatViewer"->False, "MaxRadius"->None};
Spinner[{coef_, \[Omega]_},$t_,OptionsPattern[]]:=
With[{func=Function[t,coef*Exp[I \[Omega] t]]},
Module[{radius = Abs@coef, form =TraditionalForm[NumberForm[coef,{Infinity,1}]*Exp[NumberForm[\[Omega],{\[Infinity],1}]*I *"t"]],angle = (\[Omega] $t+Arg[coef])/Degree, angle0 = Arg[coef]/Degree, scalePadding },
scalePadding = If[OptionValue["MaxRadius"]===None,Scaled[.05],OptionValue["MaxRadius"]-radius];
Deploy@Column[{
Show[{
Graphics[GraphicsComplex[{{0.,0.},ReIm@coef,ReIm@func[$t]},
{Thickness[.005],
{$themeColors[[3]],Dashed,Line[{1,2}]},
{$themeColors[[1]],Arrow[{1,3}]},
{$themeColors[[2]],Opacity[.5],Circle[1,radius]}
}],PlotRangePadding->scalePadding,Frame->False],
If[OptionValue["AngleViewer"]===True,With[{angleRad = .5},
{If[angle-angle0>0.1,{ParametricPlot[angleRad*ReIm@func[t],{t,0,$t},PlotStyle->$themeColors[[3]],Axes->False]/.Line[x_,___]:> {Arrowheads[{-Small,Small}],Dashed,Arrow[x]}},{}],
Graphics[Text[Style["\[Theta]", $themeColors[[3]],Bold],1.2*angleRad*ReIm@func[($t-0)/2], {0,0}]]}],
{}]}, "PlotRange"->All]}//
If[OptionValue["AngleViewer"]===True,Insert[#,Style[StringForm["\[Theta]=``\[Degree]",NumberForm[angle, {Infinity,1}]], "Bold","Medium", $themeColors[[5]]],-1],#]&//
If[OptionValue["FunctionViewer"]===True,
Insert[#,Style[form,"Medium", $themeColors[[5]]],-1],#]&//
If[OptionValue["StatViewer"]===True,
Insert[#,Column[Style[#,"Bold","Text",$themeColors[[5]]]&/@{StringForm["L = ``",NumberForm[radius,{Infinity,1}]],StringForm["\!\(\*SubscriptBox[\(\[Theta]\), \(0\)]\) = ``\[Degree]",NumberForm[angle0,{Infinity,1}]],StringForm["\[Omega] = ``\!\(\*FractionBox[\(deg\), \(s\)]\)",NumberForm[(\[Omega]/N@Degree),{Infinity,1}]]},Center],-1],#]&
,Center]]];


SpinnerRow::usage="SpinnerRow[circlesObject,$t]. Set 'NumSpinners' to set number of spinners in the row. Takes Spinner options.";
Options[SpinnerRow]={"NumSpinners"->None};
SpinnerRow[circlesObject_Association,$t_,opts:OptionsPattern[{SpinnerRow,Spinner}]]:=Module[{spinList,spinListTrunc,maxRad,row},
spinList = Transpose[{#Coefficients, #Speeds}&@circlesObject];
spinListTrunc = With[{$N=OptionValue["NumSpinners"]},If[$N===None,spinList,Take[spinList,UpTo[$N]]]];
maxRad = Max@(Abs/@First/@spinList);
row = (Spinner[#,$t, "MaxRadius"->maxRad, FilterRules[{opts},Options[Spinner]]]&/@spinListTrunc);
GraphicsRow[If[Length[spinList]>OptionValue["NumSpinners"],Append[row,Graphics[Text[Style["...","Title",FontColor->$themeColors[[5]] ]]]],row], ImageSize->Scaled[0.8]]];


StaticSpinner::usage = "StaticSpinner[coef,\[Theta]] Shows spinner graphics of coef*\!\(\*SuperscriptBox[\(e\), \(I*\[Theta]\)]\). Set 'MaxRadius' to largest circle being compared against; must be constant across circles being compared. Default options are {'FunctionViewer'\[Rule]False,'AngleViewer'\[Rule]False, 'StatViewer'\[Rule]False, 'MaxRadius'\[Rule]None}";
Options[StaticSpinner] = {"FunctionViewer"->False,"AngleViewer"->False, "AngleUnits"->"Radians", "MaxRadius"->None};

StaticSpinner[coef_, $$\[Theta]_,OptionsPattern[]]:=
With[{unitsOpt = If[OptionValue["AngleUnits"]==="Radians",1,1.*Degree]},
Module[{$\[Theta],func,radius,form,angle,angle0,scalePadding},
$\[Theta] = $$\[Theta]*unitsOpt;
func=Function[\[Theta],coef*Exp[I \[Theta]]];
radius = Abs@coef;
form =TraditionalForm[NumberForm[coef,{Infinity,1}]*Exp[NumberForm[$\[Theta],{\[Infinity],1}]*I]];
angle = ($\[Theta]+Arg[coef])/unitsOpt;
angle0 = Arg[coef]/unitsOpt;

scalePadding = If[OptionValue["MaxRadius"]===None,Scaled[.05],OptionValue["MaxRadius"]-radius];
Deploy@Column[{
Show[{
Graphics[GraphicsComplex[{{0.,0.},ReIm@coef,ReIm@func[$\[Theta]]},
{Thickness[.005],
{$themeColors[[3]],Dashed,Line[{1,2}]},
{$themeColors[[1]],Arrow[{1,3}]},
{$themeColors[[2]],Opacity[.5],Circle[1,radius]}
}],PlotRangePadding->scalePadding,Frame->False],
If[OptionValue["AngleViewer"]===True,With[{angleRad = .5},
{If[angle-angle0>0.1,{ParametricPlot[angleRad*ReIm@func[\[Theta]],{\[Theta],0,$\[Theta]},PlotStyle->$themeColors[[3]],Axes->False]/.Line[x_,___]:> {Arrowheads[{-Small,Small}],Dashed,Arrow[x]}},{}],
Graphics[Text[Style["\[Theta]", $themeColors[[3]],Bold],1.2*angleRad*ReIm@func[($\[Theta])/2], {0,0}]]}],
{}]}, "PlotRange"->All]}//
If[OptionValue["AngleViewer"]===True,Insert[#,Style[(ToString@StringForm["\[Theta]=``",NumberForm[angle, {Infinity,1}]]<>If[OptionValue["AngleUnits"]==="Radians","","\[Degree]"]), "Bold","Medium", $themeColors[[5]]],-1],#]&//
If[OptionValue["FunctionViewer"]===True,
Insert[#,Style[form,"Medium", $themeColors[[5]]],-1],#]&
,Center]]];


(* ::Section:: *)
(*RawData*)


LineData::usage=
	"LineData['BasicV'] Gives x,y coordinate pairs of simple V shape, origin at centroid\n"<>
	"LineData['VirginiaV'] Gives x,y coordinate pairs of classic Virginia V from logo";
LineData["BasicV"]= Module[{points=Import[$baseDirectory<>"\\LineData\\BasicV.txt"]},
	points = ToExpression[StringJoin["{{",StringReplace[points, "\n"->"},{"],"}}"]];
	points = {#[[1]],-#[[2]]}&/@points;
	points =(#-Mean@points)&/@points ];
LineData["VirginiaV"]=ToExpression@Import[$baseDirectory<>"\\LineData\\VirginiaV.txt"];


End[];


EndPackage[];
