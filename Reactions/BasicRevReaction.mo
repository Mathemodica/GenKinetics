within GenKinetics.Reactions;
partial model BasicRevReaction
  "basic declaration of a reversible reaction "
  extends BasicIrrReaction(redeclare final model Reversibility =
        Interfaces.Reactions.Reversible.TwoWay);
end BasicRevReaction;
