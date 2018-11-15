within GenKinetics.Interfaces.Reactions.Modifiers.Base;
model Inhibitor
  extends GenKinetics.Interfaces.Reactions.Modifiers.Base.ReactionInhibition(
      redeclare final parameter Integer NI=1);
end Inhibitor;
