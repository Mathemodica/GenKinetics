within GenKinetics.Reactions.Convenience.Dynamic;
model InhIrrKinetic "S1 + S2 + ... ==I1,I2,...==> P1 + P2 + ... "
  extends GenKinetics.Reactions.Convenience.IrrReactionTerm(redeclare
      replaceable model Modifiers = Convenience.InhibitionTerm (redeclare
          final model Activation = Interfaces.Dynamic.Modifier.NoActivation),
      redeclare final model Reversibility =
        Interfaces.Reactions.Reversible.OneWay);

equation

  v = I * S1 / S2;

end InhIrrKinetic;
