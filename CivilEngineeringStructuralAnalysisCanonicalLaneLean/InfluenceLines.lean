import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringStructuralAnalysisCanonicalLaneLean

structure StructureWithMovingLoad where
  structureGeometry : Type
  influenceFunction : ℝ → ℝ
  influenceLineDefined : Prop
  unitLoadPosition : ℝ
  responseAtPoint : ℝ
  maxResponseFound : Prop
  criticalLoadPosition : Prop

structure InfluenceLinePackage where
  structure : StructureWithMovingLoad
  mullerBreslauPrinciple : Prop
  influenceLineForReaction : Prop
  influenceLineForShear : Prop
  influenceLineForMoment : Prop
  concentratedLoadResponse : Prop
  distributedLoadResponse : Prop
  maxEnvelopeComputed : Prop

structure InfluenceLineEvidence (I : InfluenceLinePackage) where
  mullerBreslauPrincipleClosed : I.mullerBreslauPrinciple
  influenceLineForReactionClosed : I.influenceLineForReaction
  influenceLineForShearClosed : I.influenceLineForShear
  influenceLineForMomentClosed : I.influenceLineForMoment
  concentratedLoadResponseClosed : I.concentratedLoadResponse
  distributedLoadResponseClosed : I.distributedLoadResponse
  maxEnvelopeComputedClosed : I.maxEnvelopeComputed

def InfluenceLineClosed (I : InfluenceLinePackage) : Prop :=
  I.mullerBreslauPrinciple ∧ I.influenceLineForReaction ∧ I.influenceLineForShear ∧
  I.influenceLineForMoment ∧ I.concentratedLoadResponse ∧ I.distributedLoadResponse ∧
  I.maxEnvelopeComputed

theorem influence_line_closed_from_evidence (I : InfluenceLinePackage) (E : InfluenceLineEvidence I) :
    InfluenceLineClosed I := by
  exact And.intro E.mullerBreslauPrincipleClosed
    (And.intro E.influenceLineForReactionClosed
      (And.intro E.influenceLineForShearClosed
        (And.intro E.influenceLineForMomentClosed
          (And.intro E.concentratedLoadResponseClosed
            (And.intro E.distributedLoadResponseClosed E.maxEnvelopeComputedClosed)))))

end CivilEngineeringStructuralAnalysisCanonicalLaneLean
end HautevilleHouse