within GenKinetics.NodeElements;
package Dynamic
  extends Modelica.Icons.Package;

  partial model BasicNode "Basic declarations of any Metabolite"
    extends GenKinetics.Interfaces.Dynamic.NodeConnections;
    parameter Units.Concentration c_0 = 0 "initial concentration";
    Units.Concentration c(start = c_0) "substance concentration";
    Units.VolumetricReactionRate r_net "net reaction rate";
  equation
    r_net = rc.r;
    rc.c = c;
    mc.c = c;
  end BasicNode;

  model Node "Metabolite with dynamic rate"
    extends GenKinetics.NodeElements.Dynamic.BasicNode;
    parameter Units.Concentration tolerance=1e-6;
  equation
   der(c) = if
              (c < tolerance) then 0 else r_net;
   // der(c) = r_net;
  end Node;


  model FixedConcentrationNode "Metabolite with fixed concentration"
    extends GenKinetics.NodeElements.Dynamic.BasicNode;
  equation
    c = c_0;
  end FixedConcentrationNode;



  annotation (
    Documentation(info = "<html><head></head><body><p>This subpackage contains implmentation for nodes, chemical substances, which can be connected to arbitrary number of reactions. Typically the component&nbsp;<a href=\"GenKinetics.NodeElements.dynamic.Node\">GenKinetics.NodeElements.dynamic.Node</a>&nbsp;is the one which will be used at most. The component&nbsp;<a href=\"GenKinetics.NodeElements.dynamic.ModifierNode\">GenKinetics.NodeElements.dynamic.ModifierNode</a>&nbsp;is exactly the same and does not really provide additional functionalities (it is here only for backword compatibility reasons with older versions of this implementation). This component will mostly get removed in later versions.</p><p><br>Licensed under the Modelica License 2</p><p><br>Copyright ©&nbsp;<a href=\"GenKinetics.UserGuide.CopyRight\" style=\"font-size: 12px;\">GenKinetics.UserGuide.CopyRight</a></p><p><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see<a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p></body></html>"));
end Dynamic;
