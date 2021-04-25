within GenKinetics;
package Units "all physical units used across the library"
  extends BioChem.Icons.Units;

  type AffinityConst = BioChem.Icons.Units.TypeRealBase(final unit = "mol/l")
    "Affinity constant [mol/l]";
 

  type Concentration = BioChem.Units.Concentration
    " Concentration of a metabolite [mol/l]";
    
  type Elasticity = BioChem.Icons.Units.TypeRealBase(final quantity="Elasticity",final unit = "1")
  "Elasticity [unitless]";

  type MolarFlowRate = Modelica.Icons.TypeReal(final unit = "mol/s")
    "Molar flow rate [mol/s]";

  type ReactionCoef = BioChem.Units.ReactionCoefficient(final unit = "1/s")
   "Reaction coefficient [1/s]";

  type ReactionCoef1st = Units.ReactionCoef
    "Reaction coefficient first order";

  type ReactionCoef2nd = BioChem.Icons.Units.TypeRealBase(final unit = "l/(mol.s)")
    "Reaction coefficient second order [1/(mol.s)]";

  type StoichiometricCoef = BioChem.Units.StoichiometricCoefficient(final unit = "1")
    " Stoichiometric Coefficient [unitless]";

  type Volume = BioChem.Units.Volume "Volume [l]";

  type VolumetricReactionRate = BioChem.Units.VolumetricReactionRate
     "Volumetric reaction rate [mol/(l.s)}";


  annotation (
    Documentation(info="<html>
<p>This package contains basic physical units describing main entitites of a biochemical reaction network model.</p>
</html>"));
end Units;
