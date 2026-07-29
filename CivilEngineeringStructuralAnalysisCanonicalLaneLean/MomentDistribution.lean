import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringStructuralAnalysisCanonicalLaneLean

structure ContinuousBeam where
  spans : List ℝ
  loads : List (ℝ → ℝ)
  supportConditions : List String
  memberStiffness : List ℝ
  fixedEndMoments : Prop
  distributionFactorsComputed : Prop
  carryOverFactorsDefined : Prop

structure MomentDistributionPackage where
  beam : ContinuousBeam
  stiffnessFactorMethod : Prop
  momentBalancingIteration : Prop
  finalMomentsComputed : Prop
  shearsAndReactionsComputed : Prop

structure MomentDistributionEvidence (M : MomentDistributionPackage) where
  stiffnessFactorMethodClosed : M.stiffnessFactorMethod
  momentBalancingIterationClosed : M.momentBalancingIteration
  finalMomentsComputedClosed : M.finalMomentsComputed
  shearsAndReactionsComputedClosed : M.shearsAndReactionsComputed

def MomentDistributionClosed (M : MomentDistributionPackage) : Prop :=
  M.stiffnessFactorMethod ∧ M.momentBalancingIteration ∧ M.finalMomentsComputed ∧
  M.shearsAndReactionsComputed

theorem moment_distribution_closed_from_evidence (M : MomentDistributionPackage) (E : MomentDistributionEvidence M) :
    MomentDistributionClosed M := by
  exact And.intro E.stiffnessFactorMethodClosed
    (And.intro E.momentBalancingIterationClosed
      (And.intro E.finalMomentsComputedClosed E.shearsAndReactionsComputedClosed))

end CivilEngineeringStructuralAnalysisCanonicalLaneLean
end HautevilleHouse