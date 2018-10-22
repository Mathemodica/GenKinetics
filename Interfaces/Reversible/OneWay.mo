within GenKinetics.Interfaces.Reversible;
partial model OneWay "Irreversible Reaction"
  extends UnspecifiedReversibility;
  parameter Units.ReactionCoef Vfwdmax = 1 "maximal forward reaction rate";
end OneWay;
