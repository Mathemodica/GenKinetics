within GenKinetics.Interfaces.Dynamic;
partial model ReactionConnections
  replaceable model Structure =
    Interfaces.Dynamic.Structure.ReactionStructure                             constrainedby
    Interfaces.Dynamic.Structure.ReactionStructure;
  extends Structure;

  GenKinetics.Interfaces.Nodes.SubstrateConnector rc_S[NS]
    "connection to substrates";
  GenKinetics.Interfaces.Nodes.ProductConnector rc_P[NP]
    "connection to product";
end ReactionConnections;
