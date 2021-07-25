(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 12.0' *)

(***************************************************************************)
(*                                                                         *)
(*                                                                         *)
(*  Under the Wolfram FreeCDF terms of use, this file and its content are  *)
(*  bound by the Creative Commons BY-SA Attribution-ShareAlike license.    *)
(*                                                                         *)
(*        For additional information concerning CDF licensing, see:        *)
(*                                                                         *)
(*         www.wolfram.com/cdf/adopting-cdf/licensing-options.html         *)
(*                                                                         *)
(*                                                                         *)
(***************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1088,         20]
NotebookDataLength[     41462,        914]
NotebookOptionsPosition[     40717,        888]
NotebookOutlinePosition[     41060,        903]
CellTagsIndexPosition[     41017,        900]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Complex Exponentials", "Section",
 CellChangeTimes->{{3.7902000994887843`*^9, 
  3.790200101817597*^9}},ExpressionUUID->"0c06a3f5-c786-44c8-8e09-\
382a675592fe"],

Cell[CellGroupData[{

Cell[TextData[{
 "Angles: ",
 Cell[BoxData[
  FormBox[
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{"\[ImaginaryI]", " ", "\[Theta]"}]], TraditionalForm]],
  FormatType->"TraditionalForm",ExpressionUUID->
  "74453524-3113-4514-95d1-6cf63081d561"]
}], "Subsection",
 CellChangeTimes->{{3.790201334900899*^9, 3.790201381809024*^9}, {
  3.790201423941373*^9, 
  3.7902014267378874`*^9}},ExpressionUUID->"394a4cc8-9591-4cc4-8e85-\
40307b89762e"],

