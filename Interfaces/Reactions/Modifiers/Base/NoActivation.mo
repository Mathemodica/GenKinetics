within GenKinetics.Interfaces.Reactions.Modifiers.Base;
model NoActivation
  extends GenKinetics.Interfaces.Reactions.Modifiers.Base.ReactionActivation(
      redeclare final parameter Integer NA=0);
end NoActivation;
