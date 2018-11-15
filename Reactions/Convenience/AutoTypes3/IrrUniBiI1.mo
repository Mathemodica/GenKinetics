within GenKinetics.Reactions.Convenience.AutoTypes3;
model IrrUniBiI1
  extends GenKinetics.Reactions.Convenience.Auto.InhIrrKinetic(redeclare final
      model Dimensionality =
        GenKinetics.Interfaces.Reactions.Basics.Auto.Dimension.UniBi,
      redeclare final model Inhibition =
        GenKinetics.Interfaces.Reactions.Modifiers.Auto.Inhibitor);
end IrrUniBiI1;
