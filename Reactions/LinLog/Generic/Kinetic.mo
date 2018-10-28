within GenKinetics.Reactions.LinLog.Generic;
model Kinetic
  "S1 + S2 + .. + A1 + A2 + .. + I1 + I2 + .. =?= P1 + P2 ´+ ... "
  extends GenKinetics.Reactions.LinLog.ReactionTerm(redeclare final model
      Modifiers = GenKinetics.Reactions.LinLog.ActivationAndInhibitionTerms);
equation
  v = v_steady + R + A + I;
end Kinetic;
