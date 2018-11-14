within GenKinetics.Interfaces.Dynamic;
partial model NodeConnections
  "Metabolite connections to reactions wuth one connector only"
  GenKinetics.Interfaces.Nodes.SubstanceConnector rc
    "connection to any reaction ";
  GenKinetics.Interfaces.Nodes.ModifierConnector mc "connection to a modifier";
end NodeConnections;
