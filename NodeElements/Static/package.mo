within GenKinetics.NodeElements;
package Static
  extends Modelica.Icons.Package;

  partial model BasicNode "Basic declarations of any Metabolite"
    extends GenKinetics.Interfaces.Static.NodeConnections;
    parameter GenKinetics.Units.Concentration c_0 = 0 "initial reaction rate";
    GenKinetics.Units.Concentration c(start = c_0) "dynamic concentration";
    GenKinetics.Units.VolumetricReactionRate r_net "net reaction rate";
  equation
    nc.rc.c = c;
    nc.mc.c = c;
    r_net = nc.rc.r;
    //r_net = rc1.r + rc2.r + rc3.r + rc4.r;
    //rc1.c = c;
    //rc2.c = c;
    //rc3.c = c;
    //rc4.c = c;
    //mc1.c = c;
    //mc2.c = c;
    //mc3.c = c;
    //mc4.c = c;
    annotation (
      Line(points = {{50, 90}, {50, 90}}, color = {0, 0, 255}, smooth = Smooth.None),
      Icon(graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255})}),
      Diagram(graphics));
  end BasicNode;



  model Node "Metabolite with dynamic rate"
    extends Static.BasicNode;
    parameter Units.Concentration tolerance=1e-6;
  equation
    // der(c) = r_net;
    der(c) = if
               (c < tolerance and r_net < 0) then 0 else r_net;
  end Node;



  model FixedConcentrationNode "Metabolite with fixed concentration"
    extends Static.BasicNode;
  equation
    c = c_0;
  end FixedConcentrationNode;


  partial model BasicNode2 "Basic declarations of any Metabolite"
    extends GenKinetics.Interfaces.Static.NodeConnections;
    extends GenKinetics.NodeElements.Dynamic.BasicNode;
    annotation (
      Line(points = {{50, 90}, {50, 90}}, color = {0, 0, 255}, smooth = Smooth.None),
      Icon(graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255})}),
      Diagram(graphics));
  end BasicNode2;

  model Node2 "Metabolite with dynamic rate"
    extends Static.BasicNode2;
    //  extends Dynamic.Node;
      parameter Units.Concentration tolerance=1e-6;
  equation
  //  der(c) = r_net;
    der(c) = if
               (c < tolerance) then 0 else r_net;
  end Node2;




  annotation (
    Documentation(info = "<html><head></head><body><p>This subpackage contains implmentation for nodes, chemical substances, which provides a fixed number of connections to reactions. Typically the component&nbsp;<a href=\"GenKinetics.NodeElements.Static.Node\">GenKinetics.NodeElements.Static.Node</a>&nbsp;is the one which will be used at most.&nbsp;</p><p><br>Licensed under the Modelica License 2</p><p><br>Copyright ©&nbsp;<a href=\"GenKinetics.UserGuide.CopyRight\" style=\"font-size: 12px;\">GenKinetics.UserGuide.CopyRight</a></p><p><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p></body></html>"));






end Static;
