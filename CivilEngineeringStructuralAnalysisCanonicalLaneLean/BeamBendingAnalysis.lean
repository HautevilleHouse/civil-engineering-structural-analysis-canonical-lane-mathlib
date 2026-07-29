import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringStructuralAnalysisCanonicalLaneLean

structure BeamBendingPackage where
  beamGeometry : Prop
  loadingDistribution : Prop
  shearForceDistribution : Prop
  bendingMomentDistribution : Prop
  deflectionCurve : Prop
  boundaryConditions : Prop
  eulerBernoulliAssumption : Prop

structure BeamBendingEvidence (B : BeamBendingPackage) where
  beamGeometryClosed : B.beamGeometry
  loadingDistributionClosed : B.loadingDistribution
  shearForceDistributionClosed : B.shearForceDistribution
  bendingMomentDistributionClosed : B.bendingMomentDistribution
  deflectionCurveClosed : B.deflectionCurve
  boundaryConditionsClosed : B.boundaryConditions
  eulerBernoulliAssumptionClosed : B.eulerBernoulliAssumption

def BeamBendingClosed (B : BeamBendingPackage) : Prop :=
  B.beamGeometry ∧ B.loadingDistribution ∧ B.shearForceDistribution ∧
  B.bendingMomentDistribution ∧ B.deflectionCurve ∧ B.boundaryConditions ∧
  B.eulerBernoulliAssumption

theorem beam_bending_closed_from_evidence (B : BeamBendingPackage) (E : BeamBendingEvidence B) :
    BeamBendingClosed B := by
  exact And.intro E.beamGeometryClosed
    (And.intro E.loadingDistributionClosed
      (And.intro E.shearForceDistributionClosed
        (And.intro E.bendingMomentDistributionClosed
          (And.intro E.deflectionCurveClosed
            (And.intro E.boundaryConditionsClosed E.eulerBernoulliAssumptionClosed)))))

end CivilEngineeringStructuralAnalysisCanonicalLaneLean
end HautevilleHouse