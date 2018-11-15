within GenKinetics.Interfaces.Reactions.Basics.Base.Modifier;
model NoActivation
  extends
    GenKinetics.Interfaces.Reactions.Basics.Base.Modifier.ReactionActivation(
      redeclare final parameter Integer NA=0);
end NoActivation;
