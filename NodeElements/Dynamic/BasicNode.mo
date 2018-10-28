within GenKinetics.NodeElements.Dynamic;
partial model BasicNode "Basic declarations of any Metabolite"
  extends GenKinetics.Interfaces.Dynamic.NodeConnections;
  extends NodeElements.PartialNode;

equation
  r_net = rc.r;
  rc.c = c;
  mc.c = c;
end BasicNode;
