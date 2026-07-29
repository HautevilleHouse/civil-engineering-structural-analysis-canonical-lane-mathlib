import CivilEngineeringStructuralAnalysisCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace CivilEngineeringStructuralAnalysisCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  AdmittedWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CivilEngineeringStructuralAnalysisCanonicalLaneLean
end HautevilleHouse
