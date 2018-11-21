within GenKinetics.Reactions.Convenience.Auto;
model InhRevKinetic "S1 + S2 + ... <==I1,I2,...=> P1 + P2 + ... "
  extends GenKinetics.Reactions.Convenience.RevReactionTerm(redeclare final
      model Modifiers = Convenience.InhibitionTerm (redeclare final model
          Activation = Interfaces.Reactions.Modifiers.Auto.NoActivation),
      redeclare final model Reversibility =
        Interfaces.Reactions.Reversible.TwoWays);
equation
  v = I * (S1 - P1) / (S2 + P2 - 1);
end InhRevKinetic;
