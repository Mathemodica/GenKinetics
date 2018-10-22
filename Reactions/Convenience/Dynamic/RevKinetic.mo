within GenKinetics.Reactions.Convenience.Dynamic;
model RevKinetic "S1 + S2 + ... <===> P1 + P2 + ... "
  extends GenKinetics.Reactions.Convenience.Dynamic.BasicRevReaction(redeclare
      final model Activation = Interfaces.Dynamic.Modifier.NoActivation,
      redeclare final model Inhibition =
        Interfaces.Dynamic.Modifier.NoInhibition);
equation
  v = (S1 - P1) / (S2 + P2 - 1);
end RevKinetic;
