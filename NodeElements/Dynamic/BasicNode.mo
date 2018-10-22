within GenKinetics.NodeElements.Dynamic;
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
