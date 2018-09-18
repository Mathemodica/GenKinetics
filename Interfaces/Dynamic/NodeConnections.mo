partial model NodeConnections "Metabolite connections to reactions wuth one connector only"
  GenKinetics.Interfaces.Ports.ChemicalPort rc "connection to any reaction " annotation(
    Placement(transformation(extent = {{-50, -50}, {50, 50}}), iconTransformation(extent = {{-114, -40}, {122, 154}})));
  GenKinetics.Interfaces.Ports.ModifierChemicalPort mc "connection to a modifier" annotation(
    Placement(transformation(extent = {{-50, -50}, {50, -50}}), iconTransformation(extent = {{-64, -122}, {72, 2}})));
  annotation(
    Icon(graphics));
end NodeConnections;
