import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringStructuralAnalysisCanonicalLaneLean

structure FiniteElementPackage where
  elementType : String
  shapeFunctionsDefined : Prop
  stiffnessMatrixComputed : Prop
  assemblyConverged : Prop
  boundaryConditionsApplied : Prop

structure FiniteElementEvidence (F : FiniteElementPackage) where
  shapeFunctionsDefinedClosed : F.shapeFunctionsDefined
  stiffnessMatrixComputedClosed : F.stiffnessMatrixComputed
  assemblyConvergedClosed : F.assemblyConverged
  boundaryConditionsAppliedClosed : F.boundaryConditionsApplied

def FiniteElementClosed (F : FiniteElementPackage) : Prop :=
  F.shapeFunctionsDefined ∧ F.stiffnessMatrixComputed ∧ F.assemblyConverged ∧ F.boundaryConditionsApplied

theorem finite_element_closed_from_evidence (F : FiniteElementPackage) (E : FiniteElementEvidence F) :
    FiniteElementClosed F := by
  exact And.intro E.shapeFunctionsDefinedClosed (And.intro E.stiffnessMatrixComputedClosed (And.intro E.assemblyConvergedClosed E.boundaryConditionsAppliedClosed))

end CivilEngineeringStructuralAnalysisCanonicalLaneLean
end HautevilleHouse
