import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringStructuralAnalysisCanonicalLaneLean

structure FrameStructurePackage where
  memberEndForces : Prop
  jointDisplacements : Prop
  globalStiffnessAssembled : Prop
  deflectedShape : Prop

structure FrameStructureEvidence (F : FrameStructurePackage) where
  memberEndForcesClosed : F.memberEndForces
  jointDisplacementsClosed : F.jointDisplacements
  globalStiffnessAssembledClosed : F.globalStiffnessAssembled
  deflectedShapeClosed : F.deflectedShape

def FrameStructureClosed (F : FrameStructurePackage) : Prop :=
  F.memberEndForces ∧ F.jointDisplacements ∧ F.globalStiffnessAssembled ∧ F.deflectedShape

theorem frame_structure_closed_from_evidence (F : FrameStructurePackage) (E : FrameStructureEvidence F) :
    FrameStructureClosed F := by
  exact And.intro E.memberEndForcesClosed (And.intro E.jointDisplacementsClosed (And.intro E.globalStiffnessAssembledClosed E.deflectedShapeClosed))

end CivilEngineeringStructuralAnalysisCanonicalLaneLean
end HautevilleHouse
