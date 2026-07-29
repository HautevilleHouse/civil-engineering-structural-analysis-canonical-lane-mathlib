import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringStructuralAnalysisCanonicalLaneLean

structure FiniteElementPackage where
  elementType : String
  shapeFunctionsDefined : Prop
  localStiffnessFormulated : Prop
  assemblyProcedureDefined : Prop
  boundaryConditionsApplied : Prop
  solutionMethodChosen : Prop
  meshDescription : Type
  elementDofMap : Type

structure FiniteElementEvidence (F : FiniteElementPackage) where
  shapeFunctionsDefinedClosed : F.shapeFunctionsDefined
  localStiffnessFormulatedClosed : F.localStiffnessFormulated
  assemblyProcedureDefinedClosed : F.assemblyProcedureDefined
  boundaryConditionsAppliedClosed : F.boundaryConditionsApplied
  solutionMethodChosenClosed : F.solutionMethodChosen

def FiniteElementClosed (F : FiniteElementPackage) : Prop :=
  F.shapeFunctionsDefined ∧ F.localStiffnessFormulated ∧ F.assemblyProcedureDefined ∧
  F.boundaryConditionsApplied ∧ F.solutionMethodChosen

theorem finite_element_closed_from_evidence (F : FiniteElementPackage) (E : FiniteElementEvidence F) :
    FiniteElementClosed F := by
  exact And.intro E.shapeFunctionsDefinedClosed
    (And.intro E.localStiffnessFormulatedClosed
      (And.intro E.assemblyProcedureDefinedClosed
        (And.intro E.boundaryConditionsAppliedClosed
          E.solutionMethodChosenClosed)))

end CivilEngineeringStructuralAnalysisCanonicalLaneLean
end HautevilleHouse