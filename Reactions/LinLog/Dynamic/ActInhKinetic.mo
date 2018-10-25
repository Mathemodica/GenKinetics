within GenKinetics.Reactions.LinLog.Dynamic;
model ActInhKinetic
  "S1 + S2 + .. + A1 + A2 + .. + I1 + I2 + .. =?= P1 + P2 ´+ ... "
  extends ReactionTerm(redeclare final model Modifiers =
        ActivationAndInhibitionTerms);
equation
  v = v_steady + R + A + I;
end ActInhKinetic;
