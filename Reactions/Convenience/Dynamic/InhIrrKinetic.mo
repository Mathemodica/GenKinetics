within GenKinetics.Reactions.Convenience.Dynamic;
model InhIrrKinetic "S1 + S2 + ... ==I1,I2,...==> P1 + P2 + ... "
  extends GenKinetics.Reactions.Convenience.Dynamic.BasicIrrReaction(redeclare
      final model Modifiers = InhibitionTerm, redeclare final model Activation
      = Interfaces.Dynamic.Modifier.NoActivation);

equation
  v = I * S1 / S2;
end InhIrrKinetic;
