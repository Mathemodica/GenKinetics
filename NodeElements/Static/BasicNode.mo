within GenKinetics.NodeElements.Static;
partial model BasicNode "Basic declarations of any Metabolite"
  extends GenKinetics.NodeElements.Dynamic.BasicNode(
    redeclare replaceable model NodeConnections =
        GenKinetics.Interfaces.Static.NodeConnections);
  /*parameter GenKinetics.Units.Concentration c_0 = 0 "initial reaction rate";
  GenKinetics.Units.Concentration c(start = c_0) "dynamic concentration";
  GenKinetics.Units.VolumetricReactionRate r_net "net reaction rate";*/
equation
  /*nc.rc.c = c;
  nc.mc.c = c;
  r_net = nc.rc.r;*/
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
