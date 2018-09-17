  connector ModifierChemicalPort "connector that connects a node to a reaction. The node is supposed to effects (activate or inhibit) the reaction"
    input Units.Concentration c "concentration";
    annotation(
      Icon(graphics = {Bitmap(extent = {{-80, 84}, {100, -98}}, fileName = "../../icons/modifierconnection.gif")}));
  end ModifierChemicalPort;
