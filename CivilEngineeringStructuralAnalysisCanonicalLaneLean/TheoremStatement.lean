import CivilEngineeringStructuralAnalysisCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace CivilEngineeringStructuralAnalysisCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  structuralStatement : String
  certificateLane : String
  carriedRemainder : String

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := "civil-engineering-structural-analysis-canonical-lane"
  theoremName := "Structural Analysis Endgame"
  theoremObject := "Ultimate limit state and serviceability under admissible loads"
  classicalBoundary := "material and geometric nonlinearities outside the elastic regime"
  structuralStatement := "For any admissible structure, the ultimate limit state is satisfied under design loads, and the closure is carried by bridge and gate."
  certificateLane := "manifold_constrained"
  carriedRemainder := "Time-dependent effects (creep, fatigue) and probabilistic load distributions remain as carried remainder."
}

end CivilEngineeringStructuralAnalysisCanonicalLaneLean
end HautevilleHouse