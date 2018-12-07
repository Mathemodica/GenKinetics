within GenKinetics;
package Units "all physical units used across the library"
  extends Modelica.Icons.TypesPackage;

  type Concentration = Modelica.Icons.TypeReal(final quantity="Concentration",final unit = "mol/l", min = 0)
    " Concentration of a metabolite [mol/l]";

  type VolumetricReactionRate =
     Modelica.Icons.TypeReal(final quantity="Volumetric reaction rate",final unit = "mol/(s.l)")
     "Volumetric reaction rate [mol/(l.s)}";

  type MolarFlowRate = Modelica.Icons.TypeReal(final unit = "mol/s")
    "Molar flow rate [mol/s]";

  type ReactionCoef = Modelica.Icons.TypeReal(final unit = "1/s")
   "Reaction coefficient [1/s]";

  type StoichiometricCoef = Modelica.Icons.TypeReal(final unit = "1")
    " Stoichiometric Coefficient [unitless]";

  type ReactionCoef1st = Units.ReactionCoef
    "Reaction coefficient first order";

  type ReactionCoef2nd = Modelica.Icons.TypeReal(final unit = "l/(mol.s)")
    "Reaction coefficient second order [1/(mol.s)]";

  type AffinityConst = Modelica.Icons.TypeReal(final unit = "mol/l")
    "Affinity constant [mol/l]";

  annotation (
    Documentation(info="<html>
<p>This package contains basic physical units describing main entitites of a biochemical reaction network model.</p>
</html>"));
end Units;
