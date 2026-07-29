import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringStructuralAnalysisCanonicalLaneLean

structure LoadBearingCapacity where
  materialStrength : Prop
  safetyFactor : Prop
  loadCombinations : Prop
  ultimateLimitState : Prop
  serviceabilityLimitState : Prop

structure LoadBearingEvidence (C : LoadBearingCapacity) where
  materialStrengthClosed : C.materialStrength
  safetyFactorClosed : C.safetyFactor
  loadCombinationsClosed : C.loadCombinations
  ultimateLimitStateClosed : C.ultimateLimitState
  serviceabilityLimitStateClosed : C.serviceabilityLimitState

def LoadBearingClosed (C : LoadBearingCapacity) : Prop :=
  C.materialStrength ∧ C.safetyFactor ∧ C.loadCombinations ∧
  C.ultimateLimitState ∧ C.serviceabilityLimitState

theorem load_bearing_closed_from_evidence (C : LoadBearingCapacity)
    (E : LoadBearingEvidence C) : LoadBearingClosed C := by
  exact And.intro E.materialStrengthClosed
    (And.intro E.safetyFactorClosed
      (And.intro E.loadCombinationsClosed
        (And.intro E.ultimateLimitStateClosed E.serviceabilityLimitStateClosed)))

end CivilEngineeringStructuralAnalysisCanonicalLaneLean
end HautevilleHouse
