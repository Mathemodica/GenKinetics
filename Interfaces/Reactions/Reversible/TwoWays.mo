within GenKinetics.Interfaces.Reactions.Reversible;
partial model TwoWays "Reversible Reaction"
  extends GenKinetics.Interfaces.Reactions.Reversible.ReactionReversibility;
  extends GenKinetics.Icons.TwoWays;
  extends Reversibility(Reversible = true);
end TwoWays;
