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
NotebookDataLength[     36751,        771]
NotebookOptionsPosition[     37032,        764]
NotebookOutlinePosition[     37375,        779]
CellTagsIndexPosition[     37332,        776]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Fun with Epicycles", "Section",
 CellChangeTimes->{{3.790203395894437*^9, 3.7902034001600623`*^9}, {
  3.790214711840856*^9, 
  3.790214723105734*^9}},ExpressionUUID->"bd01c9c5-ca19-4f36-b911-\
e3d2c69e44c0"],

Cell["\<\
Use the \[OpenCurlyDoubleQuote]Number of Spinners\[CloseCurlyDoubleQuote] \
slider to control the number of spinners that add up to make the final shape.
Use the \[OpenCurlyDoubleQuote]Time\[CloseCurlyDoubleQuote] slider to see \
your drawing unfold!  You can animate the slider using the play arrow next to \
it.
Change the speeds, radii, and initial angles of each circle with the sliders \
below.\
\>", "Text",
 CellChangeTimes->{{3.7903477150592127`*^9, 3.7903477489954867`*^9}, {
  3.7903477893011646`*^9, 
  3.79034786172556*^9}},ExpressionUUID->"5e5665d3-d1c2-44db-8a2f-\
840b91a7bcfa"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Manipulate", "[", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"With", "[", 
    RowBox[{
     RowBox[{"{", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"circList", " ", "=", " ", 
        RowBox[{
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{"speed", "[", "#", "]"}], ",", 
            RowBox[{"rad", "[", "#", "]"}], ",", 
            RowBox[{"angle", "[", "#", "]"}]}], "}"}], "&"}], "/@", 
         RowBox[{"Range", "[", 
          RowBox[{"1", ",", "$N"}], "]"}]}]}], ",", "\[IndentingNewLine]", 
       RowBox[{"speedControls", " ", "=", " ", 
        RowBox[{"Sequence", "@@", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"{", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"speed", "[", "#", "]"}], ",", "#", ",", "\"\<\>\""}],
                "}"}], ",", "0", ",", "10", ",", "1", ",", 
              RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], 
            "&"}], "/@", 
           RowBox[{"Range", "[", 
            RowBox[{"1", ",", "$N"}], "]"}]}], ")"}]}]}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"radControls", " ", "=", " ", 
        RowBox[{"Sequence", "@@", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"{", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"rad", "[", "#", "]"}], ",", 
                RowBox[{"10.", "/", "#"}], ",", "\"\<\>\""}], "}"}], ",", "0",
               ",", "10", ",", 
              RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], 
            "&"}], "/@", 
           RowBox[{"Range", "[", 
            RowBox[{"1", ",", "$N"}], "]"}]}], ")"}]}]}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"angControls", " ", "=", " ", 
        RowBox[{"Sequence", "@@", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"{", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"angle", "[", "#", "]"}], ",", "0", ",", "\"\<\>\""}],
                "}"}], ",", "0", ",", 
              RowBox[{"2.", "\[Pi]"}], ",", 
              RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], 
            "&"}], "/@", 
           RowBox[{"Range", "[", 
            RowBox[{"1", ",", "$N"}], "]"}]}], ")"}]}]}]}], 
      "\[IndentingNewLine]", "}"}], ",", "\[IndentingNewLine]", 
     "\[IndentingNewLine]", 
     RowBox[{"DynamicModule", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"tFlag", "=", "None"}], "}"}], ",", 
       RowBox[{"Manipulate", "[", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{
          RowBox[{"If", "[", 
           RowBox[{
            RowBox[{"$t", ">", "0.99"}], ",", 
            RowBox[{"tFlag", "=", "1"}]}], "]"}], ";", "\[IndentingNewLine]", 
          RowBox[{"CircleBuilder", "[", 
           RowBox[{"circList", ",", "$t", ",", 
            RowBox[{"\"\<TrailLength\>\"", "\[Rule]", "1"}], ",", " ", 
            RowBox[{"\"\<Persist\>\"", "\[Rule]", "tFlag"}]}], "]"}]}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"$t", ",", "0", ",", 
             RowBox[{"Style", "[", 
              RowBox[{"\"\<Time:\>\"", ",", "20"}], "]"}]}], "}"}], ",", "0", 
           ",", "1", ",", "Animator", ",", " ", 
           RowBox[{"AnimationRunning", "\[Rule]", "False"}]}], "}"}], ",", 
         "\[IndentingNewLine]", "Delimiter", ",", "\[IndentingNewLine]", 
         RowBox[{"Style", "[", 
          RowBox[{"\"\<Speeds:\>\"", ",", "20"}], "]"}], ",", 
         "\[IndentingNewLine]", "speedControls", ",", "\[IndentingNewLine]", 
         "Delimiter", ",", "\[IndentingNewLine]", 
         RowBox[{"Style", "[", 
          RowBox[{"\"\<Radii:\>\"", ",", "20"}], "]"}], ",", 
         "\[IndentingNewLine]", "radControls", ",", "\[IndentingNewLine]", 
         "Delimiter", ",", "\[IndentingNewLine]", 
         RowBox[{"Style", "[", 
          RowBox[{"\"\<Angles:\>\"", ",", "20"}], "]"}], ",", 
         "\[IndentingNewLine]", "angControls", ",", "\[IndentingNewLine]", 
         RowBox[{"ControlPlacement", "\[Rule]", "Left"}]}], 
        "\[IndentingNewLine]", "\[IndentingNewLine]", "]"}]}], "]"}]}], "]"}],
    ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"$N", ",", "3", ",", 
       RowBox[{"Style", "[", 
        RowBox[{"\"\<Number of Spinners: \>\"", ",", "20"}], "]"}]}], "}"}], 
     ",", "1", ",", "10", ",", "1", ",", 
     RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], ",", 
   "\[IndentingNewLine]", "\[IndentingNewLine]", 
   RowBox[{"SaveDefinitions", "\[Rule]", "True"}], ",", "\[IndentingNewLine]",
    "\[IndentingNewLine]", 
   RowBox[{"Initialization", "\[RuleDelayed]", "\[IndentingNewLine]", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{
      "Get", "[", 
       "\"\<G:\\\\My Drive\\\\Projects\\\\FourierDisplay\\\\Software\>\"", 
       "]"}], ";", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"CircleBuilder", "::", "usage"}], "=", 
       "\"\<CircleBuilder[{{n,r,\[Theta]0},...},$t] Makes epicycle plot of \
cirlces at speed indices n of radii r of initial angles \[Theta]0 at time $t. \
 'TrailLength' sets length of trail in seconds.  \>\""}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"Options", "[", "CircleBuilder", "]"}], "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<TrailLength\>\"", "\[Rule]", "5"}], ",", 
         RowBox[{"\"\<ShowCircles\>\"", "\[Rule]", "True"}], ",", " ", 
         RowBox[{"\"\<PlotRange\>\"", "\[Rule]", "None"}], ",", 
         RowBox[{"\"\<Spinners\>\"", "\[Rule]", "False"}], ",", " ", 
         RowBox[{"\"\<Persist\>\"", "\[Rule]", "None"}]}], "}"}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"CircleBuilder", "[", 
        RowBox[{"circles_List", ",", " ", "$t_", ",", "  ", 
         RowBox[{"opts", ":", 
          RowBox[{"OptionsPattern", "[", 
           RowBox[{"{", 
            RowBox[{"CircleBuilder", ",", "SpinnerRow", ",", "Spinner"}], 
            "}"}], "]"}]}]}], "]"}], ":=", 
       RowBox[{"Module", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
          "terms", ",", "$points", ",", "$terms", ",", " ", "$centers", ",", 
           " ", "function", ",", "$function", ",", "$pp", ",", "$radii", ",", 
           "$N", ",", "range", ",", "$plotGraphic", ",", "$finalGraphic"}], 
          "}"}], ",", "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{
           RowBox[{"terms", "[", "t_", "]"}], ":=", " ", 
           RowBox[{"Apply", "[", 
            RowBox[{
             RowBox[{
              RowBox[{"(", 
               RowBox[{"#2", "*", 
                RowBox[{"Exp", "[", 
                 RowBox[{"I", "*", "#3"}], "]"}], "*", 
                RowBox[{"Exp", "[", 
                 RowBox[{
                  RowBox[{"-", "I"}], "*", "t", "*", "2.", "\[Pi]", "*", 
                  "#1"}], "]"}]}], ")"}], "&"}], ",", "circles", ",", 
             RowBox[{"{", "1", "}"}]}], "]"}]}], ";", "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"function", "[", "t_", "]"}], ":=", 
           RowBox[{"Total", "@", 
            RowBox[{"terms", "[", "t", "]"}]}]}], ";", "\[IndentingNewLine]", 
          RowBox[{"$pp", " ", "=", " ", 
           RowBox[{"Module", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{
               RowBox[{"trail", " ", "=", " ", 
                RowBox[{"OptionValue", "[", "\"\<TrailLength\>\"", "]"}]}], 
               ",", " ", 
               RowBox[{"persist", " ", "=", " ", 
                RowBox[{"OptionValue", "[", "\"\<Persist\>\"", "]"}]}], ",", 
               "cond"}], " ", "}"}], ",", "\[IndentingNewLine]", 
             RowBox[{
              RowBox[{"cond", "=", 
               RowBox[{"If", "[", 
                RowBox[{
                 RowBox[{"persist", "===", "None"}], ",", 
                 RowBox[{"{", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"(", 
                    RowBox[{"$t", "-", "trail"}], ")"}], "*", 
                    RowBox[{"HeavisideTheta", "[", 
                    RowBox[{"$t", "-", "trail"}], "]"}]}], ",", " ", "$t"}], 
                  "}"}], ",", 
                 RowBox[{"{", 
                  RowBox[{"0", ",", "persist"}], "}"}]}], "]"}]}], " ", ";", 
              "\[IndentingNewLine]", 
              RowBox[{"If", "[", 
               RowBox[{
                RowBox[{"$t", ">", "0"}], ",", 
                RowBox[{"ParametricPlot", "[", 
                 RowBox[{
                  RowBox[{"ReIm", "@", 
                   RowBox[{"function", "[", "t", "]"}]}], ",", " ", 
                  RowBox[{"{", 
                   RowBox[{"t", ",", 
                    RowBox[{"First", "@", "cond"}], ",", 
                    RowBox[{"Last", "@", "cond"}]}], "}"}], ",", 
                  RowBox[{"Evaluated", " ", "->", " ", "True"}], ",", " ", 
                  RowBox[{"Axes", " ", "->", " ", "None"}], ",", " ", 
                  RowBox[{"PlotRange", " ", "->", " ", "All"}]}], "]"}], ",", 
                RowBox[{"{", "}"}]}], "]"}]}]}], "]"}]}], ";", 
          "\[IndentingNewLine]", 
          RowBox[{"$terms", " ", "=", " ", 
           RowBox[{"terms", "[", "$t", "]"}]}], ";", "\[IndentingNewLine]", 
          RowBox[{"$points", " ", "=", " ", 
           RowBox[{"Prepend", "[", 
            RowBox[{
             RowBox[{"ReIm", "@", 
              RowBox[{"Accumulate", "@", "$terms"}]}], ",", 
             RowBox[{"{", 
              RowBox[{"0", ",", "0"}], "}"}]}], "]"}]}], ";", 
          "\[IndentingNewLine]", 
          RowBox[{"$centers", " ", "=", " ", 
           RowBox[{"Drop", "[", 
            RowBox[{"$points", ",", 
             RowBox[{"-", "1"}]}], "]"}]}], ";", "\[IndentingNewLine]", 
          RowBox[{"$radii", " ", "=", 
           RowBox[{"Abs", "/@", 
            RowBox[{"circles", "[", 
             RowBox[{"[", 
              RowBox[{"All", ",", "2"}], "]"}], "]"}]}]}], ";", 
          "\[IndentingNewLine]", 
          RowBox[{"$N", "=", 
           RowBox[{"Length", "@", "circles"}]}], ";", "\[IndentingNewLine]", 
          RowBox[{"range", " ", "=", " ", 
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{
              RowBox[{"OptionValue", "[", "\"\<PlotRange\>\"", "]"}], "===", 
              "None"}], ",", 
             RowBox[{"Total", "@", "$radii"}], ",", 
             RowBox[{"OptionValue", "[", "PlotRange", "]"}]}], "]"}]}], ";", 
          "\[IndentingNewLine]", 
          RowBox[{"$plotGraphic", " ", "=", " ", 
           RowBox[{"Show", "[", 
            RowBox[{
             RowBox[{"Graphics", "[", "\n", "\t\t\t\t", 
              RowBox[{"If", "[", 
               RowBox[{
                RowBox[{"TrueQ", "[", 
                 RowBox[{"OptionValue", "[", "\"\<ShowCircles\>\"", "]"}], 
                 "]"}], ",", "\n", "\t\t\t\t\t", 
                RowBox[{"Table", "[", 
                 RowBox[{
                  RowBox[{"{", 
                   RowBox[{"Circle", "[", 
                    RowBox[{
                    RowBox[{"$centers", "[", 
                    RowBox[{"[", "i", "]"}], "]"}], ",", " ", 
                    RowBox[{"$radii", "[", 
                    RowBox[{"[", "i", "]"}], "]"}]}], "]"}], "}"}], ",", 
                  RowBox[{"{", 
                   RowBox[{"i", ",", "1", ",", " ", "$N"}], "}"}]}], "]"}], 
                ",", "\n", "\t\t\t\t\t", 
                RowBox[{"{", "}"}]}], "]"}], "\n", "\t\t\t\t\t", "]"}], ",", 
             " ", "\n", "\t\t\t", "$pp", ",", "\n", "\t\t\t", 
             RowBox[{"Graphics", "[", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{"AbsoluteThickness", "[", "1", "]"}], ",", " ", 
                RowBox[{"Line", "[", "$points", "]"}], ",", " ", 
                RowBox[{"AbsolutePointSize", "[", "5", "]"}], ",", " ", 
                RowBox[{"Point", "[", "$points", "]"}]}], "}"}], "]"}], ",", 
             "\n", "\t\t\t", 
             RowBox[{"PlotRange", " ", "->", " ", "range"}], ",", " ", 
             RowBox[{"PlotRangePadding", "\[Rule]", 
              RowBox[{"Scaled", "[", ".05", "]"}]}]}], "]"}]}], ";", 
          "\[IndentingNewLine]", 
          RowBox[{"Return", "[", "$plotGraphic", "]"}]}]}], "]"}]}], ";"}], 
     ")"}]}]}], "]"}]], "Input",
 CellChangeTimes->{{3.7889527402053576`*^9, 3.7889527725718284`*^9}, {
   3.788952902153372*^9, 3.788952905578216*^9}, {3.788952964338123*^9, 
   3.788952981717658*^9}, {3.788953194562581*^9, 3.7889532011220207`*^9}, {
   3.7889532542011147`*^9, 3.7889534346975555`*^9}, {3.7889776705743427`*^9, 
   3.7889776714948835`*^9}, {3.7902034553076077`*^9, 
   3.7902035579242296`*^9}, {3.7902036359934406`*^9, 
   3.7902036712482147`*^9}, {3.790203725379469*^9, 3.790203801453054*^9}, {
   3.790203955952938*^9, 3.790204023984078*^9}, {3.790204089078023*^9, 
   3.7902041537241535`*^9}, {3.7902042577490044`*^9, 3.790204291436924*^9}, {
   3.7902043237844453`*^9, 3.790204341646697*^9}, {3.7902045910459585`*^9, 
   3.7902046644366856`*^9}, {3.7902047273953743`*^9, 3.7902049390264964`*^9}, 
   3.790205033817039*^9, {3.790205067625641*^9, 3.790205074311759*^9}, {
   3.7902051851893005`*^9, 3.790205186185623*^9}, 3.7902053478742833`*^9, {
   3.790205451148142*^9, 3.7902054525474014`*^9}, {3.790205540667927*^9, 
   3.7902055626145287`*^9}, 3.7902057505243306`*^9, {3.7902057870766344`*^9, 
   3.7902058437870145`*^9}, {3.7902058784353905`*^9, 3.790205895255396*^9}, {
   3.790205926548726*^9, 3.790205964024519*^9}, {3.7902060076957197`*^9, 
   3.7902060848436174`*^9}, {3.790206138195963*^9, 3.790206236840294*^9}, {
   3.79020645171867*^9, 3.790206454583033*^9}, {3.790206531733708*^9, 
   3.790206536174865*^9}, {3.7902065941888914`*^9, 3.7902066694426727`*^9}, {
   3.7902067098057127`*^9, 3.7902067251715407`*^9}, {3.790206792563344*^9, 
   3.7902068557952585`*^9}, {3.7902068947561007`*^9, 
   3.7902068983983517`*^9}, {3.790206990814249*^9, 3.790206995941533*^9}, 
   3.790207095511266*^9, 3.7902071760630035`*^9, {3.790207456449999*^9, 
   3.790207466008956*^9}, {3.790207505827485*^9, 3.7902075552413483`*^9}, {
   3.790207607151557*^9, 3.790207629511773*^9}, {3.7902076829817944`*^9, 
   3.7902076974550624`*^9}, 3.7902077465179434`*^9, {3.7902077789242616`*^9, 
   3.7902079429237776`*^9}, {3.7902089398648806`*^9, 3.790209081683814*^9}, {
   3.7902091238301024`*^9, 3.7902091254628153`*^9}, {3.7902091569765644`*^9, 
   3.790209299372912*^9}, {3.7902093427898254`*^9, 3.7902094353553095`*^9}, {
   3.790209619030213*^9, 3.7902096226096106`*^9}, {3.7902096710889883`*^9, 
   3.7902096835696354`*^9}, {3.790210528487441*^9, 3.7902106136529636`*^9}, {
   3.7902106612247705`*^9, 3.7902106803885336`*^9}, {3.7902109173481517`*^9, 
   3.7902109199312396`*^9}, {3.790210950209278*^9, 3.7902109845713663`*^9}, {
   3.7902111481860485`*^9, 3.7902112405002136`*^9}, {3.7902113882593517`*^9, 
   3.790211393617979*^9}, {3.7902114264612703`*^9, 3.7902114317650585`*^9}, 
   3.7902116219062214`*^9, {3.790211686865533*^9, 3.790211713697822*^9}, {
   3.79021177557734*^9, 3.7902118610487986`*^9}, {3.7902122703365607`*^9, 
   3.7902123138262787`*^9}, {3.790212417091254*^9, 3.790212433533292*^9}, {
   3.7902132945113487`*^9, 3.790213297009671*^9}, {3.790213366998499*^9, 
   3.790213409773153*^9}, 3.790213514982807*^9, 3.7902135493570848`*^9, {
   3.790213690622324*^9, 3.790213720106511*^9}, {3.7902138022359157`*^9, 
   3.790213866968397*^9}, {3.790213898874119*^9, 3.79021392661908*^9}, {
   3.7902139751113844`*^9, 3.790214075248661*^9}, {3.790214180540123*^9, 
   3.7902142136078463`*^9}, {3.790214279509635*^9, 3.790214349228446*^9}, {
   3.790214407117655*^9, 3.7902144071784897`*^9}, {3.790214463076024*^9, 
   3.790214491484065*^9}, {3.790214665923601*^9, 3.790214667382699*^9}},
 CellLabel->"In[5]:=",ExpressionUUID->"b1ac9933-de9d-4229-be86-74a7c0ee59f6"],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`$N$$ = 3, Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`$N$$], 3, 
       Style["Number of Spinners: ", 20]}, 1, 10, 1}}, Typeset`size$$ = {
    793., {219., 225.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = False, $CellContext`$N$28943$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, "Variables" :> {$CellContext`$N$$ = 3}, 
      "ControllerVariables" :> {
        Hold[$CellContext`$N$$, $CellContext`$N$28943$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> With[{$CellContext`circList = Map[{
            $CellContext`speed[#], 
            $CellContext`rad[#], 
            $CellContext`angle[#]}& , 
           Range[1, $CellContext`$N$$]], $CellContext`speedControls = 
         Apply[Sequence, 
           Map[{{
              $CellContext`speed[#], #, ""}, 0, 10, 1, Appearance -> 
             "Labeled"}& , 
            Range[1, $CellContext`$N$$]]], $CellContext`radControls = 
         Apply[Sequence, 
           Map[{{
              $CellContext`rad[#], 10./#, ""}, 0, 10, Appearance -> 
             "Labeled"}& , 
            Range[1, $CellContext`$N$$]]], $CellContext`angControls = 
         Apply[Sequence, 
           Map[{{
              $CellContext`angle[#], 0, ""}, 0, 2. Pi, Appearance -> 
             "Labeled"}& , 
            Range[1, $CellContext`$N$$]]]}, 
        DynamicModule[{$CellContext`tFlag = None}, 
         Manipulate[
         If[$CellContext`$t > 0.99, $CellContext`tFlag = 
            1]; $CellContext`CircleBuilder[$CellContext`circList, \
$CellContext`$t, "TrailLength" -> 1, 
            "Persist" -> $CellContext`tFlag], {{$CellContext`$t, 0, 
            Style["Time:", 20]}, 0, 1, Animator, AnimationRunning -> False}, 
          Delimiter, 
          Style["Speeds:", 20], $CellContext`speedControls, Delimiter, 
          Style["Radii:", 20], $CellContext`radControls, Delimiter, 
          Style["Angles:", 20], $CellContext`angControls, ControlPlacement -> 
          Left]]], "Specifications" :> {{{$CellContext`$N$$, 3, 
          Style["Number of Spinners: ", 20]}, 1, 10, 1, Appearance -> 
         "Labeled"}}, "Options" :> {}, "DefaultOptions" :> {}],
     ImageSizeCache->{844., {266., 272.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    Initialization:>({{$CellContext`CircleBuilder[
           Pattern[$CellContext`circles, 
            Blank[List]], 
           Pattern[$CellContext`$t, 
            Blank[]], 
           Pattern[$CellContext`opts, 
            
            OptionsPattern[{$CellContext`CircleBuilder, 
              FourierPack`SpinnerRow, FourierPack`Spinner}]]] := 
         Module[{$CellContext`terms, $CellContext`$points, \
$CellContext`$terms, $CellContext`$centers, $CellContext`function, \
$CellContext`$function, $CellContext`$pp, $CellContext`$radii, \
$CellContext`$N, $CellContext`range, $CellContext`$plotGraphic, \
$CellContext`$finalGraphic}, $CellContext`terms[
              Pattern[$CellContext`t, 
               Blank[]]] := 
            Apply[#2 Exp[I #3] 
              Exp[(-I) $CellContext`t 2. Pi #]& , $CellContext`circles, {
              1}]; $CellContext`function[
              Pattern[$CellContext`t, 
               Blank[]]] := Total[
              $CellContext`terms[$CellContext`t]]; $CellContext`$pp = 
            Module[{$CellContext`trail = 
               OptionValue["TrailLength"], $CellContext`persist = 
               OptionValue["Persist"], $CellContext`cond}, $CellContext`cond = 
               If[$CellContext`persist === 
                 None, {($CellContext`$t - $CellContext`trail) 
                  
                  HeavisideTheta[$CellContext`$t - $CellContext`trail], \
$CellContext`$t}, {0, $CellContext`persist}]; If[$CellContext`$t > 0, 
                ParametricPlot[
                 ReIm[
                  $CellContext`function[$CellContext`t]], {$CellContext`t, 
                  First[$CellContext`cond], 
                  Last[$CellContext`cond]}, Evaluated -> True, Axes -> None, 
                 PlotRange -> 
                 All], {}]]; $CellContext`$terms = \
$CellContext`terms[$CellContext`$t]; $CellContext`$points = Prepend[
              ReIm[
               Accumulate[$CellContext`$terms]], {0, 
              0}]; $CellContext`$centers = 
            Drop[$CellContext`$points, -1]; $CellContext`$radii = Map[Abs, 
              Part[$CellContext`circles, All, 2]]; $CellContext`$N = 
            Length[$CellContext`circles]; $CellContext`range = 
            If[OptionValue["PlotRange"] === None, 
              Total[$CellContext`$radii], 
              OptionValue[PlotRange]]; $CellContext`$plotGraphic = Show[
              Graphics[
               If[
                TrueQ[
                 OptionValue["ShowCircles"]], 
                Table[{
                  Circle[
                   Part[$CellContext`$centers, $CellContext`i], 
                   
                   Part[$CellContext`$radii, $CellContext`i]]}, \
{$CellContext`i, 1, $CellContext`$N}], {}]], $CellContext`$pp, 
              Graphics[{
                AbsoluteThickness[1], 
                Line[$CellContext`$points], 
                AbsolutePointSize[5], 
                Point[$CellContext`$points]}], 
              PlotRange -> $CellContext`range, PlotRangePadding -> 
              Scaled[0.05]]; Return[$CellContext`$plotGraphic]], 
         Options[$CellContext`CircleBuilder] = {
          "TrailLength" -> 5, "ShowCircles" -> True, "PlotRange" -> None, 
           "Spinners" -> False, "Persist" -> None}, 
         TagSet[$CellContext`CircleBuilder, 
          MessageName[$CellContext`CircleBuilder, "usage"], 
          
          "CircleBuilder[{{n,r,\[Theta]0},...},$t] Makes epicycle plot of \
cirlces at speed indices n of radii r of initial angles \[Theta]0 at time $t. \
 'TrailLength' sets length of trail in seconds.  "], FourierPack`SpinnerRow[
           Pattern[FourierPack`Private`circlesObject, 
            Blank[Association]], 
           Pattern[FourierPack`Private`$t, 
            Blank[]], 
           Pattern[FourierPack`Private`opts, 
            OptionsPattern[{FourierPack`SpinnerRow, FourierPack`Spinner}]]] := 
         Module[{FourierPack`Private`spinList, 
            FourierPack`Private`spinListTrunc, FourierPack`Private`maxRad, 
            FourierPack`Private`row}, FourierPack`Private`spinList = Transpose[
              ({
               Slot["Coefficients"], 
               Slot["Speeds"]}& )[FourierPack`Private`circlesObject]]; 
           FourierPack`Private`spinListTrunc = 
            With[{FourierPack`Private`$N = OptionValue["NumSpinners"]}, 
              If[
              FourierPack`Private`$N === None, FourierPack`Private`spinList, 
               Take[FourierPack`Private`spinList, 
                UpTo[FourierPack`Private`$N]]]]; 
           FourierPack`Private`maxRad = Max[
              Map[Abs, 
               Map[First, FourierPack`Private`spinList]]]; 
           FourierPack`Private`row = 
            Map[FourierPack`Spinner[#, FourierPack`Private`$t, "MaxRadius" -> 
               FourierPack`Private`maxRad, 
               FilterRules[{FourierPack`Private`opts}, 
                Options[FourierPack`Spinner]]]& , 
              FourierPack`Private`spinListTrunc]; GraphicsRow[
             If[
             Length[FourierPack`Private`spinList] > 
              OptionValue["NumSpinners"], 
              Append[FourierPack`Private`row, 
               Graphics[
                Text[
                 Style[
                 "...", "Title", FontColor -> 
                  Part[FourierPack`Private`$themeColors, 5]]]]], 
              FourierPack`Private`row], ImageSize -> Scaled[0.8]]], 
         Options[FourierPack`SpinnerRow] = {"NumSpinners" -> None}, 
         TagSet[FourierPack`SpinnerRow, 
          MessageName[FourierPack`SpinnerRow, "usage"], 
          "SpinnerRow[circlesObject,$t]. Set 'NumSpinners' to set number of \
spinners in the row. Takes Spinner options."], FourierPack`Spinner[{
            Pattern[FourierPack`Private`coef, 
             Blank[]], 
            Pattern[FourierPack`Private`\[Omega], 
             Blank[]]}, 
           Pattern[FourierPack`Private`$t, 
            Blank[]], 
           OptionsPattern[]] := 
         With[{FourierPack`Private`func = 
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
           0.6431372549019608, 0.29411764705882354`, 0.1568627450980392]}}; (
        Get["G:\\My Drive\\Projects\\FourierDisplay\\Software"]; 
        MessageName[$CellContext`CircleBuilder, "usage"] = 
         "CircleBuilder[{{n,r,\[Theta]0},...},$t] Makes epicycle plot of \
cirlces at speed indices n of radii r of initial angles \[Theta]0 at time $t. \
 'TrailLength' sets length of trail in seconds.  "; 
        Options[$CellContext`CircleBuilder] = {
          "TrailLength" -> 5, "ShowCircles" -> True, "PlotRange" -> None, 
           "Spinners" -> False, "Persist" -> None}; $CellContext`CircleBuilder[
           Pattern[$CellContext`circles, 
            Blank[List]], 
           Pattern[$CellContext`$t, 
            Blank[]], 
           Pattern[$CellContext`opts, 
            
            OptionsPattern[{$CellContext`CircleBuilder, 
              FourierPack`SpinnerRow, FourierPack`Spinner}]]] := 
         Module[{$CellContext`terms, $CellContext`$points, \
$CellContext`$terms, $CellContext`$centers, $CellContext`function, \
$CellContext`$function, $CellContext`$pp, $CellContext`$radii, \
$CellContext`$N, $CellContext`range, $CellContext`$plotGraphic, \
$CellContext`$finalGraphic}, $CellContext`terms[
              Pattern[$CellContext`t, 
               Blank[]]] := 
            Apply[#2 Exp[I #3] 
              Exp[(-I) $CellContext`t 2. Pi #]& , $CellContext`circles, {
              1}]; $CellContext`function[
              Pattern[$CellContext`t, 
               Blank[]]] := Total[
              $CellContext`terms[$CellContext`t]]; $CellContext`$pp = 
            Module[{$CellContext`trail = 
               OptionValue["TrailLength"], $CellContext`persist = 
               OptionValue["Persist"], $CellContext`cond}, $CellContext`cond = 
               If[$CellContext`persist === 
                 None, {($CellContext`$t - $CellContext`trail) 
                  HeavisideTheta[$CellContext`$t - $CellContext`trail], \
$CellContext`$t}, {0, $CellContext`persist}]; If[$CellContext`$t > 0, 
                ParametricPlot[
                 ReIm[
                  $CellContext`function[$CellContext`t]], {$CellContext`t, 
                  First[$CellContext`cond], 
                  Last[$CellContext`cond]}, Evaluated -> True, Axes -> None, 
                 PlotRange -> 
                 All], {}]]; $CellContext`$terms = \
$CellContext`terms[$CellContext`$t]; $CellContext`$points = Prepend[
              ReIm[
               Accumulate[$CellContext`$terms]], {0, 
              0}]; $CellContext`$centers = 
            Drop[$CellContext`$points, -1]; $CellContext`$radii = Map[Abs, 
              Part[$CellContext`circles, All, 2]]; $CellContext`$N = 
            Length[$CellContext`circles]; $CellContext`range = 
            If[OptionValue["PlotRange"] === None, 
              Total[$CellContext`$radii], 
              OptionValue[PlotRange]]; $CellContext`$plotGraphic = Show[
              Graphics[
               If[
                TrueQ[
                 OptionValue["ShowCircles"]], 
                Table[{
                  Circle[
                   Part[$CellContext`$centers, $CellContext`i], 
                   
                   Part[$CellContext`$radii, $CellContext`i]]}, \
{$CellContext`i, 1, $CellContext`$N}], {}]], $CellContext`$pp, 
              Graphics[{
                AbsoluteThickness[1], 
                Line[$CellContext`$points], 
                AbsolutePointSize[5], 
                Point[$CellContext`$points]}], 
              PlotRange -> $CellContext`range, PlotRangePadding -> 
              Scaled[0.05]]; Return[$CellContext`$plotGraphic]]; Null)}; 
     Typeset`initDone$$ = True),
    SynchronousInitialization->True,
    UndoTrackedVariables:>{Typeset`show$$, Typeset`bookmarkMode$$},
    UnsavedVariables:>{Typeset`initDone$$},
    UntrackedVariables:>{Typeset`size$$}], "Manipulate",
   Deployed->True,
   StripOnInput->False],
  Manipulate`InterpretManipulate[1]]], "Output",
 CellChangeTimes->{3.7902147744075265`*^9, 3.7903476840531235`*^9, 
  3.790347967015272*^9},
 CellLabel->"Out[5]=",ExpressionUUID->"2fde80c9-a4ce-4755-8bbc-5a7bddca351e"]
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
Cell[1510, 35, 214, 4, 67, "Section",ExpressionUUID->"bd01c9c5-ca19-4f36-b911-e3d2c69e44c0"],
Cell[1727, 41, 603, 12, 78, "Text",ExpressionUUID->"5e5665d3-d1c2-44db-8a2f-840b91a7bcfa"],
Cell[CellGroupData[{
Cell[2355, 57, 16161, 334, 1055, "Input",ExpressionUUID->"b1ac9933-de9d-4229-be86-74a7c0ee59f6"],
Cell[18519, 393, 18488, 367, 557, "Output",ExpressionUUID->"2fde80c9-a4ce-4755-8bbc-5a7bddca351e"]
}, {2}]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature Mw0yO3D2o038ADwmusxdPRoR *)
