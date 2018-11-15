within GenKinetics.Interfaces.Reactions.Modifiers.Auto;
partial model ActivationConnections
  extends ModifiersConnections;
GenKinetics.Interfaces.Nodes.InhibitorConnector mc_A[NA]
  "connection to activators";
end ActivationConnections;
