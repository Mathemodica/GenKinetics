within GenKinetics.Reactions.Convenience.DynamicTypes3;
model IrrBiUni
  extends GenKinetics.Reactions.Convenience.Dynamic.IrrKinetic(redeclare final
      model Dimensionality =
        GenKinetics.Interfaces.Reactions.Basics.Base.Dimension.BiUni);
end IrrBiUni;
