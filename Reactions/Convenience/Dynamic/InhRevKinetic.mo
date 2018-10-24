within GenKinetics.Reactions.Convenience.Dynamic;
model InhRevKinetic "S1 + S2 + ... <==I1,I2,...=> P1 + P2 + ... "
  extends GenKinetics.Reactions.Convenience.Dynamic.BasicRevReaction(redeclare
      final model Modifiers = InhibitionTerm,  redeclare final model Activation =
        Interfaces.Dynamic.Modifier.NoActivation);
equation
  v = I * (S1 - P1) / (S2 + P2 - 1);
end InhRevKinetic;
