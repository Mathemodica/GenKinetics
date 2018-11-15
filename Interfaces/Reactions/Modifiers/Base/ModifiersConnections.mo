within GenKinetics.Interfaces.Reactions.Modifiers.Base;
partial model ModifiersConnections
  replaceable model Inhibition =
    Modifiers.Base.UnspecifiedInhibition constrainedby
    Modifiers.Base.ReactionInhibition;
  extends Inhibition;
  replaceable model Activation =
    Modifiers.Base.UnspecifiedActivation constrainedby
    Modifiers.Base.ReactionActivation;
  extends Activation;
end ModifiersConnections;
