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
NotebookDataLength[    151202,       2685]
NotebookOptionsPosition[    151482,       2678]
NotebookOutlinePosition[    151824,       2693]
CellTagsIndexPosition[    151781,       2690]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Signature Series", "Section",
 CellChangeTimes->{{3.7900318375808716`*^9, 3.7900318385393047`*^9}, {
  3.7903470956227674`*^9, 
  3.7903470974578614`*^9}},ExpressionUUID->"7ea3bc34-4dc0-45ff-8e34-\
04b86fd2ddbf"],

Cell["\<\
Use the \[OpenCurlyDoubleQuote]Browse\[CloseCurlyDoubleQuote] button to \
upload a picture of your signature or other shape!  Use a dark, thin pen or \
pencil on a light background.

In your drawing, try to connect the start and end points so you get a nice, \
continuous curve.\
\>", "Text",
 CellChangeTimes->{{3.7903471007969713`*^9, 3.7903472120677*^9}, {
  3.7903472497477837`*^9, 3.790347323646196*^9}, {3.7903473605256047`*^9, 
  3.790347365943153*^9}},ExpressionUUID->"e64c8eee-5740-4f91-8b4f-\
1ba5c8e496bc"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Manipulate", "[", 
  RowBox[{
   RowBox[{"DynamicModule", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"defaultImage", " ", "=", 
        RowBox[{"images", "[", "\"\<JohnHancock\>\"", "]"}]}], ",", "image", 
       ",", " ", "processFunc", ",", " ", "points", ",", " ", "pointsTour", 
       ",", "sample", ",", "coefObject", ",", "circleObject", ",", 
       "circleObjectTrunc", ",", " ", "innerMan"}], "}"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"image", " ", "=", " ", 
       RowBox[{"If", "[", 
        RowBox[{
         RowBox[{"imagePath", "===", "None"}], ",", "defaultImage", ",", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"processFunc", " ", "=", " ", 
           RowBox[{
            RowBox[{"ImageResize", "[", 
             RowBox[{
              RowBox[{"ImageAdjust", "[", 
               RowBox[{"#", ",", 
                RowBox[{"{", 
                 RowBox[{"1", ",", ".5"}], "}"}]}], "]"}], ",", "500"}], 
             "]"}], "&"}]}], ";", "\[IndentingNewLine]", 
          RowBox[{"processFunc", "@", 
           RowBox[{"Import", "[", "imagePath", "]"}]}]}]}], "]"}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{"points", " ", "=", " ", 
       RowBox[{"ImageLinePoints", "@", "image"}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{"pointsTour", " ", "=", " ", 
       RowBox[{"MakeTour", "[", "points", "]"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"sample", " ", "=", " ", 
       RowBox[{
        RowBox[{
         RowBox[{"UniformResample", "[", 
          RowBox[{
           RowBox[{"PrependIndices", "[", 
            RowBox[{"#", ",", 
             RowBox[{
             "\"\<ParametrizationType\>\"", "\[Rule]", 
              "\"\<EuclidianDistance\>\""}]}], "]"}], ",", "500", ",", 
           RowBox[{
           "\"\<ParametrizationType\>\"", "\[Rule]", "\"\<Linear\>\""}]}], 
          "]"}], "&"}], "@", "pointsTour"}]}], ";", "\[IndentingNewLine]", 
      "\[IndentingNewLine]", 
      RowBox[{"innerMan", " ", "=", " ", 
       RowBox[{"Manipulate", "[", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{
          RowBox[{"coefObject", " ", "=", " ", 
           RowBox[{
            RowBox[{
             RowBox[{"CnFFT", "[", 
              RowBox[{
               RowBox[{"MakeComplex", "[", 
                RowBox[{"#", "[", "\"\<SamplePoints\>\"", "]"}], "]"}], ",", 
               " ", "numSpinners"}], "]"}], "&"}], "@", "sample"}]}], ";", 
          " ", 
          RowBox[{"(*", 
           RowBox[{
           "Takes", " ", "maxSpinners", " ", "circles", " ", "by", " ", 
            "largest", " ", "radius"}], "*)"}], "\[IndentingNewLine]", 
          RowBox[{"circleObject", " ", "=", " ", 
           RowBox[{
            RowBox[{
             RowBox[{"ApproxFunction", "[", 
              RowBox[{
               RowBox[{"#2", "[", "\"\<CoefficientFunction\>\"", "]"}], ",", 
               "t", ",", 
               RowBox[{"Length", "@", 
                RowBox[{"#1", "[", "\"\<SamplePoints\>\"", "]"}]}], ",", 
               RowBox[{"#2", "[", "\"\<CoefficientList\>\"", "]"}], ",", " ", 
               RowBox[{"\"\<Sort\>\"", "\[Rule]", "False"}]}], "]"}], "&"}], 
            "[", 
            RowBox[{"sample", ",", " ", "coefObject"}], "]"}]}], ";", 
          "\[IndentingNewLine]", 
          RowBox[{"EpicyclePlot", "[", 
           RowBox[{"circleObject", ",", 
            RowBox[{"{", 
             RowBox[{"t", ",", "0", ",", "$T", ",", " ", 
              RowBox[{"sample", "[", "\"\<Length\>\"", "]"}]}], "}"}], ",", 
            RowBox[{"\"\<Spinners\>\"", "\[Rule]", "True"}], ",", " ", 
            RowBox[{"\"\<NumSpinners\>\"", "\[Rule]", "10"}], ",", " ", 
            RowBox[{"\"\<PlotRange\>\"", "\[Rule]", "\"\<Plot\>\""}]}], 
           "]"}]}], ",", "\[IndentingNewLine]", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"$T", ",", 
             RowBox[{"sample", "[", "\"\<Length\>\"", "]"}], ",", 
             "\"\<Time\>\""}], "}"}], ",", "0", ",", 
           RowBox[{"sample", "[", "\"\<Length\>\"", "]"}]}], "}"}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
            "numSpinners", ",", "10", ",", "\"\<Number of Spinners: \>\""}], 
            "}"}], ",", "1", ",", "200", ",", "1"}], "}"}], ",", " ", 
         RowBox[{"ContinuousAction", "\[Rule]", "True"}], ",", 
         RowBox[{"TrackedSymbols", "\[RuleDelayed]", 
          RowBox[{"{", 
           RowBox[{"$T", ",", "numSpinners"}], "}"}]}]}], "]"}]}], ";", 
      "\[IndentingNewLine]", "\[IndentingNewLine]", 
      RowBox[{"Grid", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"image", ",", 
            RowBox[{"ListLinePlot", "[", 
             RowBox[{"pointsTour", ",", 
              RowBox[{"PlotRange", "\[Rule]", "All"}], ",", " ", 
              RowBox[{"AspectRatio", "\[Rule]", "Automatic"}]}], "]"}]}], 
           "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"innerMan", ",", "SpanFromLeft"}], "}"}]}], "}"}], ",", 
        RowBox[{"Alignment", "\[Rule]", "Center"}], ",", 
        RowBox[{"Frame", "\[Rule]", "All"}], ",", 
        RowBox[{"FrameStyle", "\[Rule]", "Gray"}], ",", " ", 
        RowBox[{"Spacings", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"Offset", "[", "2", "]"}], ",", 
           RowBox[{"Offset", "[", "2", "]"}]}], "}"}]}]}], "]"}]}]}], 
    "\[IndentingNewLine]", "]"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"imagePath", ",", "None", ",", "\"\<Select Image: \>\""}], 
      "}"}], ",", 
     RowBox[{
      RowBox[{"FileNameSetter", "[", "##", "]"}], "&"}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"SaveDefinitions", "\[Rule]", "True"}], ",", 
   RowBox[{"TrackedSymbols", "\[RuleDelayed]", 
    RowBox[{"{", "imagePath", "}"}]}], ",", "\[IndentingNewLine]", 
   RowBox[{"Initialization", "\[RuleDelayed]", "\[IndentingNewLine]", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{
      "Get", "[", 
       "\"\<G:\\\\My \
Drive\\\\Projects\\\\FourierDisplay\\\\Software\\\\FourierPack.wl\>\"", "]"}],
       ";", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"images", "[", "\"\<JohnHancock\>\"", "]"}], " ", "=", " ", 
       GraphicsBox[
        TagBox[RasterBox[CompressedData["
1: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
pXwFLFmypGPHjjgNo1VJ9ricHL+irsLwCfDMM89E2/KMG2OMMSZbuO+++/iN
DAMG1ias0F00yb/7oe0Bebh58+ZEoNrwmLCaUk5LA5hVkAP9+/enDIRgQU1y
yWEiuUKQNhJMI+qFFJWahpPrnXfeKVWqFMpPiQSVd/fdd/MpWrVqlYjFshSQ
PAjyCOBnhQoVmCQ2zCqDTzIPV2Nq4h1SqVqXB7P8pZde6ty5M+pEYbHyAF5+
+eU7Wgm7h6VLl5511lmhXVqyZMnQi9qhQwd6P/GkTA/Ff4R9Tt9rKN9OP/30
OXPmzJ8/H3Z7+fLlFfrL9pL0O/7445lkmya0vJDaUUhRlK1bt9YtjjnmGKjU
QoUKhYlJw2biKsidiaicPXv2OeecwzJTGodGe+jP5a/oomhuyIQ0FjlGO65S
8WgKDKBMQ39GgVVINJx83JzVyV5wX+jTkSNH1q5dOxE4LtFAaBrmbWNarbfe
eiuKGzTcjSW7iqHI5ylTpjChd6iU0dnwng8nFgYOHEihynTWukjaBUA9rFq1
6uGHH27atKnuy5uyqzOZWCJOQx0lg/+5HDs7KuD/B32vaNGifA9z2OLnpEmT
+NdQUKP+586dixeRXtrsvYntgMZFU44ZMybMJ7YXLlswxhhjcjQwJxJB2N4Z
Z5yxMybK3kO4B9+IESPozJIJfeqpp4ZRiJlHJDIrZspWIFGc2nTQoEEy/1iN
9FbgZ7ggETbPddddFwXb00SxyKWXKkzfKmtNEpumIww//Jw2bRrNS1wfJih+
rlmzhllVoZhgO8EUpFqhKVW1atULL7xQsiIRr1ENw/wyglJxIWGYVGrAgAHQ
QTDMcOW77ror5V9k74VbloQemeHDh1OcHnvssYlkHiHFzXbq1Ckb1+XtKHpG
7d3DFcRDhgxBDVPjoCZRb/iZP39+DJBq1apBIb7++utaScchQ5MVzXH77bdn
1G5KL4OTv/rqq6FDh6qZuNY1kVzZOmPGjJTQa3kJ+Su6BHqO2pT/VaRIkYce
eohrjTNZX5zF2YZwRDz66KNnn302+rOcv7wjftJHxkDf0Ixnwi6cjx77t+pD
pU3JJoRqpL6rV6/ehAkTUt5L25zkUa/77rvvbr31Vs0DqCE4G9CsWbPMi7Q9
0MQawtTCHJ5Lly6FxkGDhpmcE3EcuJKKJ5J7oJx00kkpXrz0Jgb/Sub2SUnS
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
oMBgPv7443ERGKuodmbpwXOFtnoWwRWgcHGRlIxAalag/XF21F3LXTPmzZvX
uHHjRFKScyEz+jODw8OZKJSfbUEjHAOqe/futPY19xIa/wovzzpakrx06dJB
gwbVqVNHj5yItRVDLhPJ3Zx5wB5VpkwZVUW3bt0SWwMhVrNmzSiDhlLLSq4q
yp1AeXEDJt2UepA3veyyy7han9KSa6upgrm+NeUBUZ/4/MUXX6TE5rPgePTo
0Vr4mXkEO99UTLOGPlatWjWUiqqTftJEPCUFqY67o+9dcsklHJh0c6uj4l/C
6OhEcgsb7ggcxdMF9HsqQTG/F1hXoVuZj0AXdpR8w2iFr1qWn/BXyjqcppS5
5KqrrpJI/9vsBziB18cBHk1prFAhRYoUCV9TOg6XXXACJHxxacGp1jVAMuN1
ypESzh7Qy6xPQv8pOwPqv0OHDpSljEfSfVXDxhhjjNkhYE7gKxj2A6ymZs2a
8euVCVobNWo0bdq0KJlGKZOsO3sbMDO40pa7iuDgkUceUQYhWWJE+wBG8WK9
s88+WwFjtGfKly8PawfaRKfBLHnyyScffPDBW2+99fLLL2/RogVMFFhcr732
GmoMn4QRX4l4e1BtuMmUQbhpmNEIF2Q+okTg+JANRuO2YcOGKB7tVZy/fv16
+uwuuOAC+dpgTKLhmACWCTm51Yhs9cy3vUC1MNvq+PHjGaucSLohmFg4zNYr
wv00X3rpJZ6g7XJoK/7nP/9hnYdeVLZFOGOAX2ES4/Nrr7329NNPD73hqpb+
/ftnSycJawOqQY+GCodiCv3Osr1ROdBi0KQ0bmn3VqhQQZ4X5k3amSLRnq9e
vXroD0JPQKlQvLZt27K65MHJIsynBFsahdcKa85CoJXfeOONKB7mfFK58GSH
o10ghVgYxpNLBEkspPe8jC5g9q26devyFtBTcpNBQbP/Fy5cmDMVqJlLL710
5cqVeCJUOCqEDacNTBNxntvHHnsMQpt9jKl9eUflidWj8eCLL74YMmQIBU6p
UqXY7fkq4DHuzuHPMbhNVcXNcKOtl9zijrfccgtqHqVCyZm9hzMSf1s/movA
ZVE8jkSWik/dqlUrrvXmSMfxuHHjJk6cOGzYsFq1ap111ll4O+GNhC6KdyBf
71w/nojjH7hiN+y0DP3VA6IP4JXI6uVGuqjkmjVrZgzX5yZN+pXHGvX0Vj/3
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
e4aGhrIpKiN4sRwxYkRhYaF1rgTZ2dl4Bcv58+dbVDAkbbNmzQYOHLh37172
EGE4sRBCCCGEEEIIUU4oTkHnzp3pCY2PjzffKESo5zc85TZpaWlcYZDwtGnT
IEvpQg0LC4uOjr7vvvu2b99ug6tQkhBCCCGEEEKII2Xbtm1r1qypXbu2uVAh
PGvWrNm4cWPmlu7cudMrkZz79u3LyckpKChITk4+99xz3R6pYPXq1TasW5pV
CCGEEEIIIYQoD6mpqStXruzatatJ1LCwMKhUvLJixQrbDOI0Pz9/z5490J5Z
WVnFxcW33XZbVFQUxWmMz+DBg/fv38/A4Ozs7JN3TEIIIYQQQgghTldWrVpV
r149c4Y2btwYy06dOv3nP//x/HjgnJwcrGRkZLjNT3fs2NGyZUsK2/DwcKx0
69bN8/NbPd/rSq2qvpZCCCGEEEIIUckpLqH0W+bfhPBkXaM33nijRo0aZ5xx
hqnUhg0b9uvXLzk52TRpUVERO9QQ6FYMPmnSJBZZYsOaqKiomTNnuhmpnt+n
RipVCCGEEEIIISo5h5KoZPfu3bb+8ssvN23alOKURXrr1avXo0eP1NTUgoKC
QHnewsJC1llisd8zzzwzIiIiPj7eklItIxWqlvq0wOf4HKUQQgghhBBCiNOD
Q0lUCMatW7dyPTs7e968ecxCrV+/PgN3W7Vqdd9996Wnp7MXaiCxdO/evRkZ
GVz/5ptvmJFapUoVJqViaf5WiFl2SsWeuEHCQgghhBBCCCFEAGpPBuuywynj
datVq2bqcu3atVhy3bRnbm4uX9m0aRM+UqtWLetZ06tXr+TkZPsK6NnCwsIT
f2hCCCGEEEIIIU4jrHXphAkTTGBWqVKFiaVQmu7GFu6bk5ND1yqXULJJSUnh
4eGxsbGWykpVi7eoZF2J6ia0CiGEEEIIIYQQxMKAO3bsSGnZoEEDk5nDhg3j
u1lZWUw7pSb1fG2Lz5rw/OCDD6zUUs2aNbG88847t23b5vkRxSZpCdYzMzNP
3EEKIYQQQgghhDgdsHpKF110kTWdYVJqVFTUww8/zM2KfAJprXSGMk4YWnXE
iBH8FAdp0aLF5s2b8VZaWprnC1X7VG5uLkZT9SQhhBBCCCGEEC7WmAYSFboy
Li4uNDSUEhU8+eSTXokUzc/Pp9uUJY/cYF3WTUpNTW3cuHFMTAwbpIK7776b
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
pwwnWyULIYQQQgghhBD/n/8HNdLK+g==
          "], {{0, 261}, {1250, 0}}, {0, 255},
          ColorFunction->RGBColor],
         BoxForm`ImageTag[
         "Byte", ColorSpace -> "RGB", Interleaving -> True, MetaInformation -> 
          Association[
           "Comments" -> 
            Association[
             "Creation Time" -> 
              DateObject[{2020, 1, 6, 7, 31, 57.}, "Instant", 
                "Gregorian", -5.]]]],
         Selectable->False],
        DefaultBaseStyle->"ImageGraphics",
        ImageSizeRaw->{1250, 261},
        PlotRange->{{0, 1250}, {0, 261}}]}], ";"}], " ", ")"}]}]}], 
  "]"}]], "Input",
 CellChangeTimes->{{3.7900318425904694`*^9, 3.790031905247055*^9}, {
   3.7900319678965235`*^9, 3.7900319764805684`*^9}, {3.790032045420218*^9, 
   3.79003204972075*^9}, {3.7900334299325657`*^9, 3.7900334801104183`*^9}, {
   3.790033530343172*^9, 3.7900335607628603`*^9}, {3.790034008716673*^9, 
   3.790034021081574*^9}, {3.7900340879528337`*^9, 3.790034090154945*^9}, {
   3.790034211457489*^9, 3.7900342216890965`*^9}, {3.790034279994182*^9, 
   3.7900343089507484`*^9}, {3.7900344165959015`*^9, 3.790034478489423*^9}, {
   3.790034551333593*^9, 3.79003455319764*^9}, {3.790034723283374*^9, 
   3.790034774275982*^9}, {3.7900348460111575`*^9, 3.790034854996129*^9}, {
   3.7900350071911745`*^9, 3.7900350783498573`*^9}, {3.7900353203437014`*^9, 
   3.7900353586233053`*^9}, 3.79003539075239*^9, 3.790067668044471*^9, {
   3.790067709804825*^9, 3.790067711320756*^9}, 3.7900682443432655`*^9, 
   3.790069427081214*^9, 3.7900701490392313`*^9, 3.7900705447763276`*^9, 
   3.7900751361553583`*^9, {3.790152312626004*^9, 3.7901523147782907`*^9}, {
   3.79015786333694*^9, 3.790157865511118*^9}, {3.790157969699542*^9, 
   3.790157976194185*^9}, {3.7901580228045464`*^9, 3.7901580233680296`*^9}, {
   3.790158112300206*^9, 3.7901581402504945`*^9}, {3.790190498428587*^9, 
   3.790190517802786*^9}, {3.790191961871955*^9, 3.7901919623427153`*^9}, {
   3.790192190977415*^9, 3.7901921959052114`*^9}, {3.7901922765895157`*^9, 
   3.790192277530994*^9}},
 CellLabel->"In[3]:=",ExpressionUUID->"2cf3ed92-0fdc-47a5-a25f-5fd2734a75f8"],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`imagePath$$ = None, Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`imagePath$$], None, "Select Image: "}, FileNameSetter[
       SlotSequence[1]]& }}, Typeset`size$$ = {1061., {332., 338.}}, 
    Typeset`update$$ = 0, Typeset`initDone$$, Typeset`skipInitDone$$ = False}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, "Variables" :> {$CellContext`imagePath$$ = None}, 
      "ControllerVariables" :> {}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      DynamicModule[{$CellContext`defaultImage = $CellContext`images[
          "JohnHancock"], $CellContext`image, $CellContext`processFunc, \
$CellContext`points, $CellContext`pointsTour, $CellContext`sample, \
$CellContext`coefObject, $CellContext`circleObject, \
$CellContext`circleObjectTrunc, $CellContext`innerMan}, $CellContext`image = 
         If[$CellContext`imagePath$$ === 
           None, $CellContext`defaultImage, $CellContext`processFunc = 
            ImageResize[
              ImageAdjust[#, {1, 0.5}], 500]& ; $CellContext`processFunc[
             Import[$CellContext`imagePath$$]]]; $CellContext`points = 
         FourierPack`ImageLinePoints[$CellContext`image]; \
$CellContext`pointsTour = 
         FourierPack`MakeTour[$CellContext`points]; $CellContext`sample = (
          FourierPack`UniformResample[
           
           FourierPack`PrependIndices[#, "ParametrizationType" -> 
            "EuclidianDistance"], 500, "ParametrizationType" -> 
           "Linear"]& )[$CellContext`pointsTour]; $CellContext`innerMan = 
         Manipulate[$CellContext`coefObject = (FourierPack`CnFFT[
              FourierPack`MakeComplex[
               #[
               "SamplePoints"]], $CellContext`numSpinners]& \
)[$CellContext`sample]; $CellContext`circleObject = (
             FourierPack`ApproxFunction[
              #2["CoefficientFunction"], $CellContext`t, 
              Length[
               #["SamplePoints"]], 
              #2["CoefficientList"], "Sort" -> 
              False]& )[$CellContext`sample, $CellContext`coefObject]; 
           FourierPack`EpicyclePlot[$CellContext`circleObject, \
{$CellContext`t, 0, $CellContext`$T, 
              $CellContext`sample["Length"]}, "Spinners" -> True, 
             "NumSpinners" -> 10, "PlotRange" -> "Plot"], {{$CellContext`$T, 
             $CellContext`sample["Length"], "Time"}, 0, 
            $CellContext`sample[
            "Length"]}, {{$CellContext`numSpinners, 10, 
             "Number of Spinners: "}, 1, 200, 1}, ContinuousAction -> True, 
           TrackedSymbols :> {$CellContext`$T, $CellContext`numSpinners}]; 
        Grid[{{$CellContext`image, 
            
            ListLinePlot[$CellContext`pointsTour, PlotRange -> All, 
             AspectRatio -> Automatic]}, {$CellContext`innerMan, 
            SpanFromLeft}}, Alignment -> Center, Frame -> All, FrameStyle -> 
          Gray, Spacings -> {
            Offset[2], 
            Offset[2]}]], 
      "Specifications" :> {{{$CellContext`imagePath$$, None, 
          "Select Image: "}, FileNameSetter[
          SlotSequence[1]]& }}, 
      "Options" :> {TrackedSymbols :> {$CellContext`imagePath$$}}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{1112., {380., 386.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    Initialization:>({{FourierPack`ImageLinePoints[
           Pattern[FourierPack`Private`image, 
            Blank[Image]]] := 
         Module[{FourierPack`Private`processedImage, 
            FourierPack`Private`points}, 
           FourierPack`Private`processedImage = DeleteBorderComponents[
              Thinning[
               ColorNegate[
                Binarize[FourierPack`Private`image]]]]; 
           FourierPack`Private`points = N[
              PixelValuePositions[FourierPack`Private`processedImage, White]]; 
           Return[FourierPack`Private`points]], 
         TagSet[FourierPack`ImageLinePoints, 
          MessageName[FourierPack`ImageLinePoints, "usage"], 
          "ImageLinePoints[image] Returns {x,y} points of a continuous dark \
line on a continuous light background."], FourierPack`MakeTour[
           Pattern[FourierPack`Private`data, 
            Blank[]], 
           Pattern[FourierPack`Private`opts, 
            OptionsPattern[{FindShortestTour, FourierPack`MakeTour}]]] := 
         Module[{FourierPack`Private`startFunc = OptionValue["StartFunction"],
             FourierPack`Private`sortedDat, FourierPack`Private`tour, 
            FourierPack`Private`outPoints}, 
           FourierPack`Private`sortedDat = 
            If[FourierPack`Private`startFunc === None, 
              FourierPack`Private`data, 
              SortBy[
              FourierPack`Private`data, FourierPack`Private`startFunc]]; 
           FourierPack`Private`tour = Last[
              FindShortestTour[FourierPack`Private`data, 
               FilterRules[{FourierPack`Private`opts}, 
                Options[FindShortestTour]]]]; 
           FourierPack`Private`outPoints = 
            With[{FourierPack`Private`points = 
               Part[FourierPack`Private`sortedDat, FourierPack`Private`tour]}, 
              If[
               OptionValue["CenterPoints"], 
               
               Map[# - Mean[FourierPack`Private`points]& , 
                FourierPack`Private`points], FourierPack`Private`points]]; 
           Return[FourierPack`Private`outPoints]], 
         Options[FourierPack`MakeTour] = {
          "StartFunction" -> None, "CenterPoints" -> True}, 
         TagSet[FourierPack`MakeTour, 
          MessageName[FourierPack`MakeTour, "usage"], 
          "MakeTour[data, 'PrependIndices'\[Rule]True, 'StartFunction'->None] \
Takes list of points data and reorders using FindShortestTour.  \
'PrependIndices' prepends index to each point.  Scale index for data of \
length l by setting 'IndexScale'->l.  'StartFunction' is a pure function that \
finds the first point in the series."], FourierPack`UniformResample[
           Alternatives[
            Pattern[FourierPack`Private`points, 
             Blank[List]], 
            Pattern[FourierPack`Private`points, 
             Blank[InterpolatingFunction]]], 
           Pattern[FourierPack`Private`n, 
            Blank[]], 
           OptionsPattern[]] := 
         Module[{FourierPack`Private`samplePoints, 
            FourierPack`Private`sampleDomain, 
            FourierPack`Private`samplePointsIndexed, 
            FourierPack`Private`order, FourierPack`Private`pointsFunc, 
            FourierPack`Private`indices}, FourierPack`Private`order = Round[
              Chop[
               N[Log[FourierPack`Private`n]/Log[2]]]]; 
           FourierPack`Private`pointsFunc = 
            If[Head[FourierPack`Private`points] === InterpolatingFunction, 
              FourierPack`Private`points, 
              Interpolation[
              FourierPack`Private`points, InterpolationOrder -> 1]]; 
           FourierPack`Private`sampleDomain = 
            If[Head[FourierPack`Private`points] === InterpolatingFunction, 
              Subdivide[
               First[
                Part[
                 FourierPack`Private`points["Domain"], 1]], 
               Last[
                Part[
                 FourierPack`Private`points["Domain"], 1]], 
               2^FourierPack`Private`order - 1], 
              Subdivide[
               Part[FourierPack`Private`points, 1, 1], 
               Part[FourierPack`Private`points, -1, 1], 
               2^FourierPack`Private`order - 1]]; 
           FourierPack`Private`samplePoints = 
            Map[FourierPack`Private`pointsFunc, 
              FourierPack`Private`sampleDomain]; 
           FourierPack`Private`indices = 
            If[OptionValue["ParametrizationType"] == "Linear", 
              Table[
              FourierPack`Private`i, {
               FourierPack`Private`i, 0, 
                Length[FourierPack`Private`sampleDomain] - 1}], 
              FourierPack`Private`sampleDomain]; Return[
             Association[
             "SamplePoints" -> FourierPack`Private`samplePoints, 
              "SamplePointsIndexed" -> 
              Transpose[{
                FourierPack`Private`indices, 
                 FourierPack`Private`samplePoints}], "InterpolatingFunction" -> 
              FourierPack`Private`pointsFunc, "Length" -> 
              Last[FourierPack`Private`indices]]]], 
         Options[FourierPack`UniformResample] = {
          "ParametrizationType" -> "Linear"}, 
         TagSet[FourierPack`UniformResample, 
          MessageName[FourierPack`UniformResample, "usage"], 
          "UniformResample[(points_List|points_InterpolatingFunction),n_} \
Takes points as List or InterpolatingFunction and samples closest exponent of \
2 less than n points between 'EndPoints'.  'ParametrizationType'->'Linear' \
indexes each point from zero; 'Given' attaches indices from parametrization \
of 'points.'"], FourierPack`PrependIndices[
           Pattern[FourierPack`Private`data, 
            Blank[List]], 
           OptionsPattern[]] := 
         Module[{FourierPack`Private`type = 
            OptionValue["ParametrizationType"], FourierPack`Private`l = 
            OptionValue["IndexScale"], FourierPack`Private`start = 
            OptionValue["IndexStart"]}, 
           Switch[FourierPack`Private`type, "Linear", 
            
            With[{FourierPack`Private`indices = 
              If[FourierPack`Private`l === None, 
                Subdivide[
                FourierPack`Private`start, Length[FourierPack`Private`data] - 
                 1 + FourierPack`Private`start, 
                 Length[FourierPack`Private`data] - 1], 
                Subdivide[
                FourierPack`Private`start, FourierPack`Private`l + 
                 FourierPack`Private`start, Length[FourierPack`Private`data] - 
                 1]]}, 
             Return[
              
              Transpose[{
               FourierPack`Private`indices, FourierPack`Private`data}]]], 
            "EuclidianDistance", 
            With[{FourierPack`Private`indices = Accumulate[
                Prepend[
                 Apply[EuclideanDistance, 
                  Partition[FourierPack`Private`data, 2, 1], {1}], 0]]}, 
             Return[
              DeleteDuplicatesBy[
               
               Transpose[{
                FourierPack`Private`indices, FourierPack`Private`data}], 
               First]]]]], 
         Options[FourierPack`PrependIndices] = {
          "ParametrizationType" -> "Linear", "IndexStart" -> 0, "IndexScale" -> 
           None}, 
         TagSet[FourierPack`PrependIndices, 
          MessageName[FourierPack`PrependIndices, "usage"], 
          "PrependIndices[data, 'ParametrizationType'->'Linear', \
'IndexStart'->0, 'IndexScale'->None] Parametrizes points in tour list 'data' \
by ParametrizationType.  Type='Linear' parametrizes by point, starting at \
'IndexStart' for data of length 'IndexScale.'  Type='EuclidianDistance' \
parametrizes by distance along path."], FourierPack`CnFFT[
           Pattern[FourierPack`Private`data, 
            Blank[]]] := 
         Module[{FourierPack`Private`fftshifted}, 
           FourierPack`Private`fftshifted = FourierPack`FFTShift[
              Fourier[FourierPack`Private`data], "Indices" -> True]; 
           Function[{FourierPack`Private`n}, 
             Last[
              SelectFirst[
              FourierPack`Private`fftshifted, Part[#, 1] == 
               FourierPack`Private`n& ]]]], FourierPack`CnFFT[
           Pattern[FourierPack`Private`data, 
            Blank[]], 
           Pattern[FourierPack`Private`SortFunc, 
            Blank[]], 
           Pattern[N, 
            Blank[]]] := 
         Module[{FourierPack`Private`fftshifted, 
            FourierPack`Private`coefList}, 
           FourierPack`Private`fftshifted = FourierPack`FFTShift[
              Fourier[FourierPack`Private`data], "Indices" -> True]; 
           FourierPack`Private`coefList = Map[First, 
              Take[
               FourierPack`Private`SortFunc[FourierPack`Private`fftshifted], 
               N]]; Return[
             Association[
             "CoefficientFunction" -> Function[{FourierPack`Private`n}, 
                Last[
                 SelectFirst[
                 FourierPack`Private`fftshifted, Part[#, 1] == 
                  FourierPack`Private`n& ]]], "CoefficientList" -> 
              FourierPack`Private`coefList]]], FourierPack`CnFFT[
           Pattern[FourierPack`Private`data, 
            Blank[]], 
           Pattern[N, 
            Blank[]]] := 
         Module[{FourierPack`Private`fftshifted, 
            FourierPack`Private`coefList}, 
           FourierPack`Private`fftshifted = FourierPack`FFTShift[
              Fourier[FourierPack`Private`data], "Indices" -> True]; 
           FourierPack`Private`coefList = Map[First, 
              TakeLargestBy[FourierPack`Private`fftshifted, 
               Composition[Abs, Last], N]]; Return[
             Association[
             "CoefficientFunction" -> Function[{FourierPack`Private`n}, 
                Last[
                 SelectFirst[
                 FourierPack`Private`fftshifted, Part[#, 1] == 
                  FourierPack`Private`n& ]]], "CoefficientList" -> 
              FourierPack`Private`coefList]]], 
         TagSet[FourierPack`CnFFT, 
          MessageName[FourierPack`CnFFT, "usage"], 
          "CnFFT[data, n] Calculates nth coefficient from complex Fourier \
coefficients data.  Data should be output from Fourier[].  Uses FFTShift with \
indices.\n\tCnFFT[data, SortFunc, N] sorts by SortFunc applied to {n,coeff}, \
i.e. SortBy[Abs@*Last]"], FourierPack`FFTShift[
           PatternTest[
            Pattern[FourierPack`Private`dat, 
             Blank[]], ArrayQ], 
           OptionsPattern[]] := 
         Module[{FourierPack`Private`dims = 
            Dimensions[FourierPack`Private`dat], 
            FourierPack`Private`fftshifted, FourierPack`Private`index}, 
           FourierPack`Private`fftshifted = 
            RotateRight[FourierPack`Private`dat, 
              If[OptionValue["k"] === All, 
               Quotient[FourierPack`Private`dims, 2], Quotient[
                 Part[FourierPack`Private`dims, 
                  OptionValue["k"]], 2] UnitVector[
                 Length[FourierPack`Private`dims], 
                 OptionValue["k"]]]]; 
           FourierPack`Private`index = 
            Table[FourierPack`Private`n, {
              FourierPack`Private`n, -
               Floor[Part[FourierPack`Private`dims, 1]/2], 
               If[
                EvenQ[
                 Part[FourierPack`Private`dims, 1]], 
                Floor[Part[FourierPack`Private`dims, 1]/2] - 1, 
                Floor[Part[FourierPack`Private`dims, 1]/2]]}]; If[
             OptionValue["Indices"], 
             
             Transpose[{
              FourierPack`Private`index, FourierPack`Private`fftshifted}], 
             FourierPack`Private`fftshifted]], 
         Options[FourierPack`FFTShift] = {"k" -> All, "Indices" -> False}, 
         TagSet[FourierPack`FFTShift, 
          MessageName[FourierPack`FFTShift, "usage"], 
          "FFTShift[data, {Indices->False}] Center FFT data\nFFTShift[data, \
{Indices->True}] Append Indices to shifted FFT data"], FourierPack`MakeComplex[
           Pattern[FourierPack`Private`pairs, 
            Blank[List]]] := 
         Apply[# + I #2& , FourierPack`Private`pairs, {1}], 
         FourierPack`ApproxFunction[
           Pattern[FourierPack`Cn, 
            Blank[]], 
           Pattern[FourierPack`Private`x, 
            Blank[]], 
           Pattern[FourierPack`Private`L, 
            Blank[]], 
           Alternatives[
            Pattern[FourierPack`Private`$N, 
             Blank[Integer]], 
            Pattern[FourierPack`Private`$N, 
             Blank[List]]], 
           OptionsPattern[]] := 
         Module[{FourierPack`Private`nterms, FourierPack`Private`coefs, 
            FourierPack`Private`speeds, FourierPack`Private`terms, 
            FourierPack`Private`armends, FourierPack`Private`centers, 
            FourierPack`Private`function}, 
           FourierPack`Private`nterms = 
            With[{FourierPack`Private`nlist = 
               If[Head[FourierPack`Private`$N] === Integer, 
                 Range[-FourierPack`Private`$N, FourierPack`Private`$N], 
                 FourierPack`Private`$N]}, 
              If[
               OptionValue["Sort"], 
               SortBy[FourierPack`Private`nlist, 
                OptionValue["SortFunction"]], FourierPack`Private`nlist]]; 
           FourierPack`Private`coefs = 
            Table[(1. FourierPack`Cn[FourierPack`Private`n])/Sqrt[
              FourierPack`Private`L], {
              FourierPack`Private`n, FourierPack`Private`nterms}]; 
           FourierPack`Private`speeds = 
            With[{Length = 
               If[OptionValue["Scale"] === Default, FourierPack`Private`L, 
                 OptionValue["Scale"]]}, 
              
              Table[(2. FourierPack`Private`n Pi)/Length, {
               FourierPack`Private`n, FourierPack`Private`nterms}]]; 
           FourierPack`Private`terms = 
            MapThread[# Exp[-(I FourierPack`Private`x #2)]& , {
              FourierPack`Private`coefs, FourierPack`Private`speeds}]; 
           FourierPack`Private`armends = 
            Accumulate[FourierPack`Private`terms]; 
           FourierPack`Private`centers = Drop[
              Prepend[FourierPack`Private`armends, 0], -1]; 
           FourierPack`Private`function = Total[FourierPack`Private`terms]; 
           Return[
             Association[
             "Coefficients" -> FourierPack`Private`coefs, "Radii" -> 
              Map[Abs, FourierPack`Private`coefs], "Speeds" -> 
              FourierPack`Private`speeds, "Terms" -> 
              FourierPack`Private`terms, "ArmEnds" -> 
              FourierPack`Private`armends, "Centers" -> 
              FourierPack`Private`centers, "Function" -> 
              FourierPack`Private`function]]], 
         Options[FourierPack`ApproxFunction] = {
          "Scale" -> Default, "SortFunction" -> Abs, "Sort" -> False}, 
         TagSet[FourierPack`ApproxFunction, 
          MessageName[FourierPack`ApproxFunction, "usage"], 
          "ApproxFunction[Cn,x,L,$N_Integer] Construct approximating function \
with coefficients given by Cn[n], variable x, length of data L (Length@data), \
with terms from n=-$N to n=$N\n.  Returns <|'Coefficients'\[Rule]coefs, \
'Radii'\[Rule]Abs/@coefs, 'Speeds'\[Rule]speeds, 'Terms'\[Rule]terms, \
'Centers'\[Rule]centers, 'Function'\[Rule]function|>.  Use 'Scale'->length \
option to rescale period to lengthApproxFunction[Cn,x,L,$N_List] Builds \
approximating function from n\[Element]$N"], FourierPack`Cn[
           Pattern[FourierPack`Private`data, 
            Blank[]], 
           Pattern[FourierPack`Private`n, 
            Blank[]]] := (1. 
           Sum[Part[FourierPack`Private`data, FourierPack`Private`x] 
             Exp[(2. Pi I FourierPack`Private`n FourierPack`Private`x)/Length[
               FourierPack`Private`data]], {FourierPack`Private`x, 1, 
              Length[FourierPack`Private`data]}])/Sqrt[
           Length[FourierPack`Private`data]], 
         TagSet[FourierPack`Cn, 
          MessageName[FourierPack`Cn, "usage"], 
          "Cn[data,n] Calculate the nth complex Fourier coefficient from \
discrete data"], FourierPack`EpicyclePlot[
           Pattern[FourierPack`Private`circlesObject, 
            Blank[Association]], {
            Pattern[FourierPack`Private`t, 
             Blank[Symbol]], 
            Pattern[FourierPack`Private`a, 
             Blank[]], 
            Pattern[FourierPack`Private`b, 
             Blank[]], 
            Pattern[FourierPack`Private`c, 
             Blank[]]}, 
           Pattern[FourierPack`Private`opts, 
            
            OptionsPattern[{
             FourierPack`EpicyclePlot, FourierPack`SpinnerRow, 
              FourierPack`Spinner}]]] := Quiet[
           
           Module[{FourierPack`Private`pp, FourierPack`Private`fr, 
             FourierPack`Private`frn, FourierPack`Private`plotGraphic, 
             FourierPack`Private`finalGraphic, FourierPack`Private`centers, 
             FourierPack`Private`range, FourierPack`Private`points, 
             FourierPack`Private`radii, FourierPack`Private`$N}, 
            FourierPack`Private`pp[
               Pattern[FourierPack`Private`time, 
                Blank[]]] := 
             If[FourierPack`Private`b - FourierPack`Private`a > 0, 
               ParametricPlot[
                ReIm[
                 FourierPack`Private`circlesObject["Function"]], {
                FourierPack`Private`t, FourierPack`Private`a, 
                 FourierPack`Private`time}, Evaluated -> True, Axes -> None, 
                PlotRange -> All], {}]; FourierPack`Private`centers[
               Pattern[FourierPack`Private`time, 
                Blank[]]] := ReIm[
               ReplaceAll[
                FourierPack`Private`circlesObject["Centers"], 
                FourierPack`Private`t -> FourierPack`Private`time]]; 
            FourierPack`Private`points[
               Pattern[FourierPack`Private`time, 
                Blank[]]] := Prepend[
               ReIm[
                ReplaceAll[
                 FourierPack`Private`circlesObject["ArmEnds"], 
                 FourierPack`Private`t -> FourierPack`Private`time]], {0, 0}]; 
            FourierPack`Private`radii = 
             FourierPack`Private`circlesObject["Radii"]; 
            FourierPack`Private`$N = Length[FourierPack`Private`radii]; 
            FourierPack`Private`range = Automatic; 
            FourierPack`Private`plotGraphic[
               Pattern[FourierPack`Private`time, 
                Blank[]]] := 
             With[{FourierPack`Private`$centers = 
                FourierPack`Private`centers[FourierPack`Private`time], 
                FourierPack`Private`$points = 
                FourierPack`Private`points[FourierPack`Private`time]}, 
               Show[
                Graphics[
                 If[
                  TrueQ[
                   OptionValue["ShowCircles"]], 
                  Table[{
                    Circle[
                    Part[FourierPack`Private`$centers, FourierPack`Private`i], 
                    Part[
                    FourierPack`Private`radii, FourierPack`Private`i]]}, {
                   FourierPack`Private`i, 1, FourierPack`Private`$N}], {}]], 
                FourierPack`Private`pp[FourierPack`Private`time], 
                Graphics[{
                  AbsoluteThickness[1], 
                  Line[FourierPack`Private`$points], 
                  AbsolutePointSize[5], 
                  Point[FourierPack`Private`$points]}], PlotRange -> 
                FourierPack`Private`range, ImageSize -> Scaled[0.8], 
                PlotRangePadding -> Max[FourierPack`Private`radii]]]; 
            FourierPack`Private`range = Switch[
               OptionValue[FourierPack`EpicyclePlot, "PlotRange"], "Radii", 
               Total[FourierPack`Private`radii], "Plot", 
               PlotRange[
                ParametricPlot[
                 ReIm[
                  FourierPack`Private`circlesObject["Function"]], {
                 FourierPack`Private`t, FourierPack`Private`a, 
                  FourierPack`Private`c}, Evaluated -> True, PlotRange -> 
                 All]], "All", 
               PlotRange[
                FourierPack`Private`plotGraphic[FourierPack`Private`c]], 
               Blank[], 
               OptionValue[FourierPack`EpicyclePlot, "PlotRange"]]; 
            FourierPack`Private`finalGraphic[
               Pattern[FourierPack`Private`time, 
                Blank[]]] := If[
               OptionValue["Spinners"], 
               Column[{
                 FourierPack`SpinnerRow[
                 FourierPack`Private`circlesObject, FourierPack`Private`time, 
                  FilterRules[{FourierPack`Private`opts}, 
                   Join[
                    Options[FourierPack`SpinnerRow], 
                    Options[FourierPack`Spinner]]]], 
                 FourierPack`Private`plotGraphic[FourierPack`Private`time]}, 
                Center, ItemSize -> Scaled[0.8]], 
               FourierPack`Private`plotGraphic[FourierPack`Private`time]]; 
            If[OptionValue["Movie"] === False, 
              Return[
               FourierPack`Private`finalGraphic[FourierPack`Private`b]], 
              FourierPack`Private`fr = OptionValue["Frames"]; 
              FourierPack`Private`frn = Table[
                 FourierPack`Private`finalGraphic[FourierPack`Private`t], {
                 FourierPack`Private`t, FourierPack`Private`a, 
                  FourierPack`Private`b, (FourierPack`Private`b - 
                   FourierPack`Private`a)/(FourierPack`Private`fr - Boole[
                  FourierPack`Private`fr > 1])}]; Return[
                Deploy[
                 ListAnimate[FourierPack`Private`frn]]]]]], 
         Options[FourierPack`EpicyclePlot] = {
          "Frames" -> 25, "ShowCircles" -> True, "Movie" -> False, "Spinners" -> 
           False, "PlotRange" -> "Radii"}, 
         TagSet[FourierPack`EpicyclePlot, 
          MessageName[FourierPack`EpicyclePlot, "usage"], 
          "EpicyclePlot[circlesObject, {t, a,b}, opts].  a=start time, b = \
current time, c = final time.CirclesObject output from ApproxFunction \
modified from \
https://mathematica.stackexchange.com/questions/100051/dynamic-epicycles"], 
         FourierPack`SpinnerRow[
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
        Get["G:\\My \
Drive\\Projects\\FourierDisplay\\Software\\FourierPack.wl"]; \
$CellContext`images["JohnHancock"] = Image[CompressedData["
1:eJzsvXm8TuX+xv80qESkMg+ZMmUWEYlEHZEpZGgQRSXNo5OQDEedxNEgjRpO
GVIqHQ2iuVQKkSmzUDTP39bv+q3r91y/27PZbY9t2FzvP/Zr7Wevvda97mE9
n+v+fO7PXebCK9pffGAikbjmMPxo3+OGpldf3eOmDkfil479rrmkd7+Lev2j
37UX9b7o6voXHoQPcx2QSKw6OJH4f48jY4wxxhhjjDHGGGOMMcYYY4wxxhhj
jDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhj
jDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhj
jDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhj
jDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhj
jDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhj
jDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhj
jDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhj
jDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhj
jDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhj
jDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhj
jDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhj
jDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhj
jDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhj
jDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhj
jDHGGGOMMcYYY4wxxhhjjDHGGGOMMcYYY4wxxhhjjDEmm/j1119/+eUXHv9f
DA5+++2333///Y8//uCv4s8///zrr79SrsBz/orRJzhzlxfdmP2DH3/8kQfh
EMOHGKf89ZtvvsFA5sEeKaExxhhjjDHZxbfffqvjn3/+mQeUohnVaCZI5373
3Xfr16+n8bxDVzDGZM4ff/whWUow3Hjw008/7YkSGWOMMcYYs0vYsmXLxo0b
eQx9So/MNpHqhLUMWQrDGD9///13uk1/itkNBTZmPwSD7scff8TP7f2VB/Sx
7sZyGWOMMcYYk82EBi0k52+//aag34yEvtHtnfbzzz//8MMPtJkd9GtMdoGh
ygGFcff999/TqcqB9tNPP2Hc4XOO0O2NX2OMMcYYY3IEMG5h2dL/AluXVu6v
v/7KD2EVwxim2xTaE7bxeeedd/HFF19//fV33XXX1KlT582bhw/xL/LGRrGY
/TMmJTrRGJMeUKMKyMfw5KBLAScwEMKzQ8YYY4wxZp9hzZo1w4cPb968ea1a
tQ6KOeCAAxJbgw9TPsE5B8cUKlTo/PPPnzNnDq8Gu3rLli179omM2WdQJINm
kzZv3rx69epwaepvv/2GXx3xa4wxxhhjcjTMejR//vy+ffseffTRUJ25cuXK
nz9/riQHJ6FupSwFOMaHOOGQmHz58uXOnZu6tVGjRk899dQPP/ywpx/OmH0H
eUh///33KB6z11xzzXnnnTd48GB+Qkcqj40xxhhjjMnRjBs3rmjRohSYeWIS
f8eBMSkfQrEWKFCA7tejjjpqwIABa9eu3dMPZ8w+wo8//ggdyjWnUKyjR4/m
uKtWrdqSJUt++eUX5uv2TjTGGGOMMWZv4+uvv+bBxo0b5XwJU+/SxQmDFn8d
MmRInTp1qCshTiEzqUB5wGP+PPTQQ+VITQkAllzFOUceeaSO8bNs2bIzZ85k
gpfvv/9eXp5M0ggbs5/z119/bdq0iccYuRinlJ/hWtRnnnkGQ+yII4445JBD
MNDeeustxgCHG0sZY4wxxhiz9/Dbb7+lyEAoU2ZAipJJQa+++upjjz2WChTC
87DDDpPwhFyF6Zs3b15F8IIiRYrUqlWrYcOGTZo0adGiRbNmzapVq5YvXz7+
9fDDD+cBzGb8o1QqKFSo0Pr160OJytVzu79ajNn70dDQBsQh38fcfPPNuXLl
4kAjL774Iv+RE1Pb/F9jjDHGGGP2FN99913KpqUpCT9vvfXWChUq0LgtWbKk
bN0CBQow1pfZkEqUKNGyZcvhw4fPmjVL/tkU6xdXnjNnztChQzt06KCYYZA3
hiIX14TCXbVqFf/F+tSYTNAA2bx5cziQGej70Ucf9e3bl3NKxYoV43DLly/f
+++/z9PsSzXGGGOMMXshCgvEwZo1a/T5hg0b8POdd96hA1SLT+UGpSe0Zs2a
l1xyydixY7ds2UKDOdwjNXTRwmzm/qr6BAJ58ODBulq5cuXoS8XP+vXrL1q0
iCa0UpIaY7YJRla45ykHb58+fTShxEDfY445JleuXCeccMLChQt55g8//MAN
pPZMuY0xxhhjjNkO8qcsXrwYKnL58uWXX345fZ2lS5eWijzqqKN4MHz4cJrE
UrgbN27c3tJRqdcoFrA///wzN1rlr7zOH3/8cf755+PKtKW1gnXGjBn8R3tU
jdkmnBRS9AIZNGgQR1Pu3Lk1v8T14FE8JDHuuFkq4/kd8WuMMcYYY/YqQgP1
/fff/9e//lWuXLnDDz88f/78Eow4PvLIIw844ADYvffddx//5c8//1y/fj2t
XIFfoXlhBnNVqfyqKb4eyNvQ5YpfoUPDZa2kSpUqdqQakwlMbobhhqHHmaJP
P/20WLFiXOh98MEHazQdffTR1113XRRHNfB8XcT7pRpjjDHGmL0NxgdCWhYo
UADWLPPuFixYkJl7IR4PO+ywFi1aPPfccytWrKBxG0pOOkbl7vwjhscQp998
802YOpi5gqNY5MI2/i2Gfz3nnHNSnLbQyz179kwRwsYYodHx3XffQXtu3ryZ
gb6c81F8fp48eTCEo61npaBqHetrjDHGGGP2Qhgr+Ndff82cOTP0vChEsHfv
3kuWLPn555/D/8KvULU8DhVrtLVKFZCiytkbxRJV5jHs6igZdTxy5MhjjjkG
BrY2rKlTpw4KZlvamO3BbWjoVP34449z5crFgcz4+QIFCuCTVq1acTaJAxkD
CoMUQxIDf5sD1hhjjDHGmN0AHaZR7ED57rvvYKxqOerKlSt79uyZiLeDYTrQ
vHnzMotRmzZtGHO723QiNCluTR8QCpMvX75TTjkF5jS0sHdNJVQWPA4lhuYN
+LmW/ZrdwDfffKPj32MYJ4BGYXA7RpAmatLIrLt+/fptfr4lhtfHAMGA1SzT
kUceCaEKxXraaadhjEdbZzYzZv9k06ZNCuDh3E6UDHrHnz7//PO77757xYoV
4XbDxhhjjNml0Jql5yVKrgZ95ZVXGjVqxPyfsm9h3B500EEdO3b87LPPeDLs
agqf3VDOK6+8MgxWPOCAA5599ln+iUIV1j4OUJj90MfKzW23+eCcT1i3bh1/
9WLD3Q/6JB2UGf/EEPednzfAFXR9HdDYvv322xmln4i3m+HBDTfcQAWdkmHJ
mP0QDkBOEzH6XVNGc+bMad26Nb96ateurd3QjDHGGLNLoaZj1B+/fyFXr776
6sKFC0ucFixYkFlWatasCam4aNGiKLauaRjvNlfmzJkzixcvDnHKUuXOnbtf
v37UXBs3bozi9a3c1GY/9K4qL2uUdM+lCJ+/YqKtvXtmN4C2gMW7vXzUaCx0
2p9//jntqR5eP6XP83a4cufOnbmuPJHcN+rggw++8MILGdnLkzVDZcz+CYeP
svlpum/Lli341guTzJctW3Y/nAU1xhhj9hRfffVVFO84o+9iiEHIUhzkypWr
du3ab7zxBv0ylELQg6tXr+b/hgtLdx00HtatWzd06NBjjz1W5Rw7dmyUNLNp
me+e8uy14PGh3KF6wgxU8+fPj5I7BOFDR/zuTr777jsFEHJih4IUxxhHynqN
JkvP+t28ebOCusPZCdyX8b2FChXCcNa8Ew1yBS4qcZkx+zNaoI3RumHDhgUL
FjRs2JBDhgu6DzvsMHz1PPbYY/ruM8YYY8yug+tSYSS/9tprZcuWZTwtfuJ7
mV7LokWL0lP5yy+/8Hs8CrY0jXbXpqW4+9q1a3Ewe/Zs7YZzzDHHVKlS5csv
vwxl136+yWOKSIfFNXLkyNy5c1evXr1u3bq9e/eOggSwZjcgiRplWAEKk1hj
CuIxJRdZFglTZ+tqEKEXXnghxkiRIkWUMenQQw89++yzcQ5nMH788UevSDWG
8M3J9RHr169PCSVicobOnTtHfn8aY4wxuwsYtIMHD07E+59q/SkPmjZtOnPm
zHnz5ulkiSDYt9KnuyehhO6SL1++kiVLyop45JFHwtPSM/VzOts0nJYvX96j
Rw/6xMERRxwBiytKeg3M7kGeSrURdCtTWEdba9idRM0K+XnVVVeFi7hhYOfO
nbtu3bpr1qzR+XTmRrsxB5oxeyea58QgffTRR2vUqHHwwQfjexDiFF83h8UU
KFBgzxbSGGOM2d8YMWKEFN+BBx7IdL4Ahq4iCVOyj3IHRinW3ZaQ55dffuEs
N/fRYDlPO+00LutTktv9UKgybZRcY6iHadOm9erVSyKFBw0aNLAjYDcjDUhL
eOnSpQMHDrz22muXLFkSxaEIbLW03ZopnX/Dhg2jR4/WiNYcRZMmTRYsWEBX
Edm0aRMGlCWqMZosql+/frjshW9OftfcfffdHKTZOLNkjDHGmO1x4403Hn74
4blz5w7lTJkyZSZPnkzfpYxYfjVnjKfdPRKVipiF6dy5M00IaGrmLF22bJm2
etxtRdo74brUt99+u3379kyYQ4ca47enTp3qnRR2J+iTYW9ELx03bhzH2v33
388P0WQ4Le2pFeVNYhz+o48+ikan35zWNX6WK1cO41eDl3qZ/2iVagypUaPG
ITEK9NWi1D59+kTx158lqjHGGJPtKLmrDnr06MEvYmUBpbvtnXfe2XPF3DZM
L8OUwrNnz5aghgkBFXbJJZdEcUgw/rpvqzDUgB4Q+mLFihX6E/dIhRH122+/
ValShZUjjzO4/fbbeebuWUpsCCQhs3uhve69916ucTvooIPat2/P7L46U2HA
O8RPP/2EW9B4nj59Oq6Pi+fNmzd37ty0t0uVKrV48eJov08sZoz2B1deaw3A
li1bats1fLlgkCoUoXv37nxn4mSMtf089YExxhiTvVDaKN7v66+/rlmzZug/
hdY76qijBg0ahDP3TveKQiIXLlwIWQ1THBKME9316tWLkn7efT7cV5smhJ+g
1Tj5ALVyyy23UApJnx5xxBEwt6K4G+zz9bO3oQ1Jv/rqqwYNGii0vkqVKvw8
3KUxDaRtp0yZwtkJ7dYE8MncuXN3+iGM2RfgZA60qr7jID/xVjzvvPP4JYjv
FGbDLl68OEdQmzZtOBn4xx9/eBsvY4wxZlegjctnzZoFCaMFa0wT0aFDhz9j
op1YIrer0bIgyNJEvGUqVSqIkg8IW2LvVNnZBeWMPKo4kI+sY8eOjIKmUyB3
DA7OPPNM/JdWpDp70m6D80JvvPHGqaeemjdvXvZVHrRv357nbNmy5ddff03P
0amufuWVV/LiFStWxHBmvOInn3yiM9Ho+3aYgTFZYeXKlQqS//HHH6FATznl
FH4PlipVijNIDEFp0qTJunXreCa+XDQdpHknY4wxxuw8VHD4goYxTC9qsWLF
EsksoN27d5dy2bBhw16bYEfWBXfZgNYOVaq2ody39wPVwijmkmIoGpqMdcKF
usr4AUqXLg2txNNoX+3b9bNXwbXSlSpVypMnD5ujePHi9NfMmTMnSrZm2jHY
8owzQXfoRS1btixHBBodxUhJgGbM/okGwpo1az766CMOHL0tIVE5iGrUqIGB
w1clRtmWLVs0ebvXzuIaY4wxORGawd98803v3r21ARy/nfF1zK/dBQsWcP3a
XgitBUUsK4spys8HieJld3/++ee+bULQU8xnxDGb9auvvjrppJO0uPjII4/k
AT8ZN24cau/777+nINKCLLN7OO6447THE2xgereHDBnCvyqNdhRMwmQdpmb6
6aefDjnkEFy5RIkSvBEOli1bhvGyb8cVGLNDMJwA70No1YkTJ3IRtzZswrHi
i6J4GhCv1nAEQa5u3rzZs3zGGGNM9oLv3DFjxmgvVEYelilTZt68efzaZSjp
3plihXIMJj2L+vbbbx9xxBE0J/LkyXPAAQdEsZG/zy+6DFcvsioWLVrEdL5y
pEITyTVw7733wtCSvzVlebLZDXDdtyaFjjrqqKuvvjr0+HPE4df0Jlg2btx4
2223sbkxuhnJf8UVV2gsKNjbkd7GcLJuxowZHDL47sidOzcGKd+ZB8Q0adIk
2nq84L884WOMMcbsCmCmDhkyRGGH+F6GyitcuPC7777LxLDMC7HXqjyZ2Tz4
8ccfq1atqhBHPNfmzZu19eQ+nMNW0kZWU4cOHRLBtpiskNatW48bN27VqlU8
WTMP9NxZrew20CHZLkWKFDnooIM4tcI/KfKQzZH21EHv3r3R//Pnzy8fOo5x
cYhT9Ba0OPtJ6LQ1Zv8EXx+//vorJGqZMmU4HrVmBMOHL8+WLVsuXbpUUQr8
RwwifEUy2sHru40xxphsZNasWVqxSHcqvpEfeOCBKIgz5Dfy3rwf3J9JcHzq
qafKKQzRvWDBAi2nTW9Hj5wCn46iBtIjkVxcXKFCBYogsHHjxihuSm5Pw8kH
buWzd/rK91WeeuopbUZMmjVrBgnJ5sMBhCRbBKZvGuvB27RpoytjRBcuXDhX
rlw33XQTJCpvwabnlfftYHhjssKHH37YpEmTcEhKq+bJk6dRo0ac3NNgxFs0
ZYbHO9EYY4wx6aFFi5Cf9CriZ+vWrfEtDCOWWjVv3rx33XXXni5pOtADBaU2
fPhwGeeHHXZY37595ULdN0KztDGfdpnBs1OiSm507tz56KOPZs5YSdSqVavy
NOei3J1QFdLPAm2I3vjggw+iURjrW6BAARxXrlz5k08+SWOiQH17+fLlPMDo
Zm5SXP/AAw/k7BMkKj60GjX7OYo50YwlhiRG6Jo1axR+r8girhzBzxNOOOHV
V1/l+V4WYYwxxmQvYTJPWbba+i0R52+BUO3atSsjmnIKEJ70+crC/+CDD6jL
oFJhnPfq1UvhyvuGlZ4Stxz+umLFiv/9739s0HBf1PLly2/atElV5LSuu431
69dHgZNl1qxZhx9+OExfRuHSBuZit525hcIevvjiiyJFisjMhgTmTMVzzz2H
fpKzhrYxuwh8EXDI4Ovjyy+/bNy4MUYlF6JybjMRp0Dv2bNnFOvZtWvX8h8h
cqFS99r1L8YYY0wOBWYqI5Qo1iRnqFXxNV29evVVq1bh6zsHqTmob9neWhYE
UaasjB07dtybY5V3FD0sHlzxZtrycsOGDZUrVw71KXRQuXLlnnrqKV0B5+z+
Yu/ncFrgrbfegiDV7qhHH30017s988wzPC2NpoHBzO5Ny7lFixaanylWrBiD
iq+//vpoL15abszuRLnQ8c7cuHFj27ZtuTKCr03+LFq06OjRoxXcC3GKUaa5
oBz0/WiMMcbs/eCrGSo1DHlt2rQp7OQDY+jTefzxx3///fc0tr3YS4DVQfvh
xBNPVMpi2O37UhpGGE58xu9i+CHdqYsXL+7QoQNddYAKqGLFip9++ilP28kt
OE3aMNC3UaNGiWDjWtrGvXv3XrBgwZo1a2AJ78zQQw/H+C1dujRVqmZpKlWq
FMXzGPvSXI0xaSONuXnz5nr16nGYaLxwZm/48OE8J1x5qmjhvXbfcGOMMSYn
8ssvv0ipwV6dMmUK45qUMalLly5R4KrLWbDY3P0zitPbyp8IaQDjf19KDYRn
DKM3mdPjyy+/lMVF0LKXXnrps88+y9NUA9LyZjcAK5eTCVdffbX6JIYbtWqv
Xr0YQLgzLcKNbjG6r7nmGk3OcHSDvn37Rklj2250s5+DgYA3J+MKevbsmSJR
R44c+eabb/JMvGNxGl6bGJv4ZsF/8X/98jTGGGN2Ecy3w2SGSrbPvDoUPjnL
7chpbQq3KBbjMC369eunjUFPPPHEaJ+b/ZYq56+PPfbYSSedxOfNnz//ETFH
HXUU/6pdZjZu3Aijy6mTdjPokK+//noi3tJCDYSDrl27wuLVcEsvQaiSwCxZ
siRv3rwQwmh3Bi5yCNx///1R0n+k5XXG7Lf8+uuveH9269atYMGCBx54IDdf
4/DcsGEDvx9JxiB56tbdW15jjDFmHwc2MJQaLeEFCxYw2pCelyJFikycOBES
hn/NWen0Ib4o1mA/0ODHY1577bXMbgrq1asXxVb6vjEHzl2B+MhQKLSaSpUq
heeVH41G12uvvYYKSWlNLpCUvDW7h/r163PEUaUy3HfRokXaPgl89dVX6V2c
MzB16tSRG12O1OOOO27ZsmU5NEDCmGwHb0uMuF69enEyJxGnDeSQqVKlCqdx
8HrkVB4OmAHYG0kbY4wxuxR82+ILetOmTfx25mblJ598svawiGK/W85yO2pm
+9dff1Xq2ssuu4yrMuVLjfYhoRpGb8J8KleuXK5cufi8+fLlY8KcoUOHhv8C
c0siCMc5q4lzNBhxqPnChQtrIWrumAULFrDrci2q0rns6PV/+OGHzZs3Fy1a
VIMaP+lFrVGjxvTp03Wmw32NefjhhytXrsyoe00cQahOmTIF79KU7YMZn4Mh
jD/9+OOPmtyzaDXGGGOyEam5Tp06aRlOhQoVvv76a6jXMG1LGIW49xMGZcmK
gErlDDnskIYNG9L2yFlZoVJyF0u/qGlwgOe94YYbIEnoRS1UqBCb9brrrgvj
1szugSmSMHzwMwwLHDBggLycXI7apk2bHb04DWPaz+zJ7B74HNdnb4f4pRf1
iCOOmDt37sqVK53X1+zPaGtprg2fNWtWyZIl9fWHNyeO8R3x3HPP7emSGmOM
Mfsv+L7m3nAVK1bEF3SxYsXw86KLLmI4U+hcgyWcg3xtYVFhk/PXc889l0tu
Dz300MaNG9NQyaG5bVOidn/44QdaXF999VXz5s0LFiwYyh8A3UoVk4ZjzmQL
Gzdu1AwDDipUqADZqChc/Ar9mMZlGYWI0SoJvGHDhnvuuUfilBQuXHjEiBGb
Nm0KPT4YFyna2Zh9G01Lcvby448/ZgZsTulAouI7AgPnqaee8pyeMcYYswfB
NzXk55133klTlt/XU6dOTdmehmfmOGuWdsi3335LBXfWWWfRvQiD5LTTTuMe
HDnuoaK4zBkXFUKboMlatmyZN0ahpAUKFLj88stXrFjB05zoYzezZcuWsMIx
sqAThwwZEqpItNS0adPSWygajlPu+ditW7ejjz5a+jR//vywvfv165ey7pgT
HegPOWvJuTE7g6bpMBLPPfdcRcIz3LdgwYJQqQ8//PAeLaMxxhhj/r843urV
q/NrGl/QEDhSNCE4LcepG8VAUpC2aNFCu360a9eOC3JzkIM4iiXPbzFaJIWn
+yMGx3379k0E5MmTp1q1anfeeSdFOsQRHcc51H2cEwmFJ5oMepB9snnz5rSN
md6qbdu2UbDwLeuE7h6KzbFjx4Z94Mgjj8SNevTokeJD5z4a+8aKbGN2FAzD
GTNmYOgxD8NBBx10zDHHYLwULVp09uzZXK3v2RtjjDFmz/LOO++EKVZgNm9z
qSZjg3d/8XYGyur/i8FB48aNlfC2V69e1Hc5OrHt1zFRPIcwevRorauC3XXw
wQcffvjha9asoUIPydGPnLOADFT9r169Gj/Xr1/fu3dvqUg0U+7cuSdMmPDT
Tz+lYRVjqHLOAZ2ZGZkqVaqETk7DG9evWLFi/fr1oyBLGEP3gSWq2d/YtGkT
hsn333//0ksvVa9enZOW+Mpj8EnJkiU/+OADjgsMpZw1gWmMMcbse0CvyVqm
5bzN03JcLtwULbZq1arKlSsrRUb//v2ZaGhPFS9tVGYuKuTxyy+/jIeiraXN
FPr27cu/pqeAzM6jfUs584Nm4tYwMI/ZFY8++mhYywsWLNiZu0gIX3DBBbis
Aol5iyjDvsCatzFmvwKvQX6L5cmTh8OE85aUq59//rnOzFlfdsYYY8y+x5o1
a4455pgDDzyQ8YfQqtWqVYuSdizJod/XtMMVcjllyhTKcDzsAQccMGrUqD1a
uvSRJNGjzZkzR6urtPlI06ZNN8VEsUjZuHGjw333CBSqaIizzjorESfa1Tq4
c845Z9WqVToz7cRWbNOXXnqJQ5gXZ29/9tlnJVGV2jeUqH/++adT/pr9BLw8
//nPf2JclChRgsOkUqVK+EaoWrXq/Pnzw4GQ45a3GGOMMfsYs2fPVpgoDy69
9NIo/o4mMHFzXKAvobjmdpB4hKFDh8rBBMaPH68zc5ZfiV5RPB3lzzfffNOt
Wzc5zhLxhphjxoxhwtgUJ9qaNWs+/vjjjDHAZhfB+l+7di0EqTK0KNaXC8DR
HBhoaXfCxYsX4+eiRYvy58/PPKWHHnro4Ycffsghh/Tu3Zu76P7666+4xU8/
/cRw39ACxydWqWY/YfLkyQq2P+qoozheypcv/+WXX/IEbeqE8ej9T40xxpg9
yPPPPx/mWilUqNDcuXP3gejQlN1dcdypUycIBInxjRs38oQ/Y3b0+jT1Qw2o
Y5g3PJbuoFJWqXZmMWwoMKlSzz///Hz58um5wGWXXaZzYGhx4SoE0aWXXlq2
bNnjjjvuk08+iWK1yzBURsEpNjVzGPjNRcqZ1Bsr4bfffssYa8pKoG7asYff
jUi4ha5nPm8YXcCculHwXFCFq1atQouHTzdu3DjmW86dO7d8nQqtp1aVZxyX
Ur6vKG5lFgY/2ZT8kCfw7uvWrTv77LN1Wc5X9OnTZ+HChTtZDyoV6iHF1YsH
DDf14F/DmomS27mmwV/bIZN/UYX/EKOCRUFsPB4ne19u4UBmFnQmN9OvHClM
pMzypwQzrF+/PhvLE8Ue+ZRB980334S9ESXBOaoQ/QmnsXLSbrUwMzwu++23
3+KCfE+iq+BeKbvARHFjqUWyd/YMtY0C6Fc81IQJExJxTjkOk/z58+NnrVq1
1HVTXstKa6D6xCfhS4+ZDbKxzMYYY4wRjz32mPw7UDrVq1eHxbunC5X9wAJp
2rTpgQceKI0Ag582SdqrU1O25sF1YKTJ4qIPKwr0TpRUqZI26cGb4l6wkcaM
GcM9R/Bc0CawuwoVKjR16lTamSrMgw8+yB1UeTIMs7lz50ZJQcRzYCJmxeKS
Ss08m9Y2HxD/gtoIrfS92VOPmkFpUWbUjKzrMCk0mvjxxx/v1q1b3bp169Wr
V7JkyXCuABVeqVKlypUr169fXyuFoVXlS73yyithHkNv6oKhgEoR+DzmT24f
E8Vdiw09fvx43ZQHo0aNmj9/vv4XfSbt/Y7x+GGT4e4aLyh/qCzCRpciQzVq
libr7KhKDccUD/CJRD13f9bJ2e47zlg2Nk2Khg1PkHDO3sKgO6kkKIBGNwda
WEhNO2QMCE+bjEJP99Kt0RWZQVfoX7J32oqJzaNkHuwXX3wRIzERbxzMMXLI
IYc0bNgwiqeJeA7Kyf6Mulq/fn3GLIJ8g+HzMLe23mlWrMYYY0w2wp1SmUEi
b968rVu33tMlyk5k9sC0Llu2LFQq3UxQCpAYNJzS9mxSptFNkLIhJg9gJvFY
9pL0XdoqletMYUrB/nz77bfxIAUKFKBKPeKII0477TRZgDRB8bN79+6JeL2q
QoLz5cvXrl07nrZx48YdKkCoUrNSb6gflBY1AFsuRZDS2FPl7FWg2GHBUEuU
OZqIwLPce++93L1C4hQdDHUrZw0/R7UfeuihGFzKLw2tWqpUqTVr1kRJSSWj
N+xIoacm9O2mOKQeeughLrVGB0gk88CEzfrtt9/iUjuZoxuPL18qSgU1JE2N
e7EkKLyEs0hvcKXhS40yrLHF+ahkPTX1RRqFyQryouIWmbtrpd+zGL2QBrgF
3m/sPDhWZ0BPCGdFSMb9dtNQW5q2Qj3g8SVLwwrnn1TClH/P3tmqsBPi/TN/
/vx69eqFwQbFixdv1aoVi8c+I0WPga9hyHh4TtTwVc9ypqxgxf/ijntzcIgx
xhiT47jlllvwrc1shzCezz///D1douxERtGyZcsgGQ6MoXyQD2jnt+TQv+ua
sI1TbPVQ3O3M7WTLrV69uly5ctBE4TKrxx57LIqfmvYSfoUaUj4ltC9sM2ol
fK5ioEiwwVBg+X+3+Yw7pBpgD1OW0rST3Uu/nvZP2fvBM8o0jeJZguXLl0Of
1q5dG7Yu6rxw4cJ0j+aLCePnlchXQywMNRw8eLB0Cl1daDi0guS8VsaFBr+C
GLmvDbpc2bJlJU4pVLt06QLZK8crJWq0HQd35jD2mN0Jx+vWrZMxL9H6V3IB
+IQJE+65557Zs2fjX/7Kcgz5NknDlxpt7ZrXAZ8d/Y0JxPAsaWepygq4vvxx
rDcUW57xv+IwVEbGSsFlbxAyrqZJjy0xUayqUsIYouSUSBgFzcmZTN4D20PR
wtvk1xh1QhYDNYCqUOB69k4gMEKGa7Hxs3Hjxhykimpo3749z6QOzTiBhk6i
acxwskgx0nRG239qjDHG7CL69+8fOn169uwZ7UNpYGU4Pf3009IIEKq5c+fW
nxgMmcaVYc7Riyr7igqCZjx+4gRcmasOaT9nS8JkXGfhwoXNmzfnvjMHxCSS
aa+iWCOjVDA1w00WKM+lkmCkQXDJcs7o+EhhR1UDjMPQ8GNosRRWGGkcZfd6
tGwBFShfqtTWiBEjUNWoyUNiwh6VSObUTcT7DhcrVkwzA6Fu1TwJreW6desO
GDDgtddeS4nGVEXxgM3Ec+SaZFDiE088QWXKzoCfpUuXVlDuX1uvzk57NbT+
UVsa/RUs+ps8efK5555bpUoVVUXbtm3Z7aNgUfYOsaP9LVzzGMWTCWvXrqWT
S83Hf4eyyF63HUP9w3Zh3w7VTVjyFDd9tBPrQDPCSsAtwmumvM8x3BRJgmKn
OH+z5QXFuRGN8YzBxjxAW6gXpSzzzxaojrnVGr7j8AXHkPvDDjts6dKlUXKm
RWVDYVIU+pgxY3r37l2zZk2+RUHx4sUbNGigbEtqelQ4A12MMcYYky0MGTJE
7h7Qo0cPhu3t6XJlD1Sg+ElDReFeMOwVnZW2JJcdCJNszpw5MGZ4feoXmus4
fu+993iXlDyumVvd24OlzZMnD1UJgTCJYuNz3bp1KNVFF10kpx73PUExtBoL
dhpEBO1kGmmhf3Z79w23Jcp6sTNmI0EJP//88+nTpz/00ENPPvnkxx9/vHd2
NhrM7CQwXNu0aaPaQ92GQ0bbnp555pmdOnWC8FRVQ64m4mDscL0qjqkrcSk0
YsmSJfn5aaedxqxWUTC7Ei5/0+eoQ+r6q6++WvqUPPDAA+H5nELZGVHG1DGh
fIB9/sILL6ALUWhr9oP2PyqHS79RqmbNmvHWafgKd1SlRsGqwHDiKEqGFsyb
Nw/FfuaZZ2bMmLGjhckcxiFkjPlH1a1ateqzzz778MMP0c9RbwzUj7ZOwJW9
hMWAaFq4cOG4ceOaN2+eCJJLs9Ugtfr06ROWeecDVlN6mloE9bN48eLZs2e/
+eabkIf4ddGiRSn/QrG/kwVIuTW6wYgRIxJxnIOGKmTmyy+/rAURPB91xTGF
1zVGoioK3TisNw5njOv69eujZXkFiVNH/BpjjDHZyKhRo2hV0tq88MIL95mv
Wto/DPArU6ZMuAMIzAwJqPRMI7n/3n777Zo1ayaS+Yt4C0mPIkWKlC9f/okn
nuBardCK+2s7mUb+lnvuuUcmU4ECBQ499NDBgwfzQSAAmzRpQpNMXjyVioso
AcxFXor2VVaKQUfwDqlUrkjVxWGfw1KtUaOGMvyAcuXKjRkzJo1K2A2g56xZ
swbFq169+pExKvZhhx1GOZYnTx5osdtuu00LM/m/48ePr1ixIkcWzjzkkEPQ
CugMXEQsuZqIPbDSsHXq1GHMtpDTLdTykK7o0h988AF0IksFWxrdAJfi+XT0
UD3R3R86+3YUiHT22+XLl1988cXhI6SUP4USJUrQU5aitbNCGiqVhcST6nYr
VqyAGho0aFC4JhGVdv/996dTEduCa1FVMDTTggULIITbtGlTq1atMAIc4xFv
oWuuuYbKaNfFq+jxx44dqwDXRKxSw7Bzth23MYpiQafw8jR8mowMDycH1q5d
C8V32WWXYYCExSBdu3aFcg+vkL3fOyjJxo0bX3311URSovL9X6xYsalTp3I0
pXwFLFmypGPHjjgNo1VJ9ricHL+irsLwCfDMM89E2/KMG2OMMSZbuO+++/iN
DAMG1ias0F00yb/7oe0Bebh58+ZEoNrwmLCaUk5LA5hVkAP9+/enDIRgQU1y
yWEiuUKQNhJMI+qFFJWahpPrnXfeKVWqFMpPiQSVd/fdd/MpWrVqlYjFshSQ
PAjyCOBnhQoVmCQ2zCqDTzIPV2Nq4h1SqVqXB7P8pZde6ty5M+pEYbHyAF5+
+eU7Wgm7h6VLl5511lmhXVqyZMnQi9qhQwd6P/GkTA/Ff4R9Tt9rKN9OP/30
OXPmzJ8/H3Z7+fLlFfrL9pL0O/7445lkmya0vJDaUUhRlK1bt9YtjjnmGKjU
QoUKhYlJw2biKsidiaicPXv2OeecwzJTGodGe+jP5a/oomhuyIQ0FjlGO65S
8WgKDKBMQ39GgVVINJx83JzVyV5wX+jTkSNH1q5dOxE4LtFAaBrmbWNarbfe
eiuKGzTcjSW7iqHI5ylTpjChd6iU0dnwng8nFgYOHEihynTWukjaBUA9rFq1
6uGHH27atKnuy5uyqzOZWCJOQx0lg/+5HDs7KuD/B32vaNGifA9z2OLnpEmT
+NdQUKP+586dixeRXtrsvYntgMZFU44ZMybMJ7YXLlswxhhjcjQwJxJB2N4Z
Z5yxMybK3kO4B9+IESPozJIJfeqpp4ZRiJlHJDIrZspWIFGc2nTQoEEy/1iN
9FbgZ7ggETbPddddFwXb00SxyKWXKkzfKmtNEpumIww//Jw2bRrNS1wfJih+
rlmzhllVoZhgO8EUpFqhKVW1atULL7xQsiIRr1ENw/wyglJxIWGYVGrAgAHQ
QTDMcOW77ror5V9k74VbloQemeHDh1OcHnvssYlkHiHFzXbq1Ckb1+XtKHpG
7d3DFcRDhgxBDVPjoCZRb/iZP39+DJBq1apBIb7++utaScchQ5MVzXH77bdn
1G5KL4OTv/rqq6FDh6qZuNY1kVzZOmPGjJTQa3kJ+Su6BHqO2pT/VaRIkYce
eohrjTNZX5zF2YZwRDz66KNnn302+rOcv7wjftJHxkDf0Ixnwi6cjx77t+pD
pU3JJoRqpL6rV6/ehAkTUt5L25zkUa/77rvvbr31Vs0DqCE4G9CsWbPMi7Q9
0MQawtTCHJ5Lly6FxkGDhpmcE3EcuJKKJ5J7oJx00kkpXrz0Jgb/Sub2SUnS
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
oMBgPv7443ERGKuodmbpwXOFtnoWwRWgcHGRlIxAalag/XF21F3LXTPmzZvX
uHHjRFKScyEz+jODw8OZKJSfbUEjHAOqe/futPY19xIa/wovzzpakrx06dJB
gwbVqVNHj5yItRVDLhPJ3Zx5wB5VpkwZVUW3bt0SWwMhVrNmzSiDhlLLSq4q
yp1AeXEDJt2UepA3veyyy7han9KSa6upgrm+NeUBUZ/4/MUXX6TE5rPgePTo
0Vr4mXkEO99UTLOGPlatWjWUiqqTftJEPCUFqY67o+9dcsklHJh0c6uj4l/C
6OhEcgsb7ggcxdMF9HsqQTG/F1hXoVuZj0AXdpR8w2iFr1qWn/BXyjqcppS5
5KqrrpJI/9vsBziB18cBHk1prFAhRYoUCV9TOg6XXXACJHxxacGp1jVAMuN1
ypESzh7Qy6xPQv8pOwPqv0OHDpSljEfSfVXDxhhjjNkhYE7gKxj2A6ymZs2a
8euVCVobNWo0bdq0KJlGKZOsO3sbMDO40pa7iuDgkUceUQYhWWJE+wBG8WK9
s88+WwFjtGfKly8PawfaRKfBLHnyyScffPDBW2+99fLLL2/RogVMFFhcr732
GmoMn4QRX4l4e1BtuMmUQbhpmNEIF2Q+okTg+JANRuO2YcOGKB7tVZy/fv16
+uwuuOAC+dpgTKLhmACWCTm51Yhs9cy3vUC1MNvq+PHjGaucSLohmFg4zNYr
wv00X3rpJZ6g7XJoK/7nP/9hnYdeVLZFOGOAX2ES4/Nrr7329NNPD73hqpb+
/ftnSycJawOqQY+GCodiCv3Osr1ROdBi0KQ0bmn3VqhQQZ4X5k3amSLRnq9e
vXroD0JPQKlQvLZt27K65MHJIsynBFsahdcKa85CoJXfeOONKB7mfFK58GSH
o10ghVgYxpNLBEkspPe8jC5g9q26devyFtBTcpNBQbP/Fy5cmDMVqJlLL710
5cqVeCJUOCqEDacNTBNxntvHHnsMQpt9jKl9eUflidWj8eCLL74YMmQIBU6p
UqXY7fkq4DHuzuHPMbhNVcXNcKOtl9zijrfccgtqHqVCyZm9hzMSf1s/movA
ZVE8jkSWik/dqlUrrvXmSMfxuHHjJk6cOGzYsFq1ap111ll4O+GNhC6KdyBf
71w/nojjH7hiN+y0DP3VA6IP4JXI6uVGuqjkmjVrZgzX5yZN+pXHGvX0Vj/3
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
e4aGhrIpKiN4sRwxYkRhYaF1rgTZ2dl4Bcv58+dbVDAkbbNmzQYOHLh37172
EGE4sRBCCCGEEEIIUU4oTkHnzp3pCY2PjzffKESo5zc85TZpaWlcYZDwtGnT
IEvpQg0LC4uOjr7vvvu2b99ug6tQkhBCCCGEEEKII2Xbtm1r1qypXbu2uVAh
PGvWrNm4cWPmlu7cudMrkZz79u3LyckpKChITk4+99xz3R6pYPXq1TasW5pV
CCGEEEIIIYQoD6mpqStXruzatatJ1LCwMKhUvLJixQrbDOI0Pz9/z5490J5Z
WVnFxcW33XZbVFQUxWmMz+DBg/fv38/A4Ozs7JN3TEIIIYQQQgghTldWrVpV
r149c4Y2btwYy06dOv3nP//x/HjgnJwcrGRkZLjNT3fs2NGyZUsK2/DwcKx0
69bN8/NbPd/rSq2qvpZCCCGEEEIIUckpLqH0W+bfhPBkXaM33nijRo0aZ5xx
hqnUhg0b9uvXLzk52TRpUVERO9QQ6FYMPmnSJBZZYsOaqKiomTNnuhmpnt+n
RipVCCGEEEIIISo5h5KoZPfu3bb+8ssvN23alOKURXrr1avXo0eP1NTUgoKC
QHnewsJC1llisd8zzzwzIiIiPj7eklItIxWqlvq0wOf4HKUQQgghhBBCiNOD
Q0lUCMatW7dyPTs7e968ecxCrV+/PgN3W7Vqdd9996Wnp7MXaiCxdO/evRkZ
GVz/5ptvmJFapUoVJqViaf5WiFl2SsWeuEHCQgghhBBCCCFEAGpPBuuywynj
datVq2bqcu3atVhy3bRnbm4uX9m0aRM+UqtWLetZ06tXr+TkZPsK6NnCwsIT
f2hCCCGEEEIIIU4jrHXphAkTTGBWqVKFiaVQmu7GFu6bk5ND1yqXULJJSUnh
4eGxsbGWykpVi7eoZF2J6ia0CiGEEEIIIYQQxMKAO3bsSGnZoEEDk5nDhg3j
u1lZWUw7pSb1fG2Lz5rw/OCDD6zUUs2aNbG88847t23b5vkRxSZpCdYzMzNP
3EEKIYQQQgghhDgdsHpKF110kTWdYVJqVFTUww8/zM2KfAJprXSGMk4YWnXE
iBH8FAdp0aLF5s2b8VZaWprnC1X7VG5uLkZT9SQhhBBCCCGEEC7WmAYSFboy
Li4uNDSUEhU8+eSTXokUzc/Pp9uUJY/cYF3WTUpNTW3cuHFMTAwbpIK7776b
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
pwwnWyULIYQQQgghhBD/n/8HNdLK+g==
           "], "Byte", ColorSpace -> "RGB", Interleaving -> True, 
           MetaInformation -> 
           Association[
            "Comments" -> 
             Association[
              "Creation Time" -> 
               DateObject[{2020, 1, 6, 7, 31, 57.}, "Instant", 
                 "Gregorian", -5.]]]]; Null)}; Typeset`initDone$$ = True),
    SynchronousInitialization->True,
    UndoTrackedVariables:>{Typeset`show$$, Typeset`bookmarkMode$$},
    UnsavedVariables:>{Typeset`initDone$$},
    UntrackedVariables:>{Typeset`size$$}], "Manipulate",
   Deployed->True,
   StripOnInput->False],
  Manipulate`InterpretManipulate[1]]], "Output",
 CellChangeTimes->{
  3.79003402405263*^9, 3.790034091784554*^9, 3.7900342304416933`*^9, {
   3.7900342883817863`*^9, 3.7900343115837083`*^9}, 3.79003442544623*^9, 
   3.790034480830127*^9, 3.790034519674254*^9, 3.7900345556670046`*^9, 
   3.7900348571025333`*^9, {3.790035053192131*^9, 3.790035080280695*^9}, {
   3.7900353313292923`*^9, 3.7900353605591283`*^9}, 3.7900353928757105`*^9, 
   3.7900644846492677`*^9, {3.790067691644373*^9, 3.7900677118423443`*^9}, 
   3.7900694341453295`*^9, 3.7901517549635377`*^9, {3.7901518170973635`*^9, 
   3.790151836816661*^9}, {3.7901578423566284`*^9, 3.790157866047691*^9}, 
   3.7901579766539464`*^9, 3.7901580239764104`*^9, {3.7901581131230383`*^9, 
   3.7901581408957434`*^9}, 3.7901902663411107`*^9, 3.7901903409546003`*^9, {
   3.790190502608423*^9, 3.790190518470975*^9}, 3.7901906749839277`*^9, 
   3.7901913937718835`*^9, 3.790191431529996*^9, 3.7901914690001283`*^9, 
   3.7901915261235247`*^9, 3.790191613847991*^9, 3.7901917999250126`*^9, 
   3.7901919799651475`*^9, 3.79019214289599*^9, 3.7901922133755*^9, 
   3.790192294925516*^9, 3.790347044285039*^9},
 CellLabel->"Out[3]=",ExpressionUUID->"17c415b1-718f-42f7-8e55-ebf6565b7288"]
}, {2}]]
}, Open  ]]
},
WindowSize->{1520, 781},
WindowMargins->{{-8, Automatic}, {Automatic, 0}},
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
Cell[1510, 35, 218, 4, 67, "Section",ExpressionUUID->"7ea3bc34-4dc0-45ff-8e34-04b86fd2ddbf"],
Cell[1731, 41, 527, 11, 78, "Text",ExpressionUUID->"e64c8eee-5740-4f91-8b4f-1ba5c8e496bc"],
Cell[CellGroupData[{
Cell[2283, 56, 60881, 1047, 441, "Input",ExpressionUUID->"2cf3ed92-0fdc-47a5-a25f-5fd2734a75f8"],
Cell[63167, 1105, 88290, 1569, 785, "Output",ExpressionUUID->"17c415b1-718f-42f7-8e55-ebf6565b7288"]
}, {2}]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature Ixp8MED4cS9mrBwO0@nZBwCx *)
