within GenKinetics.Interfaces.Reactions;
partial model Bu "S1 + S2 == P"

  extends Reactions.Basics.ReactionConnections;
  extends GenKinetics.Interfaces.Reactions.Basics.TwoSubstrates;
  extends GenKinetics.Interfaces.Reactions.Basics.OneProduct;

end Bu;
