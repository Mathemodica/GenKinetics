within GenKinetics.Reactions;
partial model BasicIrrReaction
  "basic declaration of an irreversible reaction "
  extends GenKinetics.Reactions.BasicReaction(redeclare replaceable model
      Reversibility =
     Interfaces.Reversible.OneWay);
end BasicIrrReaction;
