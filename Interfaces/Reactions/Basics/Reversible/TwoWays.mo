within GenKinetics.Interfaces.Reactions.Basics.Reversible;
partial model TwoWays "Reversible Reaction"
  extends
    GenKinetics.Interfaces.Reactions.Basics.Reversible.ReactionReversibility;
  extends GenKinetics.Icons.TwoWays;
  extends Reversibility(Reversible = true);
end TwoWays;
