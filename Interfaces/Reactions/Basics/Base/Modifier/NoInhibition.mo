within GenKinetics.Interfaces.Reactions.Basics.Base.Modifier;
model NoInhibition
  extends
    GenKinetics.Interfaces.Reactions.Basics.Base.Modifier.ReactionInhibition(
      redeclare final parameter Integer NI=0);
end NoInhibition;
