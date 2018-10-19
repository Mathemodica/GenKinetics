within GenKinetics.Reactions.Convenience.DynamicTypes;

model IrrUniUni1I
  extends GenKinetics.Reactions.Convenience.Dynamic.InhIrrKinetic(
    redeclare final model Dimensionality = GenKinetics.Interfaces.Dynamic.Dimension.UniUni,
    redeclare final model Inhibition = GenKinetics.Interfaces.Dynamic.Modifier.OneInhibitor
  );
end IrrUniUni1I;
