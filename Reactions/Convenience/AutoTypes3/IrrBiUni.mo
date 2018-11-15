within GenKinetics.Reactions.Convenience.AutoTypes3;
model IrrBiUni
  extends GenKinetics.Reactions.Convenience.Auto.IrrKinetic(redeclare final
      model Dimensionality =
        GenKinetics.Interfaces.Reactions.Basics.Auto.Dimension.BiUni);
end IrrBiUni;
