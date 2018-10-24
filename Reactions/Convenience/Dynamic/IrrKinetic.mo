within GenKinetics.Reactions.Convenience.Dynamic;
model IrrKinetic "S1 + S2 + ... => P1 + P2 + ... "
  extends GenKinetics.Reactions.Convenience.Dynamic.BasicIrrReaction;
  /* extends GenKinetics.Reactions.Convenience.Dynamic.BasicIrrReaction(redeclare 
      final model Activation = Interfaces.Dynamic.Modifier.NoActivation,
      redeclare final model Inhibition =
        Interfaces.Dynamic.Modifier.NoInhibition);*/
equation
  v = S1 / S2;
end IrrKinetic;
