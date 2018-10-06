within GenKinetics.NodeElements;

package Static
  extends Modelica.Icons.Package;

  partial model BasicNode "Basic declarations of any Metabolite"
    extends GenKinetics.Interfaces.Static.NodeConnections;
    parameter GenKinetics.Units.Concentration c_0 = 0 "initial reaction rate";
    GenKinetics.Units.Concentration c(start = c_0) "dynamic concentration";
    GenKinetics.Units.VolumetricReactionRate r_net "net reaction rate";
  equation
  
    rc.c = c; 
    mc.c = c; 
    r_net = rc.r; 
  
    //r_net = rc1.r + rc2.r + rc3.r + rc4.r;
    //rc1.c = c;
    //rc2.c = c;
    //rc3.c = c;
    //rc4.c = c;
    //mc1.c = c;
    //mc2.c = c;
    //mc3.c = c;
    //mc4.c = c;
    annotation(
      Line(points = {{50, 90}, {50, 90}}, color = {0, 0, 255}, smooth = Smooth.None),
      Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255})}),
      Diagram(graphics));
  end BasicNode;



  model Node "Metabolite with dynamic rate"
    extends Static.BasicNode;
  equation
    der(c) = r_net;
  end Node;

  model FixedConcentrationNode "Metabolite with fixed concentration"
    extends Static.BasicNode;
    parameter GenKinetics.Units.Concentration c_fixed = 1.0;
  equation
    c = c_fixed;
  end FixedConcentrationNode;






end Static;
