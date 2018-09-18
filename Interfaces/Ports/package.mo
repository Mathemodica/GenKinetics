within GenKinetics.Interfaces;

package Ports
  extends Modelica.Icons.BasesPackage;

  connector ChemicalPort "reaction connector from a node to a reaction, declared within the node side"
    Units.Concentration c "concentration";
    flow Units.VolumetricReactionRate r "reaction rate";
    annotation(
      Icon(graphics = {Bitmap(extent = {{-75, 75}, {75, -75}}, fileName = "../../icons/reactionconnection.gif")}),
      Diagram(graphics));
  end ChemicalPort;

  connector ModifierChemicalPort "connector that connects a node to a reaction. The node is supposed to effects (activate or inhibit) the reaction"
    input Units.Concentration c "concentration";
    annotation(
      Icon(graphics = {Bitmap(extent = {{-80, 84}, {100, -98}}, fileName = "../../icons/modifierconnection.gif")}));
  end ModifierChemicalPort;

  connector ChemicalPort_S "connector from a reactant substrate node to a reaction, declared within the reaction side"
    extends GenKinetics.Interfaces.Ports.ChemicalPort;
    annotation(
      Icon(graphics = {Bitmap(extent = {{-80, 80}, {82, -82}}, fileName = "../../icons/reactionconnection_S.gif")}),
      Diagram(graphics));
  end ChemicalPort_S;

  connector ChemicalPort_P "connector from a reactant substrate node to a reaction, declared within the reaction side"
    extends GenKinetics.Interfaces.Ports.ChemicalPort;
    annotation(
      Icon(graphics = {Bitmap(extent = {{-88, 106}, {94, -104}}, fileName = "../../icons/reactionconnection_P2.gif")}));
  end ChemicalPort_P;

  connector ModifierChemicalPort_I "connection from a reaction to an inhibition node"
    extends GenKinetics.Interfaces.Ports.ModifierChemicalPort;
    annotation(
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent = {{-80, 80}, {84, -80}}, fileName = "../../icons/modifierconnection_I2.gif")}));
  end ModifierChemicalPort_I;

  connector ModifierChemicalPort_A "connection from a reaction to an activation node"
    extends GenKinetics.Interfaces.Ports.ModifierChemicalPort;
    annotation(
      Icon(graphics = {Bitmap(extent = {{-96, 100}, {124, -120}}, fileName = "../../icons/modifierconnection_A2.gif")}));
  end ModifierChemicalPort_A;
  annotation(
    Documentation(info = "<html><head></head><body><p>This subpackage contains all connectors (chemical ports) used across the library</p><p><br>Licensed under the Modelica License 2</p><p><br>Copyright ©&nbsp;<a href=\"GenKinetics.UserGuide.CopyRight\" style=\"font-size: 12px;\">GenKinetics.UserGuide.CopyRight</a></p><p><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a>&nbsp;or visit<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p></body></html>"));
end Ports;
