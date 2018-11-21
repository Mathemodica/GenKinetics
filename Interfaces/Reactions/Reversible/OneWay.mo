within GenKinetics.Interfaces.Reactions.Reversible;
partial model OneWay "Irreversible Reaction"
  extends GenKinetics.Interfaces.Reactions.Reversible.ReactionReversibility;
  extends GenKinetics.Icons.OneWay;
  extends Reversibility(Reversible = false);
end OneWay;
