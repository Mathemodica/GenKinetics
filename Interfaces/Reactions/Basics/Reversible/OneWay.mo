within GenKinetics.Interfaces.Reactions.Basics.Reversible;
partial model OneWay "Irreversible Reaction"
  extends
    GenKinetics.Interfaces.Reactions.Basics.Reversible.ReactionReversibility;
  extends
    GenKinetics.Icons.OneWay;
  extends Reversibility(Reversible = false);
end OneWay;
