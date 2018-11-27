within GenKinetics.Interfaces.Nodes;
connector ChemicalPort
  "reaction connector from a substance to a reaction, 
      declared within the substance side"
  Units.Concentration c "concentration";
  flow Units.VolumetricReactionRate r "reaction rate";
end ChemicalPort;
