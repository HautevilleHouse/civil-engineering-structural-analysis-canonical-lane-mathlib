import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringStructuralAnalysisCanonicalLaneLean

structure TrussSystemStability where
  memberForces : Prop
  jointEquilibrium : Prop
  stabilityCriterion : Prop
  deflectionLimit : Prop
  bucklingCheck : Prop

structure TrussStabilityEvidence (T : TrussSystemStability) where
  memberForcesClosed : T.memberForces
  jointEquilibriumClosed : T.jointEquilibrium
  stabilityCriterionClosed : T.stabilityCriterion
  deflectionLimitClosed : T.deflectionLimit
  bucklingCheckClosed : T.bucklingCheck

def TrussStabilityClosed (T : TrussSystemStability) : Prop :=
  T.memberForces ∧ T.jointEquilibrium ∧ T.stabilityCriterion ∧
  T.deflectionLimit ∧ T.bucklingCheck

theorem truss_stability_closed_from_evidence (T : TrussSystemStability)
    (E : TrussStabilityEvidence T) : TrussStabilityClosed T := by
  exact And.intro E.memberForcesClosed
    (And.intro E.jointEquilibriumClosed
      (And.intro E.stabilityCriterionClosed
        (And.intro E.deflectionLimitClosed E.bucklingCheckClosed)))

end CivilEngineeringStructuralAnalysisCanonicalLaneLean
end HautevilleHouse
