import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringStructuralAnalysisCanonicalLaneLean

structure TrussStructure where
  joints : List (ℕ × ℝ × ℝ)
  members : List (ℕ × ℕ × ℝ)
  supports : List (ℕ × (ℝ × ℝ → Prop))
  loads : List (ℕ × ℝ × ℝ)
  allMembersConnected : Prop
  staticDeterminacy : Prop
  stabilityCondition : Prop

structure TrussAnalysisPackage where
  truss : TrussStructure
  methodOfJoints : Prop
  methodOfSections : Prop
  zeroForceMembersIdentified : Prop
  memberForcesComputed : Prop
  jointDisplacementsComputed : Prop

structure TrussAnalysisEvidence (T : TrussAnalysisPackage) where
  methodOfJointsClosed : T.methodOfJoints
  methodOfSectionsClosed : T.methodOfSections
  zeroForceMembersIdentifiedClosed : T.zeroForceMembersIdentified
  memberForcesComputedClosed : T.memberForcesComputed
  jointDisplacementsComputedClosed : T.jointDisplacementsComputed

def TrussAnalysisClosed (T : TrussAnalysisPackage) : Prop :=
  T.methodOfJoints ∧ T.methodOfSections ∧ T.zeroForceMembersIdentified ∧
  T.memberForcesComputed ∧ T.jointDisplacementsComputed

theorem truss_analysis_closed_from_evidence (T : TrussAnalysisPackage) (E : TrussAnalysisEvidence T) :
    TrussAnalysisClosed T := by
  exact And.intro E.methodOfJointsClosed
    (And.intro E.methodOfSectionsClosed
      (And.intro E.zeroForceMembersIdentifiedClosed
        (And.intro E.memberForcesComputedClosed E.jointDisplacementsComputedClosed)))

end CivilEngineeringStructuralAnalysisCanonicalLaneLean
end HautevilleHouse