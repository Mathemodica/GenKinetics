within GenKinetics.Reactions.Convenience.Dynamic;
model ActRevKinetic "S1 + S2 + ...  <==A1,A2,...==> P1 + P2 + ... "
  extends GenKinetics.Reactions.Convenience.Dynamic.BasicRevReaction(redeclare
      final model Modifier = BasicActivator, redeclare final model Inhibition
      = Interfaces.Dynamic.Modifier.NoInhibition);
equation
  v = A * (S1 - P1) / (S2 + P2 - 1);
end ActRevKinetic;
