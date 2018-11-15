within GenKinetics.Reactions.Convenience.DynamicTypes3;
model IrrUniUniI1
  extends GenKinetics.Reactions.Convenience.Dynamic.InhIrrKinetic(redeclare
      final model Dimensionality =
        GenKinetics.Interfaces.Reactions.Basics.Base.Dimension.UniUni,
      redeclare final model Inhibition =
        GenKinetics.Interfaces.Reactions.Modifiers.Base.OneInhibitor);
  /* extends GenKinetics.Reactions.Convenience.Dynamic.InhIrrKinetic(redeclare 
      final model Dimensionality =
        GenKinetics.Interfaces.Dynamic.Dimension.UniUni, redeclare final parameter 
        Integer NI=1); */
end IrrUniUniI1;
