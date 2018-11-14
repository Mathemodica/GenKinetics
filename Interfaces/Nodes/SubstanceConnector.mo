within GenKinetics.Interfaces.Nodes;
connector SubstanceConnector
  "reaction connector from a node to a reaction, declared within the node side"
  Units.Concentration c "concentration";
  flow Units.VolumetricReactionRate r "reaction rate";
end SubstanceConnector;
