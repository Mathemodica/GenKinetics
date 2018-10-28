within GenKinetics.Reactions.Convenience.Dynamic;
model ActIrrKinetic "S1 + S2 + ... ==A1,A2,...==> P1 + P2 + ... "
  extends GenKinetics.Reactions.Convenience.IrrReactionTerm( redeclare final
      model       Modifiers = Convenience.ActivationTerm(redeclare final model Inhibition =
        Interfaces.Dynamic.Modifier.NoInhibition),
      redeclare final model Reversibility = Interfaces.Reversible.OneWay);
equation
  v = A * S1 / S2;
end ActIrrKinetic;
