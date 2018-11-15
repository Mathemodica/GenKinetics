within GenKinetics.Interfaces.Reactions.Modifiers.Auto;
model Inhibitor
  extends GenKinetics.Interfaces.Reactions.Modifiers.Auto.ReactionInhibition(
      redeclare final parameter Integer NI=1);
end Inhibitor;
