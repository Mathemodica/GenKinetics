within GenKinetics.Reactions.Convenience.Dynamic;
model RevKinetic "S1 + S2 + ... <===> P1 + P2 + ... "
    extends GenKinetics.Reactions.Convenience.Dynamic.RevReactionTerm;
equation
  v = (S1 - P1) / (S2 + P2 - 1);
end RevKinetic;
