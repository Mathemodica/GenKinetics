within GenKinetics;

package Units
  extends Modelica.Icons.TypesPackage;
  type Concentration = Modelica.Icons.TypeReal(final unit = "mol/m3", min = 0);
  type VolumetricReactionRate = Modelica.Icons.TypeReal(final unit = "mol/(m3.s)");
  type MolarFlowRate = Modelica.Icons.TypeReal(final unit = "mol/s");
  type ReactionCoef = Modelica.Icons.TypeReal(final unit = "1/s");
  type StoichiometricCoef = Modelica.Icons.TypeReal(final unit = "1");
  type ReactionCoef1st = Units.ReactionCoef;
  type ReactionCoef2nd = Modelica.Icons.TypeReal(final unit = "m3/(mol.s)");
  type AffinityConst = Modelica.Icons.TypeReal(final unit = "mol/m3");
end Units;
