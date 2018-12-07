within GenKinetics.Reactions.Convenience.AutoTypes3;
model IrrUniUniI1
  extends GenKinetics.Reactions.Convenience.Auto.InhIrrKinetic(redeclare final
      model Dimensionality =
        GenKinetics.Interfaces.Reactions.Basics.Auto.Dimension.UniUni,
      redeclare final model Inhibition =
        GenKinetics.Interfaces.Reactions.Modifiers.Auto.Inhibitor);
  /* extends GenKinetics.Reactions.Convenience.Dynamic.InhIrrKinetic(redeclare 
      final model Dimensionality =
        GenKinetics.Interfaces.Dynamic.Dimension.UniUni, redeclare final parameter 
        Integer NI=1); */
end IrrUniUniI1;
