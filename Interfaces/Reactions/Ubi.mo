within GenKinetics.Interfaces.Reactions;
partial model Ubi "Interface for S => P1 + P2"
  import GenKinetics;
  extends Ub;
  extends GenKinetics.Interfaces.Reactions.Reversible.OneWay;
end Ubi;
