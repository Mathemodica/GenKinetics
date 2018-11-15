within GenKinetics.Substances.Auto;
partial model BasicSubstance "Basic declarations of any Metabolite"
  extends GenKinetics.Interfaces.Substances.Auto.NodeConnections;
  extends Interfaces.Substances.Substance;

equation
  r_net = rc.r;
  rc.c = c;
  mc.c = c;
end BasicSubstance;
