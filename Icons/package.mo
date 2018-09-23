within GenKinetics;

package Icons
  extends Modelica.Icons.IconsPackage;

  partial model Reaction "icon for a reaction"
    annotation(
      Icon(graphics = {Bitmap(extent = {{-106, 110}, {134, -130}}, fileName = "reaction.gif")}));
  end Reaction;







  partial model Port_P
    annotation(
      Icon(graphics = {Bitmap(extent = {{-75, 75}, {75, -75}}, fileName = "reactionconnection_P.gif")}),
      Diagram(graphics));
  end Port_P;







  partial model Port_I
    annotation(
      Icon(graphics = {Bitmap(extent = {{-75, 75}, {75, -75}}, fileName = "modifierconnection_I2.gif")}),
      Diagram(graphics));
  
  end Port_I;









  partial model Port_A
    annotation(
      Icon(graphics = {Bitmap(extent = {{-75, 75}, {75, -75}}, fileName = "modifierconnection_A2.gif")}),
      Diagram(graphics));
  end Port_A;







  partial model Port_M
    annotation(
      Icon(graphics = {Bitmap(extent = {{-75, 75}, {75, -75}}, fileName = "modifierconnection.gif")}),
      Diagram(graphics));
  end Port_M;

  partial model Node
    annotation(
      Line(points = {{-43, 73}, {-43, 90.5}, {-43, 90.5}, {-43, 73}}, color = {0, 0, 255}, smooth = Smooth.None),
      Diagram(graphics),
      Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255})}));
  end Node;

  partial model Port
    annotation(
      Icon(graphics = {Bitmap(extent = {{-75, 75}, {75, -75}}, fileName = "reactionconnection.gif")}),
      Diagram(graphics));
  end Port;

  partial model Port_S
    annotation(
      Icon(graphics = {Bitmap(extent = {{-75, 75}, {75, -75}}, fileName = "reactionconnection_S.gif")}),
      Diagram(graphics));
  end Port_S;
  annotation(
    Documentation(info = "<html><head></head><body><p>This subpackage contains basic icons to be reused acroos the library.&nbsp;</p><p><br>Licensed under the Modelica License 2</p><p><br>Copyright ©&nbsp;<a href=\"GenKinetics.UserGuide.CopyRight\" style=\"font-size: 12px;\">GenKinetics.UserGuide.CopyRight</a></p><p><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a>&nbsp;or visit<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p></body></html>"));
end Icons;
