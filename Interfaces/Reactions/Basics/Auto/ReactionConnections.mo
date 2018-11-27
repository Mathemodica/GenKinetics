within GenKinetics.Interfaces.Reactions.Basics.Auto;
partial model ReactionConnections "Connector within a reactions"
  import GenKinetics;
  replaceable model Structure =
    GenKinetics.Interfaces.Reactions.Basics.Auto.Structure.ReactionStructure
    constrainedby
    GenKinetics.Interfaces.Reactions.Basics.Auto.Structure.ReactionStructure;
  extends Structure;

  GenKinetics.Interfaces.Nodes.SubstrateConnector rc_S[NS]
    "connection to substrates";
  GenKinetics.Interfaces.Nodes.ProductConnector rc_P[NP]
    "connection to product";
end ReactionConnections;
