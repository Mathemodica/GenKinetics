  connector ChemicalPort "reaction connector from a node to a reaction, declared within the node side"
    Units.Concentration c "concentration";
    flow Units.VolumetricReactionRate r "reaction rate";
    annotation(
      Icon(graphics = {Bitmap(extent = {{-75, 75}, {75, -75}}, fileName = "../../icons/reactionconnection.gif")}),
      Diagram(graphics));
  end ChemicalPort;
