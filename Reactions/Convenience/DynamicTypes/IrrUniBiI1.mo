within GenKinetics.Reactions.Convenience.DynamicTypes;

model IrrUniBiI1
  extends GenKinetics.Reactions.Convenience.Dynamic.InhIrrKinetic(
    redeclare final model Dimensionality = GenKinetics.Interfaces.Dynamic.Dimension.UniBi,
    redeclare final model Inhibition = GenKinetics.Interfaces.Dynamic.Modifier.OneInhibitor
  );
end IrrUniBiI1;
