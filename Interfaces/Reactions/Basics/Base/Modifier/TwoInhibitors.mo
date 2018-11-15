within GenKinetics.Interfaces.Reactions.Basics.Base.Modifier;
model TwoInhibitors
  extends
    GenKinetics.Interfaces.Reactions.Basics.Base.Modifier.ReactionInhibition(
      redeclare final parameter Integer NI=2);
end TwoInhibitors;
