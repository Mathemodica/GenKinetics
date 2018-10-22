within GenKinetics.Interfaces.Ports;
connector ModifierChemicalPort
  "connector that connects a node to a reaction. The node is supposed to effects (activate or inhibit) the reaction"

  input Units.Concentration c "concentration";

end ModifierChemicalPort;
