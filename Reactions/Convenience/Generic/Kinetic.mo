within GenKinetics.Reactions.Convenience.Generic;
model Kinetic "S1 + S2 + ...  <==I1,I2,...==> P1 + P2 + ... "
    extends GenKinetics.Interfaces.Reactions.Reversible.Reversibility;

  extends GenKinetics.Reactions.Convenience.RevReactionTerm(redeclare final
      model Modifiers =
        GenKinetics.Reactions.Convenience.ActivationAndInhibitionTerms);

equation
  if Reversible then
    v = A * I * (S1 - P1) / (S2 + P2 - 1);
  else
    v = A * I * S1 / S2;
  end if;
end Kinetic;
