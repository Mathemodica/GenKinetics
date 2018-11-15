within GenKinetics.Interfaces.Reactions.Modifiers.Auto;
model TwoInhibitors
  extends GenKinetics.Interfaces.Reactions.Modifiers.Auto.ReactionInhibition(
      redeclare final parameter Integer NI=2);
end TwoInhibitors;
