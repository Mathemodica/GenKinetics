within GenKinetics.Interfaces.Reactions.Basics.Base;
partial model ReactionConnections
  import GenKinetics;
  replaceable model Structure =
    GenKinetics.Interfaces.Reactions.Basics.Base.Structure.ReactionStructure
    constrainedby
    GenKinetics.Interfaces.Reactions.Basics.Base.Structure.ReactionStructure;
  extends Structure;

  GenKinetics.Interfaces.Nodes.SubstrateConnector rc_S[NS]
    "connection to substrates";
  GenKinetics.Interfaces.Nodes.ProductConnector rc_P[NP]
    "connection to product";
end ReactionConnections;
