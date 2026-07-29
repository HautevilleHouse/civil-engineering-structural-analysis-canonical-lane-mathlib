import "canonicalLaneMathlib".BeamTheory

namespace HautevilleHouse
namespace CivilEngineeringStructuralAnalysisCanonicalLaneLean

structure FrameAnalysisPackage {P : StructuralAnalysisPackage} {B : BeamTheoryPackage P} where
  momentDistributionMethod : Prop
  slopeDeflectionMethod : Prop
  directStiffnessMethod : Prop
  plasticAnalysis : Prop
  swayAndNonSwayFrames : Prop

structure FrameAnalysisEvidence {P : StructuralAnalysisPackage}
    {B : BeamTheoryPackage P} (F : FrameAnalysisPackage P B) where
  momentDistributionMethodClosed : F.momentDistributionMethod
  slopeDeflectionMethodClosed : F.slopeDeflectionMethod
  directStiffnessMethodClosed : F.directStiffnessMethod
  plasticAnalysisClosed : F.plasticAnalysis
  swayAndNonSwayFramesClosed : F.swayAndNonSwayFrames

def FrameAnalysisClosed {P : StructuralAnalysisPackage}
    {B : BeamTheoryPackage P} (F : FrameAnalysisPackage P B) : Prop :=
  F.momentDistributionMethod ∧ F.slopeDeflectionMethod ∧ F.directStiffnessMethod ∧
  F.plasticAnalysis ∧ F.swayAndNonSwayFrames

theorem frame_analysis_closed_from_evidence {P : StructuralAnalysisPackage}
    {B : BeamTheoryPackage P} (F : FrameAnalysisPackage P B)
    (E : FrameAnalysisEvidence F) : FrameAnalysisClosed F := by
  exact And.intro E.momentDistributionMethodClosed
    (And.intro E.slopeDeflectionMethodClosed
      (And.intro E.directStiffnessMethodClosed
        (And.intro E.plasticAnalysisClosed E.swayAndNonSwayFramesClosed)))

end CivilEngineeringStructuralAnalysisCanonicalLaneLean
end HautevilleHouse
