within GenKinetics.Interfaces.Reactions.Modifiers.Auto;
model NoActivation
  extends GenKinetics.Interfaces.Reactions.Modifiers.Auto.ReactionActivation(
      redeclare final parameter Integer NA=0);
end NoActivation;
