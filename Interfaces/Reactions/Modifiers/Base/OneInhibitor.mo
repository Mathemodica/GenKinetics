within GenKinetics.Interfaces.Reactions.Modifiers.Base;
model OneInhibitor
  extends GenKinetics.Interfaces.Reactions.Modifiers.Base.ReactionInhibition(
      redeclare final parameter Integer NI=1);
end OneInhibitor;
