within GenKinetics.Interfaces.Dynamic;

partial model InhibitionConnections
  extends GenKinetics.Interfaces.Dynamic.ModifiersConnections;

  GenKinetics.Interfaces.Ports.ModifierChemicalPort_I mc_I[NI]
    "connection to inhibitors";
end InhibitionConnections;
