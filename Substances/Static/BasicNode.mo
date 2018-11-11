within GenKinetics.Substances.Static;
partial model BasicNode "Basic declarations of any Metabolite"
  extends GenKinetics.Interfaces.Static.NodeConnections;
  extends Substances.PartialNode;

equation
  rc.c = c;
  mc.c = c;
  r_net = rc.r + rc1.r + rc2.r + rc3.r + rc4.r;
  annotation (
    Line(points = {{50, 90}, {50, 90}}, color = {0, 0, 255}, smooth = Smooth.None),
    Icon(graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255})}),
    Diagram(graphics));
end BasicNode;