within GenKinetics.Reactions.Convenience.Dynamic;
partial model BasicModifier

  replaceable model Inhibition =
      Interfaces.Dynamic.Modifier.UnspecifiedInhibition                            constrainedby
    Interfaces.Dynamic.Modifier.ReactionInhibition;
  extends Inhibition;

  replaceable model Activation =
      Interfaces.Dynamic.Modifier.UnspecifiedActivation constrainedby
    Interfaces.Dynamic.Modifier.ReactionActivation;
  extends Activation;

end BasicModifier;
