import "canonicalLaneMathlib".AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringStructuralAnalysisCanonicalLaneLean

structure StructuralAnalysisPackage where
  linearElasticAnalysis : Prop
  stabilityAnalysis : Prop
  dynamicAnalysis : Prop
  nonlinearFiniteElement : Prop
  limitStateDesign : Prop

structure StructuralAnalysisEvidence (P : StructuralAnalysisPackage) where
  linearElasticAnalysisClosed : P.linearElasticAnalysis
  stabilityAnalysisClosed : P.stabilityAnalysis
  dynamicAnalysisClosed : P.dynamicAnalysis
  nonlinearFiniteElementClosed : P.nonlinearFiniteElement
  limitStateDesignClosed : P.limitStateDesign

def StructuralAnalysisClosed (P : StructuralAnalysisPackage) : Prop :=
  P.linearElasticAnalysis ∧ P.stabilityAnalysis ∧ P.dynamicAnalysis ∧
  P.nonlinearFiniteElement ∧ P.limitStateDesign

theorem structural_analysis_closed_from_evidence (P : StructuralAnalysisPackage)
    (E : StructuralAnalysisEvidence P) : StructuralAnalysisClosed P := by
  exact And.intro E.linearElasticAnalysisClosed
    (And.intro E.stabilityAnalysisClosed
      (And.intro E.dynamicAnalysisClosed
        (And.intro E.nonlinearFiniteElementClosed E.limitStateDesignClosed)))

end CivilEngineeringStructuralAnalysisCanonicalLaneLean
end HautevilleHouse
