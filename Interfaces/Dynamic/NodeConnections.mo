within GenKinetics.Interfaces.Dynamic;
partial model NodeConnections
  "Metabolite connections to reactions wuth one connector only"
GenKinetics.Interfaces.Ports.ChemicalPort rc "connection to any reaction ";
  GenKinetics.Interfaces.Ports.ModifierChemicalPort mc "connection to a modifier";
end NodeConnections;
