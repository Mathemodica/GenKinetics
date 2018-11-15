within GenKinetics.Interfaces.Reactions.Modifiers.Auto;
model NoInhibition
  extends GenKinetics.Interfaces.Reactions.Modifiers.Auto.ReactionInhibition(
      redeclare final parameter Integer NI=0);
end NoInhibition;
