within GenKinetics.Reactions.Convenience.Dynamic;
model ActInhIrrKinetic "S1 + S2 + ...  ==I1,I2,...==> P1 + P2 + ... "
  extends GenKinetics.Reactions.Convenience.Dynamic.BasicIrrReaction(
    redeclare final model Modifier =
        Reactions.Convenience.Dynamic.BasicActivatorAndInhibitor);
equation
  v = A * I * S1 / S2;
end ActInhIrrKinetic;
