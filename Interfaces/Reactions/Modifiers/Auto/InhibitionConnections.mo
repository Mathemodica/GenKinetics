within GenKinetics.Interfaces.Reactions.Modifiers.Auto;
partial model InhibitionConnections
  extends GenKinetics.Interfaces.Reactions.Modifiers.Auto.ModifiersConnections;

  GenKinetics.Interfaces.Nodes.InhibitorConnector mc_I[NI]
    "connection to inhibitors";
end InhibitionConnections;