Cell["\<\
Change the angle of the complex exponential with the slider.
Note the units are in \[OpenCurlyDoubleQuote]Radians.\[CloseCurlyDoubleQuote] \
One radian is the angle made by an arc whose length is equal to the radius of \
the circle. 2\[Pi] radians is a full trip around the circle (360\[Degree])\
\>", "Text",
 CellChangeTimes->{{3.790348024459104*^9, 3.7903480591962347`*^9}, {
  3.7903481232898784`*^9, 
  3.790348236321618*^9}},ExpressionUUID->"67ecc781-594d-4429-92f7-\
329cfed775bc"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{" ", 
  RowBox[{"Manipulate", "[", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"StaticSpinner", "[", 
     RowBox[{"1", ",", "\[Theta]", ",", " ", 
      RowBox[{"\"\<AngleViewer\>\"", "\[Rule]", "True"}], ",", 
      RowBox[{"\"\<FunctionViewer\>\"", "\[Rule]", "True"}], ",", " ", 
      RowBox[{"\"\<AngleUnits\>\"", "\[Rule]", "\"\<Radians\>\""}]}], "]"}], 
    ",", "\[IndentingNewLine]", 
    RowBox[{"{", 
     RowBox[{"\[Theta]", ",", "0", ",", 
      RowBox[{"2.", "\[Pi]"}], ",", 
      RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], ",", 
    RowBox[{"Alignment", "\[Rule]", "Center"}], ",", 
    RowBox[{"SaveDefinitions", "\[Rule]", "True"}], ",", 
    RowBox[{"Initialization", "\[RuleDelayed]", 
     RowBox[{"(", 
      RowBox[{
      "Get", "[", 
       "\"\<G:\\\\My \
Drive\\\\Projects\\\\FourierDisplay\\\\Software\\\\FourierPack.wl\>\"", "]"}],
       ")"}]}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.7902003980417585`*^9, 3.790200527008057*^9}, {
  3.7902005874113274`*^9, 3.7902006262658696`*^9}, {3.790200659440159*^9, 
  3.7902006666322193`*^9}, {3.790200705293036*^9, 3.7902007269796667`*^9}, {
  3.790200793768086*^9, 3.790200799583502*^9}, {3.7902008733892107`*^9, 
  3.7902009093115883`*^9}, {3.790200982242806*^9, 3.7902010057659283`*^9}, {
  3.790201056238531*^9, 3.790201074732685*^9}, {3.7902011734539084`*^9, 
  3.790201173512747*^9}, {3.7902012078142385`*^9, 3.7902012088464794`*^9}, {
  3.7902014419111013`*^9, 3.790201465308092*^9}},
 CellLabel->
  "In[187]:=",ExpressionUUID->"d1c07863-1afe-4314-b4a7-ed6760fa4f13"],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`\[Theta]$$ = 0, Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{
      Hold[$CellContext`\[Theta]$$], 0, 6.283185307179586}}, 
    Typeset`size$$ = {180., {105., 111.}}, Typeset`update$$ = 0, 
    Typeset`initDone$$, Typeset`skipInitDone$$ = 
    False, $CellContext`\[Theta]$329885$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, "Variables" :> {$CellContext`\[Theta]$$ = 0}, 
      "ControllerVariables" :> {
        Hold[$CellContext`\[Theta]$$, $CellContext`\[Theta]$329885$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      FourierPack`StaticSpinner[
       1, $CellContext`\[Theta]$$, "AngleViewer" -> True, "FunctionViewer" -> 
        True, "AngleUnits" -> "Radians"], 
      "Specifications" :> {{$CellContext`\[Theta]$$, 0, 6.283185307179586, 
         Appearance -> "Labeled"}}, "Options" :> {Alignment -> Center}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{305., {152., 158.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    Initialization:>({{FourierPack`StaticSpinner[
           Pattern[FourierPack`Private`coef, 
            Blank[]], 
           Pattern[FourierPack`Private`$$\[Theta], 
            Blank[]], 
           OptionsPattern[]] := 
         With[{FourierPack`Private`unitsOpt = 
            If[OptionValue["AngleUnits"] === "Radians", 1, 1. Degree]}, 
           
           Module[{FourierPack`Private`$\[Theta], FourierPack`Private`func, 
             FourierPack`Private`radius, FourierPack`Private`form, 
             FourierPack`Private`angle, FourierPack`Private`angle0, 
             FourierPack`Private`scalePadding}, 
            FourierPack`Private`$\[Theta] = 
             FourierPack`Private`$$\[Theta] FourierPack`Private`unitsOpt; 
            FourierPack`Private`func = 
             Function[
              FourierPack`Private`\[Theta], FourierPack`Private`coef 
               Exp[I FourierPack`Private`\[Theta]]]; 
            FourierPack`Private`radius = Abs[FourierPack`Private`coef]; 
            FourierPack`Private`form = 
             TraditionalForm[
              NumberForm[FourierPack`Private`coef, {Infinity, 1}] 
               Exp[NumberForm[FourierPack`Private`$\[Theta], {Infinity, 1}] 
                 I]]; FourierPack`Private`angle = (
               FourierPack`Private`$\[Theta] + Arg[FourierPack`Private`coef])/
              FourierPack`Private`unitsOpt; 
            FourierPack`Private`angle0 = 
             Arg[FourierPack`Private`coef]/FourierPack`Private`unitsOpt; 
            FourierPack`Private`scalePadding = 
             If[OptionValue["MaxRadius"] === None, 
               Scaled[0.05], OptionValue["MaxRadius"] - 
               FourierPack`Private`radius]; Deploy[
              Column[
               (If[OptionValue["FunctionViewer"] === True, 
                Insert[#, 
                 Style[FourierPack`Private`form, "Medium", 
                  Part[FourierPack`Private`$themeColors, 5]], -1], #]& )[
                (If[OptionValue["AngleViewer"] === True, 
                 Insert[#, 
                  Style[
                   StringJoin[
                    ToString[
                    StringForm["\[Theta]=``", 
                    NumberForm[FourierPack`Private`angle, {Infinity, 1}]]], 
                    If[
                    OptionValue["AngleUnits"] === "Radians", "", 
                    "\[Degree]"]], "Bold", "Medium", 
                   Part[FourierPack`Private`$themeColors, 5]], -1], #]& )[{
                  Show[{
                    Graphics[
                    GraphicsComplex[{{0., 0.}, 
                    ReIm[FourierPack`Private`coef], 
                    ReIm[
                    FourierPack`Private`func[
                    FourierPack`Private`$\[Theta]]]}, {
                    Thickness[0.005], {
                    Part[FourierPack`Private`$themeColors, 3], Dashed, 
                    Line[{1, 2}]}, {
                    Part[FourierPack`Private`$themeColors, 1], 
                    Arrow[{1, 3}]}, {
                    Part[FourierPack`Private`$themeColors, 2], 
                    Opacity[0.5], 
                    Circle[1, FourierPack`Private`radius]}}], 
                    PlotRangePadding -> FourierPack`Private`scalePadding, 
                    Frame -> False], 
                    If[OptionValue["AngleViewer"] === True, 
                    With[{FourierPack`Private`angleRad = 0.5}, {
                    If[
                    FourierPack`Private`angle - FourierPack`Private`angle0 > 
                    0.1, {
                    ReplaceAll[
                    ParametricPlot[FourierPack`Private`angleRad ReIm[
                    FourierPack`Private`func[FourierPack`Private`\[Theta]]], {
                    FourierPack`Private`\[Theta], 0, 
                    FourierPack`Private`$\[Theta]}, PlotStyle -> 
                    Part[FourierPack`Private`$themeColors, 3], Axes -> False],
                     Line[
                    Pattern[FourierPack`Private`x, 
                    Blank[]], 
                    BlankNullSequence[]] :> {
                    Arrowheads[{-Small, Small}], Dashed, 
                    Arrow[FourierPack`Private`x]}]}, {}], 
                    Graphics[
                    Text[
                    Style["\[Theta]", 
                    Part[FourierPack`Private`$themeColors, 3], Bold], (1.2 
                    FourierPack`Private`angleRad) ReIm[
                    FourierPack`Private`func[
                    FourierPack`Private`$\[Theta]/2]], {0, 0}]]}], {}]}, 
                   "PlotRange" -> All]}]], Center]]]], 
         Options[FourierPack`StaticSpinner] = {
          "FunctionViewer" -> False, "AngleViewer" -> False, "AngleUnits" -> 
           "Radians", "MaxRadius" -> None}, 
         TagSet[FourierPack`StaticSpinner, 
          MessageName[FourierPack`StaticSpinner, "usage"], 
          
          "StaticSpinner[coef,\[Theta]] Shows spinner graphics of \
coef*\!\(\*SuperscriptBox[\(e\), \(I*\[Theta]\)]\). Set 'MaxRadius' to \
largest circle being compared against; must be constant across circles being \
compared. Default options are {'FunctionViewer'\[Rule]False,'AngleViewer'\
\[Rule]False, 'StatViewer'\[Rule]False, 'MaxRadius'\[Rule]None}"], 
         FourierPack`Private`$themeColors = {
           RGBColor[
           0.00784313725490196, 0.17254901960784313`, 0.27058823529411763`], 
           RGBColor[
           0.0196078431372549, 0.32941176470588235`, 0.38823529411764707`], 
           RGBColor[
           0.6627450980392157, 0.611764705882353, 0.5725490196078431], 
           RGBColor[0.6039215686274509, 0.2, 0.10196078431372549`], 
           RGBColor[
           0.6431372549019608, 0.29411764705882354`, 0.1568627450980392]}}; 
       Get["G:\\My \
Drive\\Projects\\FourierDisplay\\Software\\FourierPack.wl"]}; 
     Typeset`initDone$$ = True),
    SynchronousInitialization->True,
    UndoTrackedVariables:>{Typeset`show$$, Typeset`bookmarkMode$$},
    UnsavedVariables:>{Typeset`initDone$$},
    UntrackedVariables:>{Typeset`size$$}], "Manipulate",
   Deployed->True,
   StripOnInput->False],
  Manipulate`InterpretManipulate[1]]], "Output",
 CellChangeTimes->{{3.790200458881118*^9, 3.790200482400327*^9}, 
   3.7902005277261333`*^9, {3.7902005985001087`*^9, 3.790200626946042*^9}, {
   3.7902007136507006`*^9, 3.7902007276199555`*^9}, 3.790200800391373*^9, 
   3.7902008395895615`*^9, {3.7902008799568157`*^9, 3.7902009098700924`*^9}, 
   3.790201006978677*^9, {3.79020105837484*^9, 3.790201075560463*^9}, {
   3.7902011746566887`*^9, 3.7902012098567514`*^9}, {3.790201454101014*^9, 
   3.7902014659254045`*^9}},
 CellLabel->
  "Out[187]=",ExpressionUUID->"0545b86c-e455-4b99-8306-61afb708d749"]
}, {2}]]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[{
 "Speeds: ",
 Cell[BoxData[
  FormBox[
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{"\[ImaginaryI]", " ", "\[Omega]", " ", "\[ScriptT]"}]], 
   TraditionalForm]],
  FormatType->"TraditionalForm",ExpressionUUID->
  "4fb60f7f-9c3e-456e-a633-b56135e4d4c1"]
}], "Subsection",
 CellChangeTimes->{{3.790201339199442*^9, 3.7902013398636703`*^9}, {
  3.7902013862681*^9, 
  3.7902014201983705`*^9}},ExpressionUUID->"023c54b8-f558-4af1-b9b4-\
0a1e8565434e"],

Cell["\<\
Change the speed in \[OpenCurlyDoubleQuote]Radians / Second\
\[CloseCurlyDoubleQuote] with the \[OpenCurlyDoubleQuote]Speed\
\[CloseCurlyDoubleQuote] slider.
Use the \[OpenCurlyDoubleQuote]Play\[CloseCurlyDoubleQuote] arrow next to the \
time slider to watch your spinner spin!\
\>", "Text",
 CellChangeTimes->{{3.7903482614813204`*^9, 
  3.7903482929703293`*^9}},ExpressionUUID->"c723f971-b39e-4d43-a849-\
4a5b1cb12291"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{" ", 
  RowBox[{"Manipulate", "[", 
   RowBox[{
    RowBox[{"Spinner", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"1", ",", "n"}], "}"}], ",", "$t", ",", " ", 
      RowBox[{"\"\<FunctionViewer\>\"", "\[Rule]", "True"}]}], "]"}], ",", 
    "\[IndentingNewLine]", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"n", ",", 
        RowBox[{"2", "\[Pi]"}], ",", "\"\<Speed\>\""}], "}"}], ",", "0", ",", 
      RowBox[{"20", "\[Pi]"}], ",", "\[Pi]", ",", 
      RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], ",", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"$t", ",", "0", ",", "\"\<Time\>\""}], "}"}], ",", "0", ",", 
      "1", ",", 
      RowBox[{"ControlType", "\[Rule]", "Animator"}], ",", " ", 
      RowBox[{"AnimationRunning", "\[Rule]", "False"}]}], "}"}], ",", 
    RowBox[{"Alignment", "\[Rule]", "Center"}], ",", 
    RowBox[{"SaveDefinitions", "\[Rule]", "True"}], ",", 
    RowBox[{"Initialization", "\[RuleDelayed]", 
     RowBox[{"(", 
      RowBox[{
      "Get", "[", 
       "\"\<G:\\\\My \
Drive\\\\Projects\\\\FourierDisplay\\\\Software\\\\FourierPack.wl\>\"", "]"}],
       ")"}]}]}], "]"}]}]], "Input",
 CellChangeTimes->{{3.7902014800347447`*^9, 3.7902014833080025`*^9}},
 CellLabel->"In[7]:=",ExpressionUUID->"76cb97eb-1d1e-4cf3-8dc5-6dab7a34e2aa"],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`n$$ = 2 Pi, $CellContext`$t$$ = 0, 
    Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
    Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ = 
    1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`n$$], 2 Pi, "Speed"}, 0, 20 Pi, Pi}, {{
       Hold[$CellContext`$t$$], 0, "Time"}, 0, 1}}, Typeset`size$$ = {
    180., {96.5, 102.5}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = False, $CellContext`n$30321$$ = 
    0, $CellContext`$t$30322$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`n$$ = 2 Pi, $CellContext`$t$$ = 0}, 
      "ControllerVariables" :> {
        Hold[$CellContext`n$$, $CellContext`n$30321$$, 0], 
        Hold[$CellContext`$t$$, $CellContext`$t$30322$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      FourierPack`Spinner[{1, $CellContext`n$$}, $CellContext`$t$$, 
        "FunctionViewer" -> True], 
      "Specifications" :> {{{$CellContext`n$$, 2 Pi, "Speed"}, 0, 20 Pi, Pi, 
         Appearance -> "Labeled"}, {{$CellContext`$t$$, 0, "Time"}, 0, 1, 
         ControlType -> Animator, AnimationRunning -> False}}, 
      "Options" :> {Alignment -> Center}, "DefaultOptions" :> {}],
     ImageSizeCache->{397., {158., 164.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    Initialization:>({{FourierPack`Spinner[{
            Pattern[FourierPack`Private`coef, 
             Blank[]], 
            Pattern[FourierPack`Private`\[Omega], 
             Blank[]]}, 
           Pattern[FourierPack`Private`$t, 
            Blank[]], 
           OptionsPattern[]] := 
         With[{
           FourierPack`Private`func = 
            Function[
             FourierPack`Private`t, FourierPack`Private`coef 
              Exp[I FourierPack`Private`\[Omega] FourierPack`Private`t]]}, 
           
           Module[{FourierPack`Private`radius = Abs[FourierPack`Private`coef],
              FourierPack`Private`form = 
             TraditionalForm[
              NumberForm[FourierPack`Private`coef, {Infinity, 1}] 
               Exp[NumberForm[FourierPack`Private`\[Omega], {Infinity, 1}] I 
                 "t"]], FourierPack`Private`angle = (
               FourierPack`Private`\[Omega] FourierPack`Private`$t + 
               Arg[FourierPack`Private`coef])/Degree, 
             FourierPack`Private`angle0 = 
             Arg[FourierPack`Private`coef]/Degree, 
             FourierPack`Private`scalePadding}, 
            FourierPack`Private`scalePadding = 
             If[OptionValue["MaxRadius"] === None, 
               Scaled[0.05], OptionValue["MaxRadius"] - 
               FourierPack`Private`radius]; Deploy[
              Column[
               (If[OptionValue["StatViewer"] === True, 
                Insert[#, 
                 Column[
                  Map[Style[#, "Bold", "Text", 
                    Part[FourierPack`Private`$themeColors, 5]]& , {
                    StringForm["L = ``", 
                    NumberForm[FourierPack`Private`radius, {Infinity, 1}]], 
                    StringForm[
                    "\!\(\*SubscriptBox[\(\[Theta]\), \(0\)]\) = ``\[Degree]", 
                    NumberForm[FourierPack`Private`angle0, {Infinity, 1}]], 
                    StringForm[
                    "\[Omega] = ``\!\(\*FractionBox[\(deg\), \(s\)]\)", 
                    NumberForm[
                    FourierPack`Private`\[Omega]/N[Degree], {Infinity, 1}]]}],
                   Center], -1], #]& )[
                (If[OptionValue["FunctionViewer"] === True, 
                 Insert[#, 
                  Style[FourierPack`Private`form, "Medium", 
                   Part[FourierPack`Private`$themeColors, 5]], -1], #]& )[
                 (If[OptionValue["AngleViewer"] === True, 
                  Insert[#, 
                   Style[
                    StringForm["\[Theta]=``\[Degree]", 
                    NumberForm[FourierPack`Private`angle, {Infinity, 1}]], 
                    "Bold", "Medium", 
                    Part[FourierPack`Private`$themeColors, 5]], -1], #]& )[{
                   Show[{
                    Graphics[
                    GraphicsComplex[{{0., 0.}, 
                    ReIm[FourierPack`Private`coef], 
                    ReIm[
                    FourierPack`Private`func[FourierPack`Private`$t]]}, {
                    Thickness[0.005], {
                    Part[FourierPack`Private`$themeColors, 3], Dashed, 
                    Line[{1, 2}]}, {
                    Part[FourierPack`Private`$themeColors, 1], 
                    Arrow[{1, 3}]}, {
                    Part[FourierPack`Private`$themeColors, 2], 
                    Opacity[0.5], 
                    Circle[1, FourierPack`Private`radius]}}], 
                    PlotRangePadding -> FourierPack`Private`scalePadding, 
                    Frame -> False], 
                    If[OptionValue["AngleViewer"] === True, 
                    With[{FourierPack`Private`angleRad = 0.5}, {
                    If[
                    FourierPack`Private`angle - FourierPack`Private`angle0 > 
                    0.1, {
                    ReplaceAll[
                    ParametricPlot[FourierPack`Private`angleRad ReIm[
                    FourierPack`Private`func[FourierPack`Private`t]], {
                    FourierPack`Private`t, 0, FourierPack`Private`$t}, 
                    PlotStyle -> Part[FourierPack`Private`$themeColors, 3], 
                    Axes -> False], Line[
                    Pattern[FourierPack`Private`x, 
                    Blank[]], 
                    BlankNullSequence[]] :> {
                    Arrowheads[{-Small, Small}], Dashed, 
                    Arrow[FourierPack`Private`x]}]}, {}], 
                    Graphics[
                    Text[
                    Style["\[Theta]", 
                    Part[FourierPack`Private`$themeColors, 3], Bold], 1.2 
                    FourierPack`Private`angleRad ReIm[
                    
                    FourierPack`Private`func[(FourierPack`Private`$t + 0)/
                    2]], {0, 0}]]}], {}]}, "PlotRange" -> All]}]]], 
               Center]]]], 
         Options[FourierPack`Spinner] = {
          "FunctionViewer" -> False, "AngleViewer" -> False, "StatViewer" -> 
           False, "MaxRadius" -> None}, 
         TagSet[FourierPack`Spinner, 
          MessageName[FourierPack`Spinner, "shdw"], 
          "Symbol `1` appears in multiple contexts `2`; definitions in \
context `3` may shadow or be shadowed by other definitions."], 
         TagSet[FourierPack`Spinner, 
          MessageName[FourierPack`Spinner, "usage"], 
          "Spinner[{coef, \[Omega]},$t] Shows spinner graphics of \
coef*\!\(\*SuperscriptBox[\(e\), \(I*\[Omega]*$t\)]\). Set 'MaxRadius' to \
largest circle being compared against; must be constant across circles being \
compared. Default options are {'FunctionViewer'\[Rule]False,'AngleViewer'\
\[Rule]False, 'StatViewer'\[Rule]False, 'MaxRadius'\[Rule]None}"], 
         FourierPack`Private`$themeColors = {
           RGBColor[
           0.00784313725490196, 0.17254901960784313`, 0.27058823529411763`], 
           RGBColor[
           0.0196078431372549, 0.32941176470588235`, 0.38823529411764707`], 
           RGBColor[
           0.6627450980392157, 0.611764705882353, 0.5725490196078431], 
           RGBColor[0.6039215686274509, 0.2, 0.10196078431372549`], 
           RGBColor[
           0.6431372549019608, 0.29411764705882354`, 0.1568627450980392]}}; 
       Get["G:\\My \
Drive\\Projects\\FourierDisplay\\Software\\FourierPack.wl"]}; 
     Typeset`initDone$$ = True),
    SynchronousInitialization->True,
    UndoTrackedVariables:>{Typeset`show$$, Typeset`bookmarkMode$$},
    UnsavedVariables:>{Typeset`initDone$$},
    UntrackedVariables:>{Typeset`size$$}], "Manipulate",
   Deployed->True,
   StripOnInput->False],
  Manipulate`InterpretManipulate[1]]], "Output",
 CellChangeTimes->{{3.790201474170383*^9, 3.790201483562278*^9}, 
   3.790348314993359*^9},
 CellLabel->"Out[7]=",ExpressionUUID->"322759eb-7d99-4228-9b3f-b8c4b3e76b39"]
}, {2}]]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Control Knobs", "Section",
 CellChangeTimes->{{3.7902015011831627`*^9, 
  3.790201518810063*^9}},ExpressionUUID->"d0226b3e-8d4a-4fc9-9e34-\
a262fd5ccf84"],

Cell[TextData[{
 "For each spinner in our Fourier series, we can control its ",
 StyleBox["initial angle ",
  FontWeight->"Bold"],
 "and ",
 StyleBox["radius ",
  FontWeight->"Bold"],
 "by multiplying it with a constant complex exponential.\nChange the initial \
angle and radius to see how it changes the spinner at time 0.  "
}], "Text",
 CellChangeTimes->{{3.7903483423930674`*^9, 
  3.7903485476261554`*^9}},ExpressionUUID->"db5b7680-824d-481f-b2b3-\
30c593870023"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Manipulate", "[", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"StaticSpinnerMan", ",", "hexToRGB", ",", "$themeColors"}], 
      "}"}], ",", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{
       RowBox[{"hexToRGB", "[", "hex_", "]"}], ":=", 
       RowBox[{"RGBColor", "@@", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           RowBox[{"N", "[", 
            RowBox[{
             RowBox[{"FromDigits", "[", 
              RowBox[{
               RowBox[{"StringJoin", "[", "#", "]"}], ",", "12"}], "]"}], "/",
              "255"}], "]"}], "&"}], "/@", 
          RowBox[{"Partition", "[", 
           RowBox[{
            RowBox[{"Characters", "[", "hex", "]"}], ",", "2"}], "]"}]}], 
         ")"}]}]}], ";", "\n", 
      RowBox[{"$themeColors", " ", "=", " ", 
       RowBox[{"hexToRGB", "/@", 
        RowBox[{"{", 
         RowBox[{
         "\"\<023859\>\"", ",", "\"\<056C83\>\"", ",", "\"\<DDCCC2\>\"", ",", 
          "\"\<CA431E\>\"", ",", "\"\<D86334\>\""}], "}"}]}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"Options", "[", "StaticSpinnerMan", "]"}], " ", "=", " ", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<FunctionViewer\>\"", "->", "False"}], ",", 
         RowBox[{"\"\<AngleViewer\>\"", "->", "False"}], ",", " ", 
         RowBox[{"\"\<AngleUnits\>\"", "->", "\"\<Radians\>\""}], ",", " ", 
         RowBox[{"\"\<MaxRadius\>\"", "->", "None"}]}], "}"}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"StaticSpinnerMan", "[", 
        RowBox[{"r_", ",", " ", "$$\[Theta]_", ",", 
         RowBox[{"OptionsPattern", "[", "]"}]}], "]"}], ":=", "\n", 
       RowBox[{"With", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"unitsOpt", " ", "=", " ", 
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{
              RowBox[{"OptionValue", "[", "\"\<AngleUnits\>\"", "]"}], "===", 
              "\"\<Radians\>\""}], ",", "1", ",", 
             RowBox[{"1.", "*", "Degree"}]}], "]"}]}], "}"}], ",", "\n", 
         RowBox[{"Module", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
            "$\[Theta]", ",", "form", ",", "val", ",", "angle", ",", 
             "scalePadding"}], "}"}], ",", "\[IndentingNewLine]", 
           RowBox[{
            RowBox[{"$\[Theta]", " ", "=", " ", 
             RowBox[{"$$\[Theta]", "*", "unitsOpt"}]}], ";", 
            "\[IndentingNewLine]", 
            RowBox[{"val", " ", "=", " ", 
             RowBox[{"r", "*", 
              RowBox[{"Exp", "[", 
               RowBox[{"I", "*", "$\[Theta]"}], "]"}]}]}], ";", 
            "\[IndentingNewLine]", 
            RowBox[{"form", " ", "=", 
             RowBox[{"StringForm", "[", 
              RowBox[{
              "\"\<\!\(\*SuperscriptBox[\(``\[ExponentialE]\), \
\(``I\)]\)*\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(I\[Omega]\[ScriptT]\)]\
\)\>\"", ",", "r", ",", 
               RowBox[{"NumberForm", "[", 
                RowBox[{"$\[Theta]", ",", 
                 RowBox[{"{", 
                  RowBox[{"3", ",", "2"}], "}"}]}], "]"}]}], "]"}]}], ";", 
            "\[IndentingNewLine]", 
            RowBox[{"angle", " ", "=", " ", 
             RowBox[{
              RowBox[{"(", "$\[Theta]", ")"}], "/", "unitsOpt"}]}], ";", 
            "\[IndentingNewLine]", "\[IndentingNewLine]", 
            RowBox[{"scalePadding", " ", "=", " ", 
             RowBox[{"If", "[", 
              RowBox[{
               RowBox[{
                RowBox[{"OptionValue", "[", "\"\<MaxRadius\>\"", "]"}], "===",
                 "None"}], ",", 
               RowBox[{"Scaled", "[", ".05", "]"}], ",", 
               RowBox[{
                RowBox[{"OptionValue", "[", "\"\<MaxRadius\>\"", "]"}], "-", 
                "r"}]}], "]"}]}], ";", "\[IndentingNewLine]", 
            "\[IndentingNewLine]", 
            RowBox[{"Deploy", "@", 
             RowBox[{"Column", "[", 
              RowBox[{
               RowBox[{
                RowBox[{
                 RowBox[{"{", "\[IndentingNewLine]", 
                  RowBox[{"Show", "[", 
                   RowBox[{
                    RowBox[{"{", "\[IndentingNewLine]", 
                    RowBox[{"Graphics", "[", 
                    RowBox[{
                    RowBox[{"GraphicsComplex", "[", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"0.", ",", "0."}], "}"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"r", ",", "0."}], "}"}], ",", 
                    RowBox[{"ReIm", "@", "val"}]}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"Thickness", "[", ".005", "]"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"$themeColors", "[", 
                    RowBox[{"[", "3", "]"}], "]"}], ",", "Dashed", ",", 
                    RowBox[{"Line", "[", 
                    RowBox[{"{", 
                    RowBox[{"1", ",", "2"}], "}"}], "]"}]}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"$themeColors", "[", 
                    RowBox[{"[", "1", "]"}], "]"}], ",", 
                    RowBox[{"Arrow", "[", 
                    RowBox[{"{", 
                    RowBox[{"1", ",", "3"}], "}"}], "]"}]}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"$themeColors", "[", 
                    RowBox[{"[", "2", "]"}], "]"}], ",", 
                    RowBox[{"Opacity", "[", ".5", "]"}], ",", 
                    RowBox[{"Circle", "[", 
                    RowBox[{"1", ",", "r"}], "]"}]}], "}"}]}], 
                    "\[IndentingNewLine]", "}"}]}], "]"}], ",", 
                    RowBox[{"PlotRangePadding", "->", "scalePadding"}], ",", 
                    RowBox[{"Frame", "->", "False"}]}], "]"}], "}"}], ",", 
                    " ", 
                    RowBox[{"\"\<PlotRange\>\"", "->", "All"}]}], "]"}], 
                  "}"}], "//", "\n", 
                 RowBox[{
                  RowBox[{"If", "[", 
                   RowBox[{
                    RowBox[{
                    RowBox[{"OptionValue", "[", "\"\<AngleViewer\>\"", "]"}], 
                    "===", "True"}], ",", 
                    RowBox[{"Insert", "[", 
                    RowBox[{"#", ",", 
                    RowBox[{"Style", "[", 
                    RowBox[{
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{"ToString", "@", 
                    RowBox[{"StringForm", "[", 
                    RowBox[{"\"\<\[Theta]=``\>\"", ",", 
                    RowBox[{"NumberForm", "[", 
                    RowBox[{"angle", ",", " ", 
                    RowBox[{"{", 
                    RowBox[{"Infinity", ",", "1"}], "}"}]}], "]"}]}], "]"}]}],
                     "<>", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"OptionValue", "[", "\"\<AngleUnits\>\"", "]"}], 
                    "===", "\"\<Radians\>\""}], ",", "\"\<\>\"", ",", 
                    "\"\<\[Degree]\>\""}], "]"}]}], ")"}], ",", " ", 
                    "\"\<Bold\>\"", ",", "\"\<Medium\>\"", ",", " ", 
                    RowBox[{"$themeColors", "[", 
                    RowBox[{"[", "5", "]"}], "]"}]}], "]"}], ",", 
                    RowBox[{"-", "1"}]}], "]"}], ",", "#"}], "]"}], "&"}]}], "//",
                 "\n", 
                RowBox[{
                 RowBox[{"If", "[", 
                  RowBox[{
                   RowBox[{
                    RowBox[{
                    "OptionValue", "[", "\"\<FunctionViewer\>\"", "]"}], "===",
                     "True"}], ",", "\n", 
                   RowBox[{"Insert", "[", 
                    RowBox[{"#", ",", 
                    RowBox[{"Style", "[", 
                    RowBox[{"form", ",", "\"\<Large\>\"", ",", " ", 
                    RowBox[{"$themeColors", "[", 
                    RowBox[{"[", "5", "]"}], "]"}]}], "]"}], ",", 
                    RowBox[{"-", "1"}]}], "]"}], ",", "#"}], "]"}], "&"}]}], 
               "\n", ",", "Center"}], "]"}]}]}]}], "]"}]}], "]"}]}], ";", 
      "\[IndentingNewLine]", "\[IndentingNewLine]", 
      RowBox[{"StaticSpinnerMan", "[", 
       RowBox[{"r", ",", "\[Theta]0", ",", 
        RowBox[{"\"\<FunctionViewer\>\"", "\[Rule]", "True"}], ",", " ", 
        RowBox[{"\"\<AngleUnits\>\"", "\[Rule]", "\"\<Radians\>\""}], ",", 
        " ", 
        RowBox[{"\"\<MaxRadius\>\"", "\[Rule]", "10"}]}], "]"}]}]}], "]"}], 
   ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"\[Theta]0", ",", "0", ",", "\"\<Initial Angle\>\""}], "}"}], 
     ",", "0", ",", 
     RowBox[{"2", "\[Pi]"}], ",", 
     RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], ",", " ", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"r", ",", "5", ",", "\"\<Radius\>\""}], "}"}], ",", "1", ",", 
     "10", ",", 
     RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], ",", 
   RowBox[{"Alignment", "\[Rule]", "Center"}], ",", 
   RowBox[{"SaveDefinitions", "\[Rule]", "True"}], ",", 
   RowBox[{"Initialization", "\[RuleDelayed]", 
    RowBox[{"(", 
     RowBox[{
     "Get", "[", 
      "\"\<G:\\\\My \
Drive\\\\Projects\\\\FourierDisplay\\\\Software\\\\FourierPack.wl\>\"", "]"}],
      ")"}]}]}], "]"}]], "Input",
 CellChangeTimes->{{3.7902015659433603`*^9, 3.790201573977854*^9}, {
  3.7902016127033377`*^9, 3.790201671717267*^9}, {3.790202071258936*^9, 
  3.790202160039736*^9}, {3.7902022130888557`*^9, 3.7902022132753897`*^9}, {
  3.790202246296067*^9, 3.790202299668388*^9}, {3.7902023322871704`*^9, 
  3.790202368848374*^9}, {3.790202411754648*^9, 3.790202562425804*^9}, {
  3.7902026264186597`*^9, 3.790202627407049*^9}, {3.790202698982663*^9, 
  3.790202700124608*^9}, {3.7902027585782843`*^9, 3.7902027913058023`*^9}, {
  3.790202830377*^9, 3.7902028632333546`*^9}, {3.790202894712151*^9, 
  3.790202916983632*^9}, {3.790202962775193*^9, 3.7902031103432093`*^9}, {
  3.7902031629142637`*^9, 3.790203218314122*^9}, {3.790203250372402*^9, 
  3.790203266394529*^9}},
 CellLabel->"In[6]:=",ExpressionUUID->"82ed9330-3655-4b5f-bd9a-5af3918d8e69"],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`r$$ = 5, $CellContext`\[Theta]0$$ = 0, 
    Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
    Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ = 
    1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`\[Theta]0$$], 0, "Initial Angle"}, 0, 2 Pi}, {{
       Hold[$CellContext`r$$], 5, "Radius"}, 1, 10}}, Typeset`size$$ = {
    180., {101.5, 107.5}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = False, $CellContext`\[Theta]0$29955$$ = 
    0, $CellContext`r$29956$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`r$$ = 5, $CellContext`\[Theta]0$$ = 0}, 
      "ControllerVariables" :> {
        Hold[$CellContext`\[Theta]0$$, $CellContext`\[Theta]0$29955$$, 0], 
        Hold[$CellContext`r$$, $CellContext`r$29956$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      Module[{$CellContext`StaticSpinnerMan$, $CellContext`hexToRGB$, \
$CellContext`$themeColors$}, $CellContext`hexToRGB$[
           Pattern[$CellContext`hex, 
            Blank[]]] := Apply[RGBColor, 
           Map[N[FromDigits[
               StringJoin[#], 12]/255]& , 
            Partition[
             Characters[$CellContext`hex], 2]]]; $CellContext`$themeColors$ = 
         Map[$CellContext`hexToRGB$, {
           "023859", "056C83", "DDCCC2", "CA431E", "D86334"}]; 
        Options[$CellContext`StaticSpinnerMan$] = {
          "FunctionViewer" -> False, "AngleViewer" -> False, "AngleUnits" -> 
           "Radians", "MaxRadius" -> None}; $CellContext`StaticSpinnerMan$[
           Pattern[$CellContext`r$, 
            Blank[]], 
           Pattern[$CellContext`$$\[Theta]$, 
            Blank[]], 
           OptionsPattern[]] := 
         With[{$CellContext`unitsOpt$ = 
            If[OptionValue["AngleUnits"] === "Radians", 1, 1. Degree]}, 
           
           Module[{$CellContext`$\[Theta]$, $CellContext`form$, \
$CellContext`val$, $CellContext`angle$, $CellContext`scalePadding$}, \
$CellContext`$\[Theta]$ = $CellContext`$$\[Theta]$ $CellContext`unitsOpt$; \
$CellContext`val$ = $CellContext`r$ 
              Exp[I $CellContext`$\[Theta]$]; $CellContext`form$ = 
             StringForm[
              "\!\(\*SuperscriptBox[\(``\[ExponentialE]\), \
\(``I\)]\)*\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(I\[Omega]\[ScriptT]\)]\
\)", $CellContext`r$, 
               
               NumberForm[$CellContext`$\[Theta]$, {3, 
                2}]]; $CellContext`angle$ = \
$CellContext`$\[Theta]$/$CellContext`unitsOpt$; $CellContext`scalePadding$ = 
             If[OptionValue["MaxRadius"] === None, 
               Scaled[0.05], OptionValue["MaxRadius"] - $CellContext`r$]; 
            Deploy[
              Column[
               (If[OptionValue["FunctionViewer"] === True, 
                Insert[#, 
                 Style[$CellContext`form$, "Large", 
                  Part[$CellContext`$themeColors$, 5]], -1], #]& )[
                (If[OptionValue["AngleViewer"] === True, 
                 Insert[#, 
                  Style[
                   StringJoin[
                    ToString[
                    StringForm["\[Theta]=``", 
                    NumberForm[$CellContext`angle$, {Infinity, 1}]]], 
                    If[
                    OptionValue["AngleUnits"] === "Radians", "", 
                    "\[Degree]"]], "Bold", "Medium", 
                   Part[$CellContext`$themeColors$, 5]], -1], #]& )[{
                  Show[{
                    Graphics[
                    GraphicsComplex[{{0., 0.}, {$CellContext`r$, 0.}, 
                    ReIm[$CellContext`val$]}, {
                    Thickness[0.005], {
                    Part[$CellContext`$themeColors$, 3], Dashed, 
                    Line[{1, 2}]}, {
                    Part[$CellContext`$themeColors$, 1], 
                    Arrow[{1, 3}]}, {
                    Part[$CellContext`$themeColors$, 2], 
                    Opacity[0.5], 
                    Circle[1, $CellContext`r$]}}], 
                    PlotRangePadding -> $CellContext`scalePadding$, Frame -> 
                    False]}, "PlotRange" -> All]}]], 
               Center]]]]; $CellContext`StaticSpinnerMan$[$CellContext`r$$, \
$CellContext`\[Theta]0$$, "FunctionViewer" -> True, "AngleUnits" -> "Radians",
           "MaxRadius" -> 10]], 
      "Specifications" :> {{{$CellContext`\[Theta]0$$, 0, "Initial Angle"}, 0,
          2 Pi, Appearance -> "Labeled"}, {{$CellContext`r$$, 5, "Radius"}, 1,
          10, Appearance -> "Labeled"}}, "Options" :> {Alignment -> Center}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{360., {163., 169.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    Initialization:>(
     Get["G:\\My Drive\\Projects\\FourierDisplay\\Software\\FourierPack.wl"]; 
     Typeset`initDone$$ = True),
    SynchronousInitialization->True,
    UndoTrackedVariables:>{Typeset`show$$, Typeset`bookmarkMode$$},
    UnsavedVariables:>{Typeset`initDone$$},
    UntrackedVariables:>{Typeset`size$$}], "Manipulate",
   Deployed->True,
   StripOnInput->False],
  Manipulate`InterpretManipulate[1]]], "Output",
 CellChangeTimes->{
  3.790201574817607*^9, {3.7902016364773874`*^9, 3.7902016726417923`*^9}, 
   3.79020245035347*^9, 3.7902027054134684`*^9, {3.7902027723654137`*^9, 
   3.790202791730633*^9}, 3.7902028643164263`*^9, {3.790202896481453*^9, 
   3.7902029175022135`*^9}, {3.7902029707153964`*^9, 3.790202996516571*^9}, {
   3.790203189779421*^9, 3.7902032187210035`*^9}, {3.7902032557450385`*^9, 
   3.7902032668483467`*^9}, 3.790348306193824*^9},
 CellLabel->"Out[6]=",ExpressionUUID->"13bf1324-5527-4233-9b79-7363f865d5ee"]
}, {2}]]
}, Open  ]]
},
WindowSize->{1536, 781},
WindowMargins->{{-8, Automatic}, {Automatic, -8}},
FrontEndVersion->"12.0 for Microsoft Windows (64-bit) (April 8, 2019)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1510, 35, 167, 3, 67, "Section",ExpressionUUID->"0c06a3f5-c786-44c8-8e09-382a675592fe"],
Cell[CellGroupData[{
Cell[1702, 42, 446, 12, 53, "Subsection",ExpressionUUID->"394a4cc8-9591-4cc4-8e85-40307b89762e"],
Cell[2151, 56, 498, 9, 56, "Text",ExpressionUUID->"67ecc781-594d-4429-92f7-329cfed775bc"],
Cell[CellGroupData[{
Cell[2674, 69, 1599, 32, 67, "Input",ExpressionUUID->"d1c07863-1afe-4314-b4a7-ed6760fa4f13"],
Cell[4276, 103, 8203, 160, 329, "Output",ExpressionUUID->"0545b86c-e455-4b99-8306-61afb708d749"]
}, {2}]]
}, Open  ]],
Cell[CellGroupData[{
Cell[12525, 269, 469, 13, 53, "Subsection",ExpressionUUID->"023c54b8-f558-4af1-b9b4-0a1e8565434e"],
Cell[12997, 284, 431, 9, 56, "Text",ExpressionUUID->"c723f971-b39e-4d43-a849-4a5b1cb12291"],
Cell[CellGroupData[{
Cell[13453, 297, 1364, 34, 67, "Input",ExpressionUUID->"76cb97eb-1d1e-4cf3-8dc5-6dab7a34e2aa"],
Cell[14820, 333, 8454, 166, 341, "Output",ExpressionUUID->"322759eb-7d99-4228-9b3f-b8c4b3e76b39"]
}, {2}]]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[23332, 506, 160, 3, 67, "Section",ExpressionUUID->"d0226b3e-8d4a-4fc9-9e34-a262fd5ccf84"],
Cell[23495, 511, 469, 12, 56, "Text",ExpressionUUID->"db5b7680-824d-481f-b2b3-30c593870023"],
Cell[CellGroupData[{
Cell[23989, 527, 10676, 237, 655, "Input",ExpressionUUID->"82ed9330-3655-4b5f-bd9a-5af3918d8e69"],
Cell[34668, 766, 6024, 118, 351, "Output",ExpressionUUID->"13bf1324-5527-4233-9b79-7363f865d5ee"]
}, {2}]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature wx0lhQgAjvHqxDwpyt2Jbf2Y *)
