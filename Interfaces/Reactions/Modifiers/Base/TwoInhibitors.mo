within GenKinetics.Interfaces.Reactions.Modifiers.Base;
model TwoInhibitors
  extends GenKinetics.Interfaces.Reactions.Modifiers.Base.ReactionInhibition(
      redeclare final parameter Integer NI=2);
end TwoInhibitors;
