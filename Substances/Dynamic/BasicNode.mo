within GenKinetics.Substances.Dynamic;
partial model BasicNode "Basic declarations of any Metabolite"
  extends GenKinetics.Interfaces.Dynamic.NodeConnections;
  extends Interfaces.Substances.Substance;

equation
  r_net = rc.r;
  rc.c = c;
  mc.c = c;
end BasicNode;
