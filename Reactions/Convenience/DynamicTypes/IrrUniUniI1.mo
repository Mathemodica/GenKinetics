within GenKinetics.Reactions.Convenience.DynamicTypes;
model IrrUniUniI1
  /* extends GenKinetics.Reactions.Convenience.Dynamic.InhIrrKinetic(
      redeclare final model Dimensionality = GenKinetics.Interfaces.Dynamic.Dimension.UniUni,
      redeclare final model Inhibition = GenKinetics.Interfaces.Dynamic.Modifier.OneInhibitor
    ); */
  extends GenKinetics.Reactions.Convenience.Dynamic.InhIrrKinetic(redeclare
      final model Dimensionality =
        GenKinetics.Interfaces.Dynamic.Dimension.UniUni, redeclare final
      parameter Integer NI=1);
end IrrUniUniI1;
