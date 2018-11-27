within GenKinetics.Interfaces.Reactions;
partial model Ub "S == P1 + P2"

  extends Reactions.Basics.ReactionConnections;
  extends GenKinetics.Interfaces.Reactions.Basics.OneSubstrate;
  extends GenKinetics.Interfaces.Reactions.Basics.TwoProducts;

end Ub;
