within GenKinetics.Reactions.Convenience.DynamicTypes3;
model IrrUniBiI1
  extends GenKinetics.Reactions.Convenience.Dynamic.InhIrrKinetic(redeclare
      final model Dimensionality =
        GenKinetics.Interfaces.Reactions.Basics.Base.Dimension.UniBi,
      redeclare final model Inhibition =
        GenKinetics.Interfaces.Reactions.Modifiers.Base.OneInhibitor);
end IrrUniBiI1;
