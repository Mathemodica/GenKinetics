within GenKinetics.Reactions.Convenience.Dynamic;
model IrrKinetic "S1 + S2 + ... => P1 + P2 + ... "
  // extends GenKinetics.Reactions.Convenience.Dynamic.IrrReactionTerm;
  extends GenKinetics.Reactions.Convenience.IrrReactionTerm(redeclare final
      model Reversibility =      Interfaces.Reversible.OneWay);
equation
  v = S1 / S2;
end IrrKinetic;
