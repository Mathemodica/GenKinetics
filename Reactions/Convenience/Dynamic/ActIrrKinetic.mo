within GenKinetics.Reactions.Convenience.Dynamic;
model ActIrrKinetic "S1 + S2 + ... ==A1,A2,...==> P1 + P2 + ... "
  extends GenKinetics.Reactions.Convenience.Dynamic.BasicIrrReaction(redeclare
      final model Modifiers = ActivationTerm, redeclare final model Inhibition =
        Interfaces.Dynamic.Modifier.NoInhibition);
equation
  v = A * S1 / S2;
end ActIrrKinetic;
