within GenKinetics.Reactions.Convenience;

package DynamicTypes
  extends Modelica.Icons.VariantsPackage;

  model IrrKinetic1S1P
    extends GenKinetics.Reactions.Convenience.Dynamic.IrrKinetic(redeclare final class Dimensionality = GenKinetics.Interfaces.Dynamic.Dimension.UniUni);
  end IrrKinetic1S1P;
end DynamicTypes;
