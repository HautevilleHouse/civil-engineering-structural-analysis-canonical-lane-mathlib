import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringStructuralAnalysisCanonicalLaneLean

structure FiniteElementMethodConvergence where
  elementStiffnessMatrix : Prop
  globalAssembly : Prop
  boundaryConditions : Prop
  solutionConvergence : Prop
  errorEstimate : Prop

structure FEMConvergenceEvidence (F : FiniteElementMethodConvergence) where
  elementStiffnessMatrixClosed : F.elementStiffnessMatrix
  globalAssemblyClosed : F.globalAssembly
  boundaryConditionsClosed : F.boundaryConditions
  solutionConvergenceClosed : F.solutionConvergence
  errorEstimateClosed : F.errorEstimate

def FEMConvergenceClosed (F : FiniteElementMethodConvergence) : Prop :=
  F.elementStiffnessMatrix ∧ F.globalAssembly ∧ F.boundaryConditions ∧
  F.solutionConvergence ∧ F.errorEstimate

theorem fem_convergence_closed_from_evidence (F : FiniteElementMethodConvergence)
    (E : FEMConvergenceEvidence F) : FEMConvergenceClosed F := by
  exact And.intro E.elementStiffnessMatrixClosed
    (And.intro E.globalAssemblyClosed
      (And.intro E.boundaryConditionsClosed
        (And.intro E.solutionConvergenceClosed E.errorEstimateClosed)))

end CivilEngineeringStructuralAnalysisCanonicalLaneLean
end HautevilleHouse
