import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringStructuralAnalysisCanonicalLaneLean

structure MatrixStructuralAnalysisPackage where
  globalStiffnessMatrix : Prop
  localStiffnessMatrices : Prop
  transformationMatrices : Prop
  loadVector : Prop
  displacementVector : Prop
  boundaryConditionsApplied : Prop
  solutionMethod : Prop

structure MatrixStructuralAnalysisEvidence (M : MatrixStructuralAnalysisPackage) where
  globalStiffnessMatrixClosed : M.globalStiffnessMatrix
  localStiffnessMatricesClosed : M.localStiffnessMatrices
  transformationMatricesClosed : M.transformationMatrices
  loadVectorClosed : M.loadVector
  displacementVectorClosed : M.displacementVector
  boundaryConditionsAppliedClosed : M.boundaryConditionsApplied
  solutionMethodClosed : M.solutionMethod

def MatrixStructuralAnalysisClosed (M : MatrixStructuralAnalysisPackage) : Prop :=
  M.globalStiffnessMatrix ∧ M.localStiffnessMatrices ∧ M.transformationMatrices ∧
  M.loadVector ∧ M.displacementVector ∧ M.boundaryConditionsApplied ∧ M.solutionMethod

theorem matrix_structural_analysis_closed_from_evidence
    (M : MatrixStructuralAnalysisPackage) (E : MatrixStructuralAnalysisEvidence M) :
    MatrixStructuralAnalysisClosed M := by
  exact And.intro E.globalStiffnessMatrixClosed
    (And.intro E.localStiffnessMatricesClosed
      (And.intro E.transformationMatricesClosed
        (And.intro E.loadVectorClosed
          (And.intro E.displacementVectorClosed
            (And.intro E.boundaryConditionsAppliedClosed E.solutionMethodClosed)))))

end CivilEngineeringStructuralAnalysisCanonicalLaneLean
end HautevilleHouse