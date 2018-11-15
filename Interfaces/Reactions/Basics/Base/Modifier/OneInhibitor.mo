within GenKinetics.Interfaces.Reactions.Basics.Base.Modifier;
model OneInhibitor
  extends
    GenKinetics.Interfaces.Reactions.Basics.Base.Modifier.ReactionInhibition(
      redeclare final parameter Integer NI=1);
end OneInhibitor;
