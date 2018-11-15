within GenKinetics.Interfaces.Reactions.Modifiers.Auto;
partial model ModifiersConnections
  replaceable model Inhibition =
    UnspecifiedInhibition constrainedby ReactionInhibition;
  extends Inhibition;
  replaceable model Activation =
    UnspecifiedActivation constrainedby ReactionActivation;
  extends Activation;
end ModifiersConnections;
