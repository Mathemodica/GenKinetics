within GenKinetics.Reactions.Convenience.DynamicTypes;
model IrrBiUni
  extends GenKinetics.Reactions.Convenience.Dynamic.IrrKinetic(redeclare final
      model Dimensionality = GenKinetics.Interfaces.Dynamic.Dimension.BiUni);
end IrrBiUni;
