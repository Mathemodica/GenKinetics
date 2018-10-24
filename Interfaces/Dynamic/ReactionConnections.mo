within GenKinetics.Interfaces.Dynamic;

partial model ReactionConnections 
  replaceable model Structure =
    Interfaces.Dynamic.Structure.ReactionStructure                             constrainedby
    Interfaces.Dynamic.Structure.ReactionStructure;
  extends Structure;
  
  GenKinetics.Interfaces.Ports.ChemicalPort_S rc_S[NS]
    "connection to substrates";
  GenKinetics.Interfaces.Ports.ChemicalPort_P rc_P[NP] "connection to product";
end ReactionConnections;
