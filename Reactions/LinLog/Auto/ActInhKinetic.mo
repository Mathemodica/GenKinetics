within GenKinetics.Reactions.LinLog.Auto;
model ActInhKinetic
  "S1 + S2 + .. + A1 + A2 + .. + I1 + I2 + .. =?= P1 + P2 ´+ ... "
  import GenKinetics;
  extends GenKinetics.Reactions.LinLog.ReactionTerm(redeclare final model
      Modifiers = GenKinetics.Reactions.LinLog.ActivationAndInhibitionTerms);
equation
  v = v_steady + R + A + I;
end ActInhKinetic;
