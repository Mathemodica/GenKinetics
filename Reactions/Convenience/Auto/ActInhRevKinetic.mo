within GenKinetics.Reactions.Convenience.Auto;
model ActInhRevKinetic "S1 + S2 + ...  <==I1,I2,...==> P1 + P2 + ... "
  extends GenKinetics.Reactions.Convenience.RevReactionTerm(redeclare final
      model Modifiers = Convenience.ActivationAndInhibitionTerms, redeclare
      final model Reversibility =
        Interfaces.Reactions.Basics.Reversible.TwoWays);
equation
  v = A * I * (S1 - P1) / (S2 + P2 - 1);
end ActInhRevKinetic;
