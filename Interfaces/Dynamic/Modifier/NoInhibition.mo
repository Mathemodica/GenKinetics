within GenKinetics.Interfaces.Dynamic.Modifier;
model NoInhibition
  extends GenKinetics.Interfaces.Dynamic.Modifier.ReactionInhibition(redeclare final parameter Integer NI = 0);
end NoInhibition;
