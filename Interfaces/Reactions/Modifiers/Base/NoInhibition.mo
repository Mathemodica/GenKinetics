within GenKinetics.Interfaces.Reactions.Modifiers.Base;
model NoInhibition
  extends GenKinetics.Interfaces.Reactions.Modifiers.Base.ReactionInhibition(
      redeclare final parameter Integer NI=0);
end NoInhibition;
