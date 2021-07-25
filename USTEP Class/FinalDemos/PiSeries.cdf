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
NotebookDataLength[     20305,        427]
NotebookOptionsPosition[     20589,        420]
NotebookOutlinePosition[     20932,        435]
CellTagsIndexPosition[     20889,        432]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Pi Series", "Section",
 CellChangeTimes->{{3.7901924031473827`*^9, 
  3.790192405608801*^9}},ExpressionUUID->"3919f765-62bc-401d-a39f-\
ab73880cac0c"],

Cell["\<\
Drag the slider to see how adding more terms to the  series makes a better \
approximation of Pi.\
\>", "Text",
 CellChangeTimes->{{3.7903475945553274`*^9, 
  3.7903476471697254`*^9}},ExpressionUUID->"cd56b7db-403e-49bd-897d-\
4c410fe4b212"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Manipulate", "[", 
  RowBox[{
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"piTerm", ",", "piDemo"}], "}"}], ",", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{
       RowBox[{"piTerm", "[", "k_", "]"}], ":=", 
       RowBox[{"4", "*", 
        FractionBox[
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"-", "1"}], ")"}], 
          RowBox[{"k", "+", "1"}]], 
         RowBox[{
          RowBox[{"2", "k"}], "-", "1"}]]}]}], ";", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"piTerm", "[", "0", "]"}], " ", "=", " ", "0"}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{"Module", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"piTerms", ",", "piSum", ",", " ", "numFormatter", ",", " ", 
          RowBox[{"maxDisplay", " ", "=", " ", "18"}]}], "}"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"piTerms", " ", "=", 
          RowBox[{"Table", "[", 
           RowBox[{
            RowBox[{"piTerm", "[", "i", "]"}], ",", 
            RowBox[{"{", 
             RowBox[{"i", ",", "0", ",", "$N"}], "}"}]}], "]"}]}], ";", 
         "\[IndentingNewLine]", 
         RowBox[{"piSum", " ", "=", " ", 
          RowBox[{"Total", "@", 
           RowBox[{"N", "@", "piTerms"}]}]}], ";", "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"numFormatter", "[", 
           RowBox[{"num_", ",", 
            RowBox[{"{", "index_", "}"}]}], "]"}], ":=", 
          RowBox[{
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{
              RowBox[{"index", ">", "1"}], "&&", 
              RowBox[{"num", "\[GreaterEqual]", "0"}]}], " ", ",", 
             "\"\< + \>\"", ",", "\"\< \>\""}], "]"}], "<>", 
           RowBox[{"ToString", "@", 
            RowBox[{"TraditionalForm", "@", "num"}]}]}]}], ";", 
         "\[IndentingNewLine]", 
         RowBox[{"Column", "[", 
          RowBox[{
           RowBox[{"{", "\[IndentingNewLine]", 
            RowBox[{
             RowBox[{"Show", "[", 
              RowBox[{
               RowBox[{"{", 
                RowBox[{
                 RowBox[{"NumberLinePlot", "[", 
                  RowBox[{
                   RowBox[{"Interval", "[", 
                    RowBox[{"{", 
                    RowBox[{"piSum", ",", "\[Pi]"}], "}"}], "]"}], ",", 
                   RowBox[{"Spacings", "\[Rule]", "0"}], ",", 
                   RowBox[{"PlotStyle", "\[Rule]", 
                    RowBox[{"Directive", "[", 
                    RowBox[{"Thick", ",", " ", 
                    RowBox[{"PointSize", "[", "Large", "]"}]}], "]"}]}], ",", 
                   RowBox[{"PlotRange", "\[Rule]", 
                    RowBox[{"{", 
                    RowBox[{"0", ",", "5"}], "}"}]}]}], "]"}], ",", 
                 "\[IndentingNewLine]", "\[IndentingNewLine]", 
                 RowBox[{"Graphics", "[", 
                  RowBox[{"{", "\[IndentingNewLine]", 
                   RowBox[{
                    RowBox[{"Text", "[", 
                    RowBox[{
                    RowBox[{"Style", "[", 
                    RowBox[{
                    RowBox[{"\"\<\[Pi] = \>\"", "<>", 
                    RowBox[{"ToString", "[", 
                    RowBox[{"NumberForm", "[", 
                    RowBox[{
                    RowBox[{"N", "@", "Pi"}], ",", "10"}], "]"}], "]"}], 
                    "<>", "\"\<...\>\""}], ",", 
                    RowBox[{"FontSize", "\[Rule]", 
                    RowBox[{"Scaled", "[", ".035", "]"}]}], ",", " ", 
                    RowBox[{"FontColor", "\[Rule]", "Gray"}]}], "]"}], ",", 
                    " ", 
                    RowBox[{"{", 
                    RowBox[{"\[Pi]", ",", ".25"}], "}"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"0", ",", 
                    RowBox[{"-", "1"}]}], "}"}]}], "]"}], ",", 
                    "\[IndentingNewLine]", " ", "Gray", ",", "Thick", ",", 
                    RowBox[{"Line", "[", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"\[Pi]", ",", 
                    RowBox[{"-", ".2"}]}], "}"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"\[Pi]", ",", ".2"}], "}"}]}], "}"}], "]"}], ",", 
                    "\[IndentingNewLine]", "Orange", ",", " ", 
                    RowBox[{"Arrowheads", "[", ".03", "]"}], ",", 
                    RowBox[{"Arrow", "[", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"piSum", ",", 
                    RowBox[{"-", ".3"}]}], "}"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"piSum", ",", 
                    RowBox[{"-", ".075"}]}], "}"}]}], "}"}], "]"}], ",", " ", 
                    "\[IndentingNewLine]", 
                    RowBox[{"Text", "[", 
                    RowBox[{
                    RowBox[{"Style", "[", 
                    RowBox[{
                    RowBox[{"\"\<\[Pi] \[TildeTilde] \>\"", " ", "<>", 
                    RowBox[{"ToString", "[", 
                    RowBox[{"NumberForm", "[", 
                    RowBox[{"piSum", ",", "10"}], "]"}], "]"}]}], ",", 
                    RowBox[{"FontSize", "\[Rule]", 
                    RowBox[{"Scaled", "[", ".03", "]"}]}], ",", " ", 
                    RowBox[{"FontColor", "\[Rule]", "Orange"}]}], "]"}], ",", 
                    " ", 
                    RowBox[{"{", 
                    RowBox[{"piSum", ",", 
                    RowBox[{"-", ".3"}]}], "}"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"0", ",", "1"}], "}"}]}], "]"}]}], "}"}], "]"}]}],
                 "}"}], ",", "\[IndentingNewLine]", "\[IndentingNewLine]", 
               RowBox[{"PlotRange", "\[Rule]", 
                RowBox[{"{", 
                 RowBox[{
                  RowBox[{"{", 
                   RowBox[{"0", ",", "5"}], "}"}], ",", 
                  RowBox[{"{", 
                   RowBox[{
                    RowBox[{"-", ".5"}], ",", ".5"}], "}"}]}], "}"}]}], ",", 
               RowBox[{"ImageSize", "\[Rule]", 
                RowBox[{"Scaled", "[", "1", "]"}]}], ",", " ", 
               RowBox[{"PlotRangePadding", "\[Rule]", 
                RowBox[{"{", 
                 RowBox[{"0.5", ",", ".1"}], "}"}]}], ",", " ", 
               RowBox[{"AspectRatio", "\[Rule]", "Automatic"}]}], "]"}], ",", 
             "\[IndentingNewLine]", "\[IndentingNewLine]", 
             RowBox[{"Style", "[", 
              RowBox[{
               RowBox[{"StringForm", "[", 
                RowBox[{"\"\<\[Pi] \[TildeTilde]`` ``\>\"", ",", 
                 RowBox[{"StringJoin", "[", 
                  RowBox[{"MapIndexed", "[", 
                   RowBox[{"numFormatter", ",", 
                    RowBox[{"Take", "[", 
                    RowBox[{"piTerms", ",", 
                    RowBox[{"UpTo", "[", "maxDisplay", "]"}]}], "]"}]}], 
                   "]"}], "]"}], ",", 
                 RowBox[{"If", "[", 
                  RowBox[{
                   RowBox[{"$N", ">", "maxDisplay"}], ",", "\"\<...\>\"", 
                   ",", "\"\<\>\""}], "]"}]}], "]"}], ",", 
               RowBox[{"FontSize", "\[Rule]", 
                RowBox[{"Scaled", "[", "0.015", "]"}]}], ",", " ", 
               "\"\<Bold\>\""}], "]"}]}], "}"}], ",", " ", 
           "\[IndentingNewLine]", "\[IndentingNewLine]", 
           RowBox[{"Alignment", "\[Rule]", 
            RowBox[{"{", 
             RowBox[{"Left", ",", "Center"}], "}"}]}], ",", " ", 
           RowBox[{"ItemSize", "\[Rule]", 
            RowBox[{"Scaled", "[", ".9", "]"}]}], ",", 
           RowBox[{"Frame", "\[Rule]", 
            RowBox[{"{", 
             RowBox[{"Gray", ",", "Gray"}], "}"}]}], ",", 
           RowBox[{"Spacings", "\[Rule]", 
            RowBox[{"{", 
             RowBox[{
              RowBox[{"Scaled", "[", ".05", "]"}], ",", 
              RowBox[{"Scaled", "[", ".05", "]"}]}], "}"}]}]}], "]"}]}]}], 
       "\[IndentingNewLine]", "]"}]}]}], "\[IndentingNewLine]", "]"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"$N", ",", "0", ",", "\"\<Number of Terms: \>\""}], "}"}], ",", 
     "0", ",", "500", ",", "1", ",", 
     RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], ",", 
   RowBox[{"ContentSize", "\[Rule]", 
    RowBox[{"Scaled", "[", ".9", "]"}]}], ",", 
   RowBox[{"Alignment", "\[Rule]", "Center"}], ",", 
   RowBox[{"Deployed", "\[Rule]", "True"}], ",", 
   RowBox[{"SaveDefinitions", "\[Rule]", "True"}]}], "]"}]], "Input",
 CellChangeTimes->{{3.7901924213547115`*^9, 3.790192430176155*^9}, {
   3.7901925331696625`*^9, 3.7901925366833076`*^9}, {3.7901925716238794`*^9, 
   3.790192576413081*^9}, {3.7901926603763895`*^9, 3.790192674351053*^9}, {
   3.7901927909303083`*^9, 3.7901927930556254`*^9}, {3.7901928235610256`*^9, 
   3.790192830537468*^9}, {3.7901928752149954`*^9, 3.7901929118891473`*^9}, {
   3.7901929636414213`*^9, 3.7901929637551165`*^9}, {3.7901930112500916`*^9, 
   3.79019307325432*^9}, {3.790193128706537*^9, 3.7901931310225997`*^9}, {
   3.7901931744443*^9, 3.7901932239120607`*^9}, {3.7901932613489323`*^9, 
   3.7901932871629367`*^9}, {3.7901933832424793`*^9, 3.79019338385185*^9}, {
   3.7901934360302997`*^9, 3.790193523766485*^9}, {3.7901935667375813`*^9, 
   3.790193611569734*^9}, {3.790193667813348*^9, 3.790193687352103*^9}, {
   3.790193729027669*^9, 3.7901937971993523`*^9}, {3.7901938427086654`*^9, 
   3.790193923403904*^9}, {3.7901940190215797`*^9, 3.790194050097484*^9}, {
   3.790194085528739*^9, 3.7901941968839827`*^9}, {3.790194266041229*^9, 
   3.7901942735078435`*^9}, {3.7901943141600924`*^9, 3.790194314641952*^9}, {
   3.7901943622014356`*^9, 3.790194498330415*^9}, {3.7901945737956605`*^9, 
   3.790194657318737*^9}, {3.7901947730439663`*^9, 3.790194806639105*^9}, {
   3.7901948927089977`*^9, 3.790194954073883*^9}, {3.790195136110341*^9, 
   3.7901952882496643`*^9}, {3.7901953308143907`*^9, 3.790195532926107*^9}, {
   3.790195623029149*^9, 3.790195817009529*^9}, {3.7901958519909925`*^9, 
   3.7901959594337015`*^9}, {3.790196085049819*^9, 3.790196085164505*^9}, {
   3.790196179063484*^9, 3.790196188942102*^9}, {3.7901962212556925`*^9, 
   3.7901962576842937`*^9}, {3.7901963476478004`*^9, 
   3.7901963477525525`*^9}, {3.790197055940938*^9, 3.7901970787627068`*^9}, {
   3.7901971442366395`*^9, 3.7901972033844824`*^9}, {3.79019725060423*^9, 
   3.790197273566825*^9}, 3.790197312322196*^9, {3.7901974075894613`*^9, 
   3.7901974902065563`*^9}, {3.790197753751091*^9, 3.7901977576376953`*^9}, {
   3.790197789854029*^9, 3.790197824274996*^9}, {3.7901979872150106`*^9, 
   3.7901980482228794`*^9}, {3.7901981784336853`*^9, 3.790198189962888*^9}, {
   3.7901982305334024`*^9, 3.7901982661571193`*^9}, {3.7901983062398834`*^9, 
   3.7901983075962887`*^9}, {3.790198349890205*^9, 3.7901983513393335`*^9}, {
   3.79019851401237*^9, 3.790198531418006*^9}, {3.7901986657093067`*^9, 
   3.790198726084274*^9}, {3.7901988141670923`*^9, 3.7901988559519253`*^9}, {
   3.790198933280167*^9, 3.7901990497287884`*^9}, {3.7901990920908113`*^9, 
   3.790199210334646*^9}, {3.7901994412570705`*^9, 3.790199484782696*^9}, {
   3.7901995270247736`*^9, 3.7901995337039275`*^9}, {3.790199635330815*^9, 
   3.79019967659151*^9}, {3.7901997429403753`*^9, 3.7901997708258033`*^9}, {
   3.7902000082507067`*^9, 3.79020002391879*^9}},
 CellLabel->
  "In[160]:=",ExpressionUUID->"5f074d7d-2d91-4003-b4dc-21573739a4c5"],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`$N$$ = 0, Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`$N$$], 0, "Number of Terms: "}, 0, 500, 1}}, 
    Typeset`size$$ = {1111., {168.5, 174.5}}, Typeset`update$$ = 0, 
    Typeset`initDone$$, Typeset`skipInitDone$$ = 
    True, $CellContext`$N$257846$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, "Variables" :> {$CellContext`$N$$ = 0}, 
      "ControllerVariables" :> {
        Hold[$CellContext`$N$$, $CellContext`$N$257846$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      Module[{$CellContext`piTerm$, $CellContext`piDemo$}, \
$CellContext`piTerm$[
           Pattern[$CellContext`k, 
            Blank[]]] := 
         4 ((-1)^($CellContext`k + 1)/(2 $CellContext`k - 
           1)); $CellContext`piTerm$[0] = 0; 
        Module[{$CellContext`piTerms$, $CellContext`piSum$, \
$CellContext`numFormatter$, $CellContext`maxDisplay$ = 
           18}, $CellContext`piTerms$ = Table[
             $CellContext`piTerm$[$CellContext`i], {$CellContext`i, 
              0, $CellContext`$N$$}]; $CellContext`piSum$ = Total[
             N[$CellContext`piTerms$]]; $CellContext`numFormatter$[
             Pattern[$CellContext`num, 
              Blank[]], {
              Pattern[$CellContext`index, 
               Blank[]]}] := StringJoin[
             If[
              And[$CellContext`index > 1, $CellContext`num >= 0], " + ", " "], 
             ToString[
              TraditionalForm[$CellContext`num]]]; Column[{
             Show[{
               NumberLinePlot[
                Interval[{$CellContext`piSum$, Pi}], Spacings -> 0, PlotStyle -> 
                Directive[Thick, 
                  PointSize[Large]], PlotRange -> {0, 5}], 
               Graphics[{
                 Text[
                  Style[
                   StringJoin["\[Pi] = ", 
                    ToString[
                    NumberForm[
                    N[Pi], 10]], "..."], FontSize -> Scaled[0.035], FontColor -> 
                   Gray], {Pi, 0.25}, {0, -1}], Gray, Thick, 
                 Line[{{Pi, -0.2}, {Pi, 0.2}}], Orange, 
                 Arrowheads[0.03], 
                 
                 Arrow[{{$CellContext`piSum$, -0.3}, {$CellContext`piSum$, \
-0.075}}], 
                 Text[
                  Style[
                   StringJoin["\[Pi] \[TildeTilde] ", 
                    ToString[
                    NumberForm[$CellContext`piSum$, 10]]], FontSize -> 
                   Scaled[0.03], FontColor -> 
                   Orange], {$CellContext`piSum$, -0.3}, {0, 1}]}]}, 
              PlotRange -> {{0, 5}, {-0.5, 0.5}}, ImageSize -> Scaled[1], 
              PlotRangePadding -> {0.5, 0.1}, AspectRatio -> Automatic], 
             Style[
              StringForm["\[Pi] \[TildeTilde]`` ``", 
               StringJoin[
                MapIndexed[$CellContext`numFormatter$, 
                 Take[$CellContext`piTerms$, 
                  UpTo[$CellContext`maxDisplay$]]]], 
               If[$CellContext`$N$$ > $CellContext`maxDisplay$, "...", ""]], 
              FontSize -> Scaled[0.015], "Bold"]}, 
            Alignment -> {Left, Center}, ItemSize -> Scaled[0.9], 
            Frame -> {Gray, Gray}, Spacings -> {
              Scaled[0.05], 
              Scaled[0.05]}]]], 
      "Specifications" :> {{{$CellContext`$N$$, 0, "Number of Terms: "}, 0, 
         500, 1, Appearance -> "Labeled"}}, 
      "Options" :> {
       ContentSize -> Scaled[0.9], Alignment -> Center, Deployed -> True}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{1269., {214., 220.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    SynchronousInitialization->True,
    UndoTrackedVariables:>{Typeset`show$$, Typeset`bookmarkMode$$},
    UnsavedVariables:>{Typeset`initDone$$},
    UntrackedVariables:>{Typeset`size$$}], "Manipulate",
   Deployed->True,
   StripOnInput->False],
  Manipulate`InterpretManipulate[1]]], "Output",
 CellChangeTimes->{
  3.790192431840692*^9, 3.7901925386440234`*^9, {3.7901926644595013`*^9, 
   3.7901926766469154`*^9}, 3.7901927934854455`*^9, 3.7901928309623227`*^9, 
   3.7901928779875827`*^9, 3.7901929646088333`*^9, {3.790193012353137*^9, 
   3.7901930736303473`*^9}, 3.7901931316748223`*^9, {3.790193178234164*^9, 
   3.790193224669035*^9}, {3.7901932627163033`*^9, 3.790193287908906*^9}, 
   3.7901933845349903`*^9, 3.790193464232666*^9, {3.7901934943830805`*^9, 
   3.790193524609229*^9}, 3.790193577511772*^9, 3.790193612670761*^9, {
   3.790193668667065*^9, 3.7901936948171444`*^9}, 3.7901937298265343`*^9, {
   3.790193783941833*^9, 3.790193797902505*^9}, {3.7901939016789856`*^9, 
   3.79019392404222*^9}, {3.7901940930117254`*^9, 3.790194163637908*^9}, 
   3.790194197667887*^9, 3.7901942745909195`*^9, 3.790194315241317*^9, {
   3.790194372994547*^9, 3.790194456595009*^9}, {3.7901944879232407`*^9, 
   3.7901944991103277`*^9}, {3.7901946214152975`*^9, 3.790194657979002*^9}, {
   3.7901947769365263`*^9, 3.790194807132783*^9}, {3.7901952005929213`*^9, 
   3.7901952887193785`*^9}, {3.7901953368931646`*^9, 3.790195398371744*^9}, 
   3.7901955470413637`*^9, 3.7901956303895006`*^9, {3.7901957086083813`*^9, 
   3.79019576636793*^9}, {3.7901957965612154`*^9, 3.790195818216302*^9}, {
   3.7901958526731677`*^9, 3.7901959598416095`*^9}, 3.790196189535482*^9, {
   3.790196223902591*^9, 3.790196258474182*^9}, 3.7901963484835663`*^9, {
   3.790197058516348*^9, 3.7901970794149632`*^9}, {3.7901971461953993`*^9, 
   3.7901972038592153`*^9}, {3.7901972531354284`*^9, 3.7901972739697475`*^9}, 
   3.7901973129624844`*^9, {3.7901974094704313`*^9, 3.7901974908238707`*^9}, 
   3.790197758236096*^9, {3.790197794382893*^9, 3.7901978251137533`*^9}, {
   3.7901979884816203`*^9, 3.790198012007683*^9}, 3.790198048868121*^9, 
   3.7901981906220865`*^9, {3.7901982378767667`*^9, 3.790198267019809*^9}, 
   3.7901983082315893`*^9, 3.7901983521092587`*^9, {3.790198682390112*^9, 
   3.790198702101403*^9}, {3.790198828992981*^9, 3.7901988563947105`*^9}, {
   3.7901989760497975`*^9, 3.7901990026526647`*^9}, {3.790199034097587*^9, 
   3.7901990508617587`*^9}, 3.7901990957590027`*^9, {3.790199127580953*^9, 
   3.7901991660840006`*^9}, 3.7901992106807528`*^9, {3.790199240713417*^9, 
   3.79019924282979*^9}, {3.7901994712239184`*^9, 3.7901994854259434`*^9}, 
   3.7901995345506573`*^9, {3.7901996466725125`*^9, 3.7901996942313533`*^9}, {
   3.790199746948659*^9, 3.7901997715129757`*^9}, {3.790200010610383*^9, 
   3.790200024891198*^9}},
 CellLabel->
  "Out[160]=",ExpressionUUID->"fb10c21a-e6aa-4c46-a0e2-69bfbd9c4315"]
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
Cell[1510, 35, 156, 3, 67, "Section",ExpressionUUID->"3919f765-62bc-401d-a39f-ab73880cac0c"],
Cell[1669, 40, 251, 6, 34, "Text",ExpressionUUID->"cd56b7db-403e-49bd-897d-4c410fe4b212"],
Cell[CellGroupData[{
Cell[1945, 50, 11579, 233, 490, "Input",ExpressionUUID->"5f074d7d-2d91-4003-b4dc-21573739a4c5"],
Cell[13527, 285, 7037, 131, 453, "Output",ExpressionUUID->"fb10c21a-e6aa-4c46-a0e2-69bfbd9c4315"]
}, {2}]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature #uD@NzFCLEGUsD10gtDzg7wX *)
