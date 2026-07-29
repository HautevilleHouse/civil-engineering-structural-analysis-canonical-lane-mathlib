import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringStructuralAnalysisCanonicalLaneLean

structure StructuralStabilityPackage where
  bucklingLoadsDetermined : Prop
  postBucklingPath : Prop
  imperfectionSensitivity : Prop
  stabilityCritSat : Prop

structure StructuralStabilityEvidence (S : StructuralStabilityPackage) where
  bucklingLoadsDeterminedClosed : S.bucklingLoadsDetermined
  postBucklingPathClosed : S.postBucklingPath
  imperfectionSensitivityClosed : S.imperfectionSensitivity
  stabilityCritSatClosed : S.stabilityCritSat

def StructuralStabilityClosed (S : StructuralStabilityPackage) : Prop :=
  S.bucklingLoadsDetermined ∧ S.postBucklingPath ∧ S.imperfectionSensitivity ∧ S.stabilityCritSat

theorem structural_stability_closed_from_evidence (S : StructuralStabilityPackage) (E : StructuralStabilityEvidence S) :
    StructuralStabilityClosed S := by
  exact And.intro E.bucklingLoadsDeterminedClosed (And.intro E.postBucklingPathClosed (And.intro E.imperfectionSensitivityClosed E.stabilityCritSatClosed))

end CivilEngineeringStructuralAnalysisCanonicalLaneLean
end HautevilleHouse
