  connector ChemicalPort_S "connector from a reactant substrate node to a reaction, declared within the reaction side"
    extends ADGenKinetics.Interfaces.ChemicalPort;
    annotation(
      Icon(graphics = {Bitmap(extent = {{-80, 80}, {82, -82}}, fileName = "../icons/reactionconnection_S.gif")}),
      Diagram(graphics));
  end ChemicalPort_S;
