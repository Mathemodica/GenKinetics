within GenKinetics.Interfaces.Substances.Auto;
partial model SubstanceConnections
  "Metabolite connections to reactions wuth one connector only"
  GenKinetics.Interfaces.Nodes.SubstanceConnector rc
    "connection to any reaction ";
  GenKinetics.Interfaces.Nodes.ModifierConnector mc "connection to a modifier";
end SubstanceConnections;
