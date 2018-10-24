within GenKinetics.Reactions.Convenience.Dynamic;
model ActInhIrrKinetic "S1 + S2 + ...  ==I1,I2,...==> P1 + P2 + ... "
  extends GenKinetics.Reactions.Convenience.Dynamic.BasicIrrReaction(
    redeclare final model Modifiers =
        Reactions.Convenience.Dynamic.ActivationAndInhibitionTerms);
equation
  v = A * I * S1 / S2;
end ActInhIrrKinetic;
