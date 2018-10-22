within GenKinetics.Reactions.Convenience.Dynamic;
model ActInhRevKinetic "S1 + S2 + ...  <==I1,I2,...==> P1 + P2 + ... "
  extends GenKinetics.Reactions.Convenience.Dynamic.BasicRevReaction(
    redeclare final model Modifier =
        Reactions.Convenience.Dynamic.BasicActivatorAndInhibitor);
equation
  v = A * I * (S1 - P1) / (S2 + P2 - 1);
end ActInhRevKinetic;
