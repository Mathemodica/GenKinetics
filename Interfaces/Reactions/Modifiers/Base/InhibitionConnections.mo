within GenKinetics.Interfaces.Reactions.Modifiers.Base;
partial model InhibitionConnections
  extends GenKinetics.Interfaces.Reactions.Modifiers.Base.ModifiersConnections;

  GenKinetics.Interfaces.Nodes.InhibitorConnector mc_I[NI]
    "connection to inhibitors";
end InhibitionConnections;
