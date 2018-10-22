within GenKinetics.Interfaces.Reversible;
partial model TwoWay "Reversible Reaction"
  extends OneWay;
  parameter Units.ReactionCoef Vbwdmax = 1 "backward maximal reaction rate";
end TwoWay;
